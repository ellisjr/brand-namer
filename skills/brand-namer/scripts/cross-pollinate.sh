#!/usr/bin/env bash
# cross-pollinate.sh — run a cross-pollination prompt through the Codex CLI (OpenAI models)
# and print the model's final answer, so the main session can merge it without copy and paste.
#
# Usage:
#   bash cross-pollinate.sh [-o output-file] [-m model] prompt-file
#   bash cross-pollinate.sh prompt.md > codex-round-1.md
#
# Options:
#   -o FILE   also write the final answer to FILE (default: print to stdout only)
#   -m MODEL  override the model in the user's Codex config (default: whatever ~/.codex/config.toml says)
#
# Behaviour:
#   - Runs `codex exec` non-interactively with a read-only sandbox and no persisted session, so the
#     run cannot touch files and leaves nothing behind in ~/.codex/sessions.
#   - Works from any directory: the Git-repository check is skipped because brand-namer-output/ is
#     often outside a repository.
#   - Model and reasoning effort come from the user's own Codex config unless -m is given; the skill
#     does not pick a model for them.
#   - Codex's own transcript (model, token count, session id) goes to stderr; only the final answer
#     goes to stdout, so `> file` captures exactly what the model returned.
#
# Exit codes: 0 answer written; 2 usage error; 3 codex not installed; other: codex's own exit code
# (most often a sign-in problem — run `codex login` once in a terminal).
#
# Test by hand after editing: a prompt file reading "Reply with exactly the three words: codex test ok"
# must print those three words and exit 0; a missing prompt file must exit 2; with codex absent from
# PATH the script must exit 3 with a message naming the install.

set -u

OUT=""
MODEL=""

while getopts ":o:m:" opt; do
  case "$opt" in
    o) OUT="$OPTARG" ;;
    m) MODEL="$OPTARG" ;;
    *) echo "usage: $0 [-o output-file] [-m model] prompt-file" >&2; exit 2 ;;
  esac
done
shift $((OPTIND - 1))

PROMPT="${1:-}"
if [ -z "$PROMPT" ] || [ ! -r "$PROMPT" ]; then
  echo "usage: $0 [-o output-file] [-m model] prompt-file   (prompt file missing or unreadable)" >&2
  exit 2
fi

if ! command -v codex >/dev/null 2>&1; then
  echo "codex CLI not found on PATH. Install with: npm install -g @openai/codex   (or: brew install codex), then run: codex login" >&2
  exit 3
fi

TMP_OUT="$(mktemp "${TMPDIR:-/tmp}/cross-pollinate.XXXXXX")"
trap 'rm -f "$TMP_OUT"' EXIT

ARGS=(exec --skip-git-repo-check --ephemeral -s read-only --color never -o "$TMP_OUT")
if [ -n "$MODEL" ]; then
  ARGS+=(-m "$MODEL")
fi
ARGS+=(-)

# Codex prints its running transcript to stdout; send that to stderr so stdout holds only the answer.
codex "${ARGS[@]}" < "$PROMPT" 1>&2
STATUS=$?

if [ "$STATUS" -ne 0 ]; then
  echo "codex exec exited with status $STATUS (not signed in? run: codex login)" >&2
  exit "$STATUS"
fi

if [ ! -s "$TMP_OUT" ]; then
  echo "codex returned no final message" >&2
  exit 1
fi

cat "$TMP_OUT"
if [ -n "$OUT" ]; then
  cp "$TMP_OUT" "$OUT"
fi

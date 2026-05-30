#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPT="$ROOT_DIR/scripts/oh-my-waist-heartbeat"

if [[ ! -x "$SCRIPT" ]]; then
  echo "Expected executable helper at scripts/oh-my-waist-heartbeat" >&2
  exit 1
fi

output="$("$SCRIPT" --once --stdout)"

case "$output" in
  "✶ Oh my waist："*) ;;
  *)
    echo "Expected default stdout reminder to start with Chinese TUI label" >&2
    echo "$output" >&2
    exit 1
    ;;
esac

if [[ "$output" != *"站起来"* && "$output" != *"转转腰"* ]]; then
  echo "Expected default reminder body to be Chinese movement copy" >&2
  echo "$output" >&2
  exit 1
fi

help="$("$SCRIPT" --help)"

for expected in "--interval-minutes" "--once" "--stdout"; do
  if [[ "$help" != *"$expected"* ]]; then
    echo "Expected help to mention $expected" >&2
    echo "$help" >&2
    exit 1
  fi
done

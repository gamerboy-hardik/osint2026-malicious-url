#!/usr/bin/env bash
# ==============================================================================
#  SCANTOTAL // Linux & WSL Terminal CLI Launcher
# ==============================================================================

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
node "$DIR/cli.js" "$@"

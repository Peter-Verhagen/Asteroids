#!/usr/bin/env bash
set -euo pipefail
#
# Start virtual display if not already running
if ! pgrep -x Xvfb >/dev/null 2>&1; then
  Xvfb :99 -screen 0 1024x768x24 >/dev/null 2>&1 &
    sleep 0.5
    fi

    export DISPLAY=:99
    export XDG_RUNTIME_DIR=/tmp/$USER-runtime
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
    export SDL_AUDIODRIVER=dummy

    uv run main.py

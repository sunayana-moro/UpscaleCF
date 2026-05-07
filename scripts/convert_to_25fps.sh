#!/usr/bin/env bash

set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <input-video> <output-video>"
  echo "Example: $0 input.mp4 output_25fps.mp4"
  exit 1
fi

INPUT="$1"
OUTPUT="$2"
FPS=25

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "Error: ffmpeg is not installed. Install ffmpeg and try again." >&2
  exit 2
fi

ffmpeg -y -i "$INPUT" -r "$FPS" -c:v libx264 -preset fast -crf 18 -c:a copy "$OUTPUT"

echo "Converted '$INPUT' to 25 fps: '$OUTPUT'"

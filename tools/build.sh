#!/bin/bash
# wav (Gemini TTS) → mp3 для GitHub Pages. usage: tools/build.sh <папка с wav> <куда> [atempo]
set -e; IN="$1"; OUT="$2"; TEMPO="${3:-0.85}"; mkdir -p "$OUT"; n=0
for f in "$IN"/*.wav; do id=$(basename "$f" .wav)
  ffmpeg -v error -y -i "$f" -af "silenceremove=start_periods=1:start_threshold=-45dB:start_silence=0.10,areverse,silenceremove=start_periods=1:start_threshold=-45dB:start_silence=0.20,areverse,atempo=$TEMPO,loudnorm=I=-16:TP=-1.5:LRA=11" -ac 1 -ar 24000 -c:a libmp3lame -b:a 64k "$OUT/$id.mp3" && n=$((n+1))
done; echo "mp3: $n → $OUT (atempo=$TEMPO)"

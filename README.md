# oge-audio — живые записи эталонов для тренажёра ОГЭ/ЕГЭ Speak & Smile

Аудио для раздела «Говорение» тренажёра (speakandsmile.online). Раздаётся через GitHub Pages:
`https://osintsova-dot.github.io/oge-audio/speaking/oge/<zid>.mp3` — zid совпадает с `data/oge_speaking.json` → `read[].zid`.

Голос: Gemini TTS `gemini-2.5-flash-preview-tts`, Aoede (британский, неспешный), затем ffmpeg: обрезка тишины,
замедление atempo (экзаменационный темп ~110 слов/мин), loudnorm −16 LUFS, mp3 mono 24 кГц.
Генератор и сборка: `tools/build.sh` (wav из scratchpad → mp3 сюда).

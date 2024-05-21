#!/bin/bash

# Use the current directory as the root folder
ROOT_FOLDER="$(pwd)"

# Find all .wav files and convert them
find "$ROOT_FOLDER" -type f -name "*.wav" -exec bash -c '
  for file do
    echo "Converting $file..."
    ffmpeg -i "$file" -ar 24000 "${file%.wav}_temp.wav" && mv "${file%.wav}_temp.wav" "$file"
  done
' bash {} +

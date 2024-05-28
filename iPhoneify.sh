#!/bin/bash

# iPhoneify: Convert all videos in the current directory and subdirectories to iPhone compatible format
# Usage: ./iPhoneify.sh [-d]
#   -d    Delete original files if the conversion was successful

delete_originals=false

# Parse command line options
while getopts ":d" opt; do
  case ${opt} in
    d )
      delete_originals=true
      ;;
    \? )
      echo "Usage: $0 [-d]"
      exit 1
      ;;
  esac
done

# Function to convert video
convert_video() {
  local input_file="$1"
  local output_file="${input_file%.*}_iphone.mp4"

  ffmpeg -i "$input_file" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 128k "$output_file"

  if [ $? -eq 0 ]; then
    echo "Successfully converted: $input_file to $output_file"
    if $delete_originals; then
      rm "$input_file"
      echo "Deleted original file: $input_file"
    fi
  else
    echo "Failed to convert: $input_file"
  fi
}

# Export the function and variable to be used by find command
export -f convert_video
export delete_originals

# Find and convert all video files in the current directory and subdirectories, handling spaces
find . -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.flv" -o -iname "*.webm" -o -iname "*.mpg" -o -iname "*.mpeg" -o -iname "*.wmv" -o -iname "*.m4v" -o -iname "*.3gp" -o -iname "*.ts" \) -print0 | xargs -0 -I {} bash -c 'convert_video "$@"' _ {}

echo "All videos have been processed."

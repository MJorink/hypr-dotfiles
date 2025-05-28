#!/bin/bash

# Open file picker to select multiple .mp4 files using zenity
input_files=$(zenity --file-selection --title="Select video files" --file-filter="*.mp4" --multiple)

# Check if files were selected
if [ -z "$input_files" ]; then
  notify-send "Error" "No files selected, exiting."
  exit 1
fi

# Convert each selected .mp4 file
IFS="|" # Set internal field separator to "|" to handle multiple files
for input_file in $input_files; do
  # Check if the file exists and is an .mp4
  if [ ! -f "$input_file" ]; then
    notify-send "Error" "Selected file '$input_file' is not a valid file!"
    continue
  fi

  # Send notification that the conversion is starting with a stop button
  stop_script=false
  notification_id=$(notify-send --urgency=low --title="Conversion in Progress" \
                                 --text="Converting $input_file to .gif..." \
                                 --hint=string:transient:1 \
                                 --button="Cancel:1")

  # Function to handle cancellation button press
  on_cancel() {
    stop_script=true
  }

  trap on_cancel SIGINT SIGTERM

  # Convert the .mp4 to .gif using ffmpeg and gifski
  output_gif="${input_file%.mp4}.gif"
  ffmpeg -i "$input_file" -f yuv4mpegpipe - | gifski -o "$output_gif" - --width=2560>/dev/null &

  # Get the process ID of the conversion
  pid=$!
  
  # Periodically check if user wants to stop the script
  while kill -0 $pid 2>/dev/null && [ "$stop_script" != true ]; do
      notify-send "Conversion Progress" "Still converting $input_file..." \
                  --urgency=low --hint=string:transient:1
      sleep 15  # Update every 15 seconds
  done

  # If the script was cancelled, stop the process
  if [ "$stop_script" == true ]; then
    kill $pid
    notify-send "Conversion Cancelled" "Conversion of $input_file was cancelled."
    continue
  fi

  # Check if the conversion was successful
  if [ $? -eq 0 ]; then
      notify-send "Conversion Complete" "Conversion complete: $output_gif" \
                  --urgency=low
  else
      notify-send "Error" "Conversion of $input_file failed." --urgency=critical
      continue
  fi

  # Send notification that the file is being moved
  notify-send "Moving Wallpaper" "Moving $output_gif to $HOME/.config/wallpapers..." \
              --urgency=low --hint=string:transient:1

  # Move the .gif to $HOME/.config/wallpapers
  target_dir="$HOME/.config/wallpapers"
  mkdir -p "$target_dir"
  mv "$output_gif" "$target_dir"

  # Send final notification confirming the file has been moved
  notify-send "Wallpaper Set" "Wallpaper moved to: $target_dir/$(basename "$output_gif")" \
              --urgency=low

  echo "Conversion and moving complete for $input_file."
done

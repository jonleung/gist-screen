#!/bin/sh

# cd into the directory this script is contained in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# Generate filename
name=$(date "+screencapture_%H-%M-%S%p%a_%m-%d-%Y")
filename=${name}.mov

# End  screen recording
osascript screen_recording_end.applescript $name

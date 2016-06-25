folder="/Volumes/h/Dropbox (Personal)/screenshots/"
title=$(date "+%Y-%m-%d@%H-%M-%S%p")
filename="$title.png"

cd "$folder"

screencapture -i "$filename"
gistup --private --no-open -- "$filename"
rm -rf .git

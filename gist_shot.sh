MY_SCREENSHOTS_FOLDER_PATH="/Volumes/h/Dropbox (Personal)/screenshots/"

title=$(date "+Screenshot %H:%M:%S%p on %a, %m-%d-%Y")
filename="$title.png"

cd "$MY_SCREENSHOTS_FOLDER_PATH"
rm -rf .git

screencapture -i "$filename"

osascript -e 'display notification "" with title "Uploading Screenshot..."'

gistup --private --no-open -- "$filename"

repo_hash=$(git remote get-url origin | egrep -o '[0-9a-f]{5,40}')
commit_hash=$(git rev-parse HEAD)
url=https://gist.githubusercontent.com/jonleung/$repo_hash/raw/$commit_hash/$filename

echo $url | pbcopy

osascript -e 'display notification "The URL of your screenshot has been copied to your clipboard!" with title "Screenshot URL Copied to Clipboard!" sound name "Submarine"'

rm -rf .git

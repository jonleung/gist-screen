title=$(date "+%Y-%m-%d@%H-%M-%S%p")
MY_SCREENSHOTS_FOLDER_PATH="/Volumes/h/Dropbox (Personal)/screenshots/"

filename="$title.png"

cd "$MY_SCREENSHOTS_FOLDER_PATH"
rm -rf .git

screencapture -i "$filename"
gistup --private --no-open -- "$filename"

repo_hash=$(git remote get-url origin | egrep -o '[0-9a-f]{5,40}')
commit_hash=$(git rev-parse HEAD)
url=https://gist.githubusercontent.com/jonleung/$repo_hash/raw/$commit_hash/$filename

echo $url | pbcopy

rm -rf .git

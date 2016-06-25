folder="/Volumes/h/Dropbox (Personal)/screenshots/"
title=$(date "+%Y-%m-%d@%H-%M-%S%p")
filename="$title.png"

cd "$folder"
rm -rf .git

screencapture -i "$filename"
gistup --private --no-open -- "$filename"

repo_hash=$(git remote get-url origin | egrep -o '[0-9a-f]{5,40}')
commit_hash=$(git rev-parse HEAD)
url=https://gist.githubusercontent.com/jonleung/$repo_hash/raw/$commit_hash/$filename

echo $url | pbcopy

rm -rf .git

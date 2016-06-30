# cd into the directory this script is contained in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# Generate filename
name=$(date "+screencapture_%H-%M-%S%p%a_%m-%d-%Y")
filename=${name}.mov

# End  screen recording
osascript screen_recording_end.applescript $name

# Add the NPM modules to the $PATH
PATH="/usr/local/bin:$PATH"

# Create and cd into ~/Desktop/screenshots
desktop_path="/Users/$(whoami)/Desktop"
cd $desktop_path
mkdir screenshots > /dev/null 2>&1
MY_SCREENSHOTS_FOLDER_PATH=$desktop_path/screenshots
cd $MY_SCREENSHOTS_FOLDER_PATH

# Upload gist
gistup --private --no-open -- "$filename"

# Calculate the URL
repo_hash=$(git remote get-url origin | egrep -o '[0-9a-f]{5,40}')
commit_hash=$(git rev-parse HEAD)
long_url=https://gist.githubusercontent.com/jonleung/$repo_hash/raw/$commit_hash/$filename

# Shorten to git.io URL
short_url=$(curl -i https://git.io -F "url=$long_url" | grep Location: | egrep -o 'https.*')

# Copy git.io URL
echo $short_url | pbcopy

# Notification: Finished
osascript -e 'display notification "The URL of your screenshot has been copied to your clipboard!" with title "Screenshot URL Copied to Clipboard!" sound name "Submarine"'

# Remove git repository
rmtrash .git repository

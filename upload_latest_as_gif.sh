# Add the NPM modules to the $PATH
PATH="/usr/local/bin:$PATH"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

gifenc=$(printf '%q\n' "$DIR/gifenc.sh")
upload_newest_file=$(printf '%q\n' "$DIR/upload_newest_file.sh")



# Create and cd into ~/Desktop/screenshots
desktop_path="/Users/$(whoami)/Desktop"
cd $desktop_path
mkdir screenshots > /dev/null 2>&1
MY_SCREENSHOTS_FOLDER_PATH=$desktop_path/screenshots
cd $MY_SCREENSHOTS_FOLDER_PATH

# Get Latest File
filename=$(ls -t | head -1)

# Convert Latest File To gif
eval "$gifenc $filename $filename.gif"

# Upload Latest File
eval $upload_newest_file

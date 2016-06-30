activate application "QuickTime Player"
delay 0.35
tell application "System Events"
	tell process "QuickTime Player"
		click menu item "New Screen Recording" of menu "File" of menu bar 1
		delay 0.35
		tell application "System Events" to key code 49 # space bar (starts the recording)
	end tell
end tell

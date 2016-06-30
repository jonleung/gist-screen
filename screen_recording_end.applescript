on run filename

	activate application "QuickTime Player"
	delay 1
	tell application "System Events"
		tell process "QuickTime Player"
			delay 1

			# Exit "screen recording view by pressing the "ESC" key
			tell application "System Events" to key code 53 # escape key (ends the recording)
			delay 1

			# Stop the screen recording by press the "SPACEBAR" key
			tell application "System Events" to key code 49
			delay 1

			# Click menu item "Save..." of menu "File" of menu bar 1
			keystroke "s" using {command down}
			delay 2

			# Navigate to `~/Desktop/screenshots`
			keystroke "g" using {command down, shift down}
			delay 1

			keystroke "~/Desktop/screenshots/"
			delay 1

			tell application "System Events" to key code 76 # enter key (selects the `/screenshots` folder)
			delay 2

			# Name the movie
			keystroke filename
			delay 1

			tell application "System Events" to key code 76 # enter key (saves the movie)
			delay 1

		end tell
	end tell

	try
		tell application "QuickTime Player" to quit
	on error error_message number error_number
		if error_number is equal to -128 then
			--Keep Calm and Carry On
		else
			display dialog error_message
		end if
	end try

end run

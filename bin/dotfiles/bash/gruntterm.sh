#!/bin/sh

# Used for my grunt processes started via alias file
osascript <<EOF
tell app "Terminal"
    set custom title of first window to "GRUNT $@"
    set current settings of first window to settings set "Opaque Silver Aerogel"
end tell
EOF

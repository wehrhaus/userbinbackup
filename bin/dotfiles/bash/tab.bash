#!/bin/bash
#
# Open new Terminal tabs from the command line
#
# Author: Justin Hileman (http://justinhileman.com)
# Modifier: Justin Wehrman
#
# Installation:
#     Add the following function to your `.bashrc` or `.bash_profile`,
#     or save it somewhere (e.g. `~/.tab.bash`) and source it in `.bashrc`
#
# Usage:
#      tab /Downloads/ 'Downloads Dir' 'Pro' 'ls'
#     tab                   Opens the current directory in a new tab
#     tab [PATH] [Tab Title] [Theme] [CMD] Opens new tab with Tab Title and calls the command

# Only for teh Mac users
[ `uname -s` != "Darwin" ] && return

function tab () {
  local cmd=""
  local cdto="$PWD"

  local tabTitle="${2}"
  local profile="${3}"
  local args="${4}"

  local term=$TERM_PROGRAM

  if [ -d "$1" ]; then
    cdto=`cd "$1"; pwd`
    tabTitle="${2}"
    profile="${3}"
    args="${@:4}"
  fi

  if [ -n "$args" ]; then
    cmd="; $args"
  fi


  if [ $term == "Apple_Terminal" ]; then

    osascript 2>/dev/null -e "
      tell application \"Terminal\"
        activate
        tell application \"System Events\" to keystroke \"t\" using command down

        repeat while contents of selected tab of window 1 starts with linefeed
          delay 0.01
        end repeat

        set custom title of front window to \"$tabTitle\"
        set current settings of front window to (first settings set whose name is \"$profile\")
        do script \"cd \\\"$cdto\\\"$cmd\" in window 1
      end tell
    "

  elif [ $term == "iTerm.app" ]; then

    osascript 2>/dev/null -e "
      tell application \"iTerm\"
        tell current Terminal
          launch session \"Default Session\"

          tell the last session
            set name to \"$tabTitle\"
            write text \"cd \\\"$cdto\\\"$cmd\"
          end tell

        end tell
      end tell
    "

  fi

}

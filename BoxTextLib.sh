#!/bin/sh
# BoxTextLib.sh

# Author; Megaf <mmegaf@gmail.com>, <https://github.com/Megaf>,
# Creation date: 03 - April - 2022
# License: GNU General Public License v3.0

# Description:
# BoxTextLib.sh is a simple "lib" to help you display text in the terminal
# that will stand out from other text.
# You can use it to attract the users attention.

# Usage:
# To display a text message in the console using BoxTextLib.sh you simply replace
# "echo" or "printf" from your shell script with "./BoxTextLib.sh" or "./box"(TODO).
#
# For example, to show the message "test", you write in your code "./BoxTextLib.sh test".

# Styles:
# There are a number of styles available, the default is just a white/invisible box border..
# To pick a style you, you can either pass the style name as command argument or
# define the variable "style" to the string for the name of the style..
#
# For example:
# message="This is a Message." ./BoxTextLib.sh boxsolid
# The output will be:
# █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
# █  This is a Message.  █
# █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█
#
# Or, you can do: message="This is a message" style=boxsolid ./BoxTextLib.sh
# which will have the same effect.

# Say function.
# This function is used to "draw" the border around the text given by the $message variable.
say () {
  length=$(expr length "$message")

  spacesize="2" # Change this number to increase or decrease empty space before and after the message.
  linesize=$(expr $spacesize + $length + $spacesize)

  tput sgr0 # Clears terminal's colours and styles to default.

  # The lines below will print elements of the box and the variable $message.
  printf "$topleftcorner"; printf "%0.s$top" $(seq 1 $linesize); printf "$toprightcorner\n"
  printf "$leftside"; printf "%0.s " $(seq 1 $spacesize); tput bold; printf "$message"; tput sgr0; printf "%0.s " $(seq 1 $spacesize); printf "$rightside\n"
  printf "$bottomleftcorner"; printf "%0.s$bottom" $(seq 1 $linesize); printf "$bottomrightcorner\n"
}

# Ugly nested "if" conditions to define which style should be used.
if [ "$*" = "boxdoubleline" ] || [ "$style" = "boxdoubleline" ]
  then
    topleftcorner="╔"
    toprightcorner="╗"
    bottomleftcorner="╚"
    bottomrightcorner="╝"
    leftside="║"
    rightside="║"
    top="═"
    bottom="═"
  else
    if [ "$*" = "boxverticalsinglehorizontaldouble" ] || [ "$style" = "boxverticalsinglehorizontaldouble" ]
      then
        topleftcorner="╒"
        toprightcorner="╕"
        bottomleftcorner="╘"
        bottomrightcorner="╛"
        leftside="│"
        rightside="│"
        top="═"
        bottom="═"
      else
        if [ "$*" = "boxverticaldoublehorizontalsingle" ] || [ "$style" = "boxverticaldoublehorizontalsingle" ]
          then
          topleftcorner="╓"
          toprightcorner="╖"
          bottomleftcorner="╙"
          bottomrightcorner="╜"
          leftside="║"
          rightside="║"
          top="─"
          bottom="─"
        else
          if [ "$*" = "boxsingleline" ] || [ "$style" = "boxsingleline" ]
            then
            topleftcorner="┌"
            toprightcorner="┐"
            bottomleftcorner="└"
            bottomrightcorner="┘"
            leftside="│"
            rightside="│"
            top="─"
            bottom="─"
          else
            if [ "$*" = "boxsolid" ] || [ "$style" = "boxsolid" ]
              then
              topleftcorner="█"
              toprightcorner="█"
              bottomleftcorner="█"
              bottomrightcorner="█"
              leftside="█"
              rightside="█"
              top="▀"
              bottom="▄"
            fi
        fi
      fi
    fi
fi
# Calls "say" function to finally print the message with the box.
say

#!/bin/sh
# BoxTextLib.sh

# Author; Megaf
# Creation date: 03 - April - 2022
# License: GNU General Public License v3.0

# Description:
# BoxTextLib.sh is a simple "lib" to help you display text in the terminal
# that will stand out from other text.
# You can use it to attract the users attention.

# Use:
# There are a number of styles available, the default is just a white/invisible box.
# To pick a style you TODO.

say () {
  length=$(expr length "$message")

  spacesize="2"
  linesize=$(expr $spacesize + $length + $spacesize)

  tput sgr0

  printf "$topleftcorner"; printf "%0.s$top" $(seq 1 $linesize); printf "$toprightcorner\n"
  printf "$leftside"; printf "%0.s " $(seq 1 $spacesize); tput bold; printf "$message"; tput sgr0; printf "%0.s " $(seq 1 $spacesize); printf "$rightside\n"
  printf "$bottomleftcorner"; printf "%0.s$bottom" $(seq 1 $linesize); printf "$bottomrightcorner\n"
}

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
say

# Realm Resize
An AHK script that removes the caption and border of the Adobe Flash Projector or Steam client window and resizes it to the full height of the screen while keeping a 4:3 aspect ratio and confining the mouse to the window, optionally removing/readding the menu bar.

##Download and Setup

This script is currently only available as source code, as I am unable to get the script compiler to work. You will need AutoHotkey to run the script. I hope to be able to supply a standalone .exe version in the future.

###Running from source

* [Download the project's files
  here](https://github.com/Saiapatsu/realm-resize/zipball/master)
* Extract the archive to a folder of your choice
* Install [Autohotkey](http://ahkscript.org/) for Windows
* Run `realmresize.ahk` to initiate the script

##Usage

To resize a window, activate it and press <kbd>ctrl</kbd> + <kbd>F2</kbd>. Pressing this hotkey more will toggle the visibility (and usability, unfortunately) of the menu bar. If the window is not recognized as the Flash Projector or Steam client, then nothing happens.

To close the window, doubleclick or press <kbd>F</kbd> at the very top right of the window. This is to replace the big red X that went with the window caption.

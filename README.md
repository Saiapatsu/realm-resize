# Realm Resize
An AHK script that removes the caption and border of the Adobe Flash Projector or Steam client window and resizes it to the full height of the screen while keeping a 4:3 aspect ratio and confining the mouse to the window, optionally removing/readding the menu bar.

##Download and Setup

There are currently two options for using realm-resize: running the source script or using a compiled .exe of the script.

###Running from source

* [Download the project's files here](https://github.com/Saiapatsu/realm-resize/zipball/master)
* Extract the archive to a folder of your choice
* Install [Autohotkey](http://ahkscript.org/) for Windows
* Run `realmresize.ahk` to initiate the script

###Running the compiled .exe

* Visit [the releases page](https://github.com/Saiapatsu/realm-resize/releases) and download the latest compiled script's archive
* Extract the archive to a folder of your choice
* Run the included .exe

I cannot guarantee the absolute safety of the .exe file.

##Usage

To resize a window, activate it and press <kbd>ctrl</kbd> + <kbd>F2</kbd>. Pressing this hotkey more will toggle the visibility (and usability, unfortunately) of the menu bar. If the window is not recognized as the Flash Projector or Steam client, then nothing happens.

To close the window, doubleclick or press <kbd>F</kbd> at the very top right of the window. This is to replace the big red X that went with the window caption.

##Personal thanks

I'd like to thank:
* **[Nightfirecat](https://github.com/nightfirecat)** for a good bit of the text in this readme (I did not ask for permission) and a method to get the width of the menu bar
* **[serenityjazz](http://forum.cockos.com/showthread.php?t=58784)** on the Reaper forums for a way to hide the menu bar of a window
* **[x79animal](https://autohotkey.com/board/topic/61753-confining-mouse-to-a-window/)** on the AHK forums for a way to confine the mouse to a region on the screen

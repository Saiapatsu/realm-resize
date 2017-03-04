;Cheers to https://github.com/Nightfirecat/realmscript
;Cheers to http://forum.cockos.com/showthread.php?t=58784
;Cheers to https://autohotkey.com/board/topic/61753-confining-mouse-to-a-window/
;Cheers to the people who write the AHK manual

#NoEnv
#SingleInstance force ;makes iteration less tedious
SetWorkingDir %A_ScriptDir%

SetTitleMatchMode, 3
Loop, 20
	GroupAdd rotmg, % "Adobe Flash Player " A_Index + 9 ;projector
GroupAdd rotmg, Realm of the Mad God ;steam

global menuHeight, windowMenus
SysGet, menuHeight, 15
;associative array for keeping track of flash player windows
windowMenus := {}

OnExit("ExitFunc")
SetTimer, isActive, 0
return

isActive:
WinWaitActive ahk_group rotmg
;clip cursor
if windowMenus[WinExist("A")] != null
{
	WinGetPos, posx, posy, width, height, A
	ClipCursor(True, posx, posy, posx+width, posy+height)
}
WinWaitNotActive ahk_group rotmg
;unclip cursor
ClipCursor(False, 0, 0, 0, 0)
return

^F2::
IfWinActive, ahk_group rotmg
ToggleMenu()
return

ToggleMenu()
{
	;find active window handle in array / add to array if not found
	hWin := WinExist("A")
	if (windowMenus[hWin] = null)
	{
		;haven't seen this window before, let's first register it and remove its borders and caption
		windowMenus[hWin] := 0
		WinSet, Style, -0xC40000, ahk_id %hWin%
	}
	hMenu := windowMenus[hWin]
	if (hMenu = 0)
	{
		;store a reference to the window's menu in the array
		hMenu := DllCall("GetMenu", "uint", hWin)
		windowMenus[hWin] := hMenu

		;hide the menu by uncoupling it from the parent window
		DllCall("SetMenu", "uint", hWin, "uint", 0)
	} else {
		;show menu by recoupling it to the parent window
		DllCall("SetMenu", "uint", hWin, "uint", hMenu)
		hMenu := windowMenus[hWin] := 0
		
	}
	;resize the window
	xSiz := (A_ScreenHeight - (hMenu ? 0 : menuHeight)) * 4 / 3
	xPos := (A_ScreenWidth - xSiz)/2
	WinMove, ahk_id %hWin%,, xPos, 0, xSiz, A_ScreenHeight
	ClipCursor(True, xPos, 0, xPos+xSiz, A_ScreenHeight)
}

ClipCursor(Confine=True, x1=0, y1=0, x2=1, y2=1)
{
	VarSetCapacity(R,16,0), NumPut(x1,&R+0), NumPut(y1,&R+4), NumPut(x2,&R+8), NumPut(y2,&R+12)
	Return Confine ? DllCall("ClipCursor", UInt,&R) : DllCall("ClipCursor")
}

ExitFunc()
{
	;return the menus to the windows and restore their borders
	for hWin, hMenu in windowMenus
	{
		if hMenu
			DllCall("SetMenu", "uint", hWin, "uint", hMenu)
		WinSet, Style, +0xc40000, ahk_id %hWin%
		ClipCursor(False, 0, 0, 0, 0)
	}
}

---
title: Autohotkey实现鼠标双击桌面隐藏图标
tags: [Autohotkey]
categories: [Autohotkey]
date: 2022-12-25 20:30:00
excerpt: Some useful tools!
---
# Autohotkey 实现鼠标双击桌面隐藏图标

## 基本操作

有时候我们做教程或特殊情况下需要将桌面上密密麻麻的图标暂时隐藏，稍后又要让他显示，那能不能我们随心所欲得让他显示和隐藏呢?今天便给大家解决这一问题。

1、先下载安装autohotkey，大约2M左右很小，官方下载地址在下方提供 [网址](https://www.autohotkey.com/)

![](https://s2.loli.net/2022/12/25/jRLCWIlyhtMf9ro.png)

2、在随便一个地方创建txt文件，并将以下代码粘贴到txt里保存。最后更改`.txt`后缀为`.ahk`!

```css

; ===============================================================================================================================
; =====隐藏桌面图标：双击
; ===============================================================================================================================

#If IsDesktopUnderMouse()
~LButton::
	LButton_presses++
	if (LButton_presses=2)
		if (!IsObject(GetDesktopIconUnderMouse()) or DesktopIconsIsShow=0)
			DesktopIconsIsShow:=HideOrShowDesktopIcons()
	SetTimer, KeyLButton, -300
return

KeyLButton:
	LButton_presses := 0
return

IsDesktopUnderMouse()
{
	MouseGetPos, , , OutputVarWin
	WinGetClass, OutputVarClass, % "ahk_id" OutputVarWin
	if (OutputVarClass="WorkerW" or OutputVarClass="Progman")
		return, 1
	else
		return, 0
}

HideOrShowDesktopIcons()
{
	ControlGet, OutputVarHwnd, Hwnd,, SysListView321, ahk_class WorkerW
	if (OutputVarHwnd="")
      ControlGet, OutputVarHwnd, Hwnd,, SysListView321, ahk_class Progman

	if (DllCall("IsWindowVisible", UInt, OutputVarHwnd))
	{
		WinHide, ahk_id %OutputVarHwnd%
		return, 0
	}
	else
	{
		WinShow, ahk_id %OutputVarHwnd%
		return, 1
	}
}
#If
; ===============================================================================================================================
; GetDesktopIconUnderMouse()
; https://www.autohotkey.com/boards/viewtopic.php?p=260761
; Function:       Gets the desktop icon under the mouse. See the "Return values" section below for more information about the
;                 icon and associated file data retrieved.
; Parameters:     None
; Return values:  If there is an icon under the mouse, an associative array with the following keys:
;                 - left: the left position of the icon in screen coordinates
;                 - top: the top position of the icon in screen coordinates
;                 - right: the right position of the icon in screen coordinates
;                 - bottom: the bottom position of the icon in screen coordinates
;                 - name: the name of the file represented by the icon, e.g. New Text Document.txt
;                 - size: the size of the file represented by the icon, e.g. 1.72 KB. Note: this value is blank for folders
;                 - type: the type of the file represented by the icon, e.g. TXT File, JPEG image, File folder
;                 - date: the modified date of the file represented by the icon, e.g. 9/9/2016 10:39 AM
;                 Otherwise, a blank value
; Global vars:    None
; Dependencies:   None
; Tested with:    AHK 1.1.30.01 (A32/U32/U64)
; Tested on:      Win 7 (x64)
; Written by:     iPhilip
; ===============================================================================================================================

GetDesktopIconUnderMouse() {
	static MEM_COMMIT := 0x1000, MEM_RELEASE := 0x8000, PAGE_ReadWRITE := 0x04
		, PROCESS_VM_OPERATION := 0x0008, PROCESS_VM_READ := 0x0010
		, LVM_GETITEMCOUNT := 0x1004, LVM_GETITEMRECT := 0x100E

	Icon := ""
	MouseGetPos, x, y, hwnd
	if not (hwnd = WinExist("ahk_class Progman") || hwnd = WinExist("ahk_class WorkerW"))
		return
	ControlGet, hwnd, HWND, , SysListView321
	if not WinExist("ahk_id" hwnd)
		return
	WinGet, pid, PID
	if (hProcess := DllCall("OpenProcess" , "UInt", Process_VM_OPERATION|Process_VM_Read, "Int",  false, "UInt", pid)) {
		VarSetCapacity(iCoord, 16)
		SendMessage, %LVM_GETITEMCOUNT%, 0, 0
		loop, %ErrorLevel% {
			pItemCoord := DllCall("VirtualAllocEx", "Ptr", hProcess, "Ptr", 0, "UInt", 16, "UInt", MEM_COMMIT, "UInt", PAGE_ReadWRITE)
			SendMessage, %LVM_GETITEMRECT%, % A_Index-1, %pItemCoord%
			DllCall("ReadProcessMemory", "Ptr", hProcess, "Ptr", pItemCoord, "Ptr", &iCoord, "UInt", 16, "UInt", 0)
			DllCall("VirtualFreeEx", "Ptr", hProcess, "Ptr", pItemCoord, "UInt", 0, "UInt", MEM_RELEASE)
			left   := NumGet(iCoord,  0, "Int")
			top    := NumGet(iCoord,  4, "Int")
			Right  := NumGet(iCoord,  8, "Int")
			bottom := NumGet(iCoord, 12, "Int")
			if (left < x and x < Right and top < y and y < bottom) {
				ControlGet, list, List
				RegExMatch(StrSplit(list, "`n")[A_Index], "O)(.*)\t(.*)\t(.*)\t(.*)", Match)
				Icon := {left:left, top:top, Right:Right, bottom:bottom
					, name:Match[1], size:Match[2], type:Match[3]
				; Delete extraneous date characters (https://goo.gl/pMw6AM):
				; - Unicode LTR (Left-to-Right) mark (0x200E = 8206)
				; - Unicode RTL (Right-to-Left) mark (0x200F = 8207)
					, date:RegExReplace(Match[4], A_IsUnicode ? "[\x{200E}-\x{200F}]" : "\?")}
				break
			}
		}
		DllCall("CloseHandle", "Ptr", hProcess)
	}
	return Icon
}

```

3、保存编辑的文件，右击，选择Run Script，运行成功后就可以使用了！

## 开机自启

如果想要功能在开机的时候自动启动，可以进行如下操作： 整体的思路就是生成exe文件，放到系统自启动文件内。 

1、打开Convert .ahk to .exe文件，对ahk脚本进行exe文件生成：

![](https://s2.loli.net/2022/12/25/bRBa627Gq8iSmDt.png)

2、进行文件选择和生成文件命名：

![](https://s2.loli.net/2022/12/25/s4VMbXx7tH9IUTh.png)

3.在系统启动文件夹 C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp 内粘贴 生成的exe文件。此时会有查毒软件提醒，允许就行。

![](https://s2.loli.net/2022/12/25/bRBa627Gq8iSmDt.png)

大功告成！

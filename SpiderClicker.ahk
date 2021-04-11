#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting dire
MsgBox, 4096, Welcome, CTRL+SHIFT+G to run. CTRL+ESC to exit
GlimmerSlot := "1823, 850"
Slot1 := "1951, 850"
Slot2 := "2101, 850"
Slot3 := "2240, 850"
Slot4 := "2360, 850"
^Esc::ExitApp
+^g::
MsgBox, 4, On Spider's Screen?, Are you on Spider's screen?
MsgBox, 1, Warning!, This is designed for 2560x1440 resolution. Continue?
InputBox, LoopMaterial, Choose Slot, What Slot is the Glimmer Mat (Slot 1 is the first slot AFTER Glimmer)?
InputBox, MatsNeeded, Choose Material Amount, How many of that material do you want?
LoopLength := Round(MatsNeeded/5)
MsgBox, I will run for %LoopLength% iterations when you hit OK
Switch LoopMaterial 
{
    case "1": MatChoice = %Slot1%
    case "2": MatChoice = %Slot2%
    case "3": MatChoice = %Slot3%
    case "4": MatChoice = %Slot4%
}
var := LoopLength
Loop, %LoopLength%
{
    Gui, MyGui:New, +AlwaysOnTop
Gui, MyGui:Add, Text,, Iterations Left: %var%
Gui, MyGui:Show
WinActivate, Destiny 2
Sleep 100
Click, %MatChoice%
Sleep 500
var--
Gui, MyGui:Destroy
}
Break
Return

^+v::
MsgBox, 4, On a vendor's Screen?, Are you on a vendor's screen?
MsgBox, 1, Warning!, This is designed for 2560x1440 resolution. Continue?
var := 0
MaterialTile := "1785, 325"
EngramTile := "2375, 150"
Loop,
{
    Gui, VendorGui:New, +AlwaysOnTop
    Gui, VendorGui:Add, Text,, Redeeming vendor rewards. CTRL-SHIFT-R to stop. Ranks redeemed so far: %var%
    Gui, VendorGui:Show
    WinActivate, Destiny 2
    Sleep 200
    MouseMove, 1785, 325
    Sleep 500
    Click, Down
    Sleep 500
    Click, Up
    Sleep 500
    MouseMove, 2375, 150
    Sleep 500
    Click, Down
    Sleep 500
    Click, Up
    Sleep 1000
    MouseMove, 950, 400
    Sleep 200
    var++
    Gui, VendorGui:Destroy
}
Break
Return

+^R::
Reload
Return
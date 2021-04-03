#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting dire

GlimmerSlot := "1823, 850"
Slot1 := "1951, 850"
Slot2 := "2101, 850"
Slot3 := "2240, 850"
Slot4 := "2360, 850"
^Esc::ExitApp
+^g::
InputBox, LoopMaterial, Choose Slot, What Slot is the Glimmer Mat?
InputBox, MatsNeeded, Choose Material Amount, How many of that mat do you want?
LoopLength := Round(MatsNeeded/5)
MsgBox, %LoopLength%
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
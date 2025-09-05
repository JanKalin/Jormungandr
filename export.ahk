#Requires AutoHotkey v2.0

; Verify the existence of the app
hwnd := WinExist("ahk_exe THOR.exe")
if not hwnd {
    MsgBox "THOR not found!"
    ExitApp
}

; Read the number of files to be converted
loop {
    result := InputBox("Enter number of events to export:", "Event Count")
    if result.Result = "Cancel"
        ExitApp

    if result.Value ~= "^\d+$" { ; regex: digits only
        files := Integer(result.Value)
        break
    } else {
        MsgBox "Invalid input, please enter a number."
    }
}

; Activate the window and export data
WinActivate

; Some settings {{{
#SingleInstance Force
#Requires AutoHotkey v2.0
; Some settings }}}

; Reloading and Exiting the script {{{
~Home:: ; Doubletapping Home will reload the script. {{{
{
    if (A_PriorHotkey != "~Home" or A_TimeSincePriorHotkey > 400)
    {
        ; Too much time between presses, so this isn't a double-press.
        KeyWait "Home"
        return
    }
    Reload
} ; }}}
#End::ExitApp   ; Win-End will terminate the script.
; Reloading and Exiting the script }}}

; Toggle Taskbar (only works on main monitor) {{{
#F3::WinSetTransparent 255, "ahk_class Shell_TrayWnd"   ; Win+F1 to show taskbar 
#F2::WinSetTransparent 0, "ahk_class Shell_TrayWnd"     ; Win+F2 to hide taskbar

#HotIf !WinExist("ahk_class TopLevelWindowForOverflowXamlIsland")   ; Usually I like to have the taskbar hidden.
    ~#B::Send "{Space}"                                             ; Win-B is the standard shortcut to select the system tray overflow items.
#HotIf                                                              ; By pinning zero items other than wifi & such, we can get to our system tray apps with WIN-B
; Toggle Taskbar }}}

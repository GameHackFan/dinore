*----------------------------------------------------------------------------------------------
* Title:        DINORE Title Screen Text
* Written by:   GameHackFan
* Date:         
* Description:  Add extra text to the title screen.
*----------------------------------------------------------------------------------------------

; ORG         $181000

                                        ; Block of code that prints anything in line, stops at 00.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      (A1)+, D0                 ; Stores (A1) inside D0 and incrementes A1, the sprite.
  TST         D0                        ; Compares 0 and D0.
  BEQ         $181014                   ; If it is 0, go to the last line.
  MOVE.W      D0, (A0)                  ; Stores D0 inside (A0), the sprite in the screen region.
  MOVE.W      D1, ($2, A0)              ; Stores D1 inside ($2 + A0), the pallete id.
  LEA         ($80, A0), A0             ; Stores ($80 + A0) inside A0, next sprite screen position.
  BRA         $181000                   ; Jumps back to the 1st line.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181030

                                        ; Block of code that prints the hack name and version in the screen.
  BSR         $181A30                   ; Calls the routine that saves some registers values.
  MOVE.W      #$1E, D1                  ; Stores 1E inside D1, the pallete id of the text.
  LEA         $181100, A1               ; Stores $181100 inside A1, The text address.
  LEA         $90A440, A0               ; Stores $90A440 inside A0, The screen region of the text.
  BSR         $181000                   ; Calls the routine that prints stuff in the screen.
  LEA         $181130, A1               ; Stores $181130 inside A1, The text address.
  LEA         $90A2C4, A0               ; Stores $90A2C4 inside A0, The screen region of the text.
  BSR         $181000                   ; Calls the routine that prints stuff in the screen.
  BSR         $181A60                   ; Calls the routine that retore some registers values.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $1810A0.L                 ; Replace 9A54E.

; ORG         $1810A0

  JSR         $BB6                      ; Code from the original game that was replaced to jump to this code.
  BSR         $181030                   ; Calls the routine that prints the hack name and version.
  JMP         $9A554                    ; Jumps back to where it stopped in the original code.



  JMP         $1810C0.L                 ; Replace 9A572.

; ORG         $1810C0

  JSR         $B52                      ; Code from the original game that was replaced to jump to this code.
  BSR         $181030                   ; Calls the routine that prints the hack name and version.
  JMP         $9A578                    ; Jumps back to where it stopped in the original code.



  JMP         $1810E0.L                 ; Replace 9D6FA.

; ORG         $1810E0

  JSR         $C0A                      ; Code from the original game that was replaced to jump to this code.
  BSR         $181030                   ; Calls the routine that prints the hack name and version.
  JMP         $9D700                    ; Jumps back to where it stopped in the original code.



; This module has routines to print in line 
; sprites and to print the hack name, version 
; and project link text. It also executes all 
; the necessary routines to print those texts 
; in the title screen.
;
; $181000:    Draw Sprites in Line
; $181030:    Draw Hack Texts on Screen 
; $1810A0:    Draw Hack Texts on Screen Caller (Title Screen No Coin)
; $1810C0:    Draw Hack Texts on Screen Caller (Title Screen No Coin)
; $1810E0:    Draw Hack Texts on Screen Caller (Title Screen With Coin)
;
; $181100:    Hack Name and Version Text
;             Add the text bytes bellow.
; 65 52 64 61 75 6A 74 73 64 65 76 20 2E 31 20 33
; 62 28 20 79 61 47 65 6D 61 48 6B 63 61 46 29 6E
;
; $181130:    Project Link Text
;             Add the text bytes bellow.
; 74 68 70 74 3A 73 2F 2F 69 67 68 74 62 75 63 2E
; 6D 6F 47 2F 6D 61 48 65 63 61 46 6B 6E 61 64 2F
; 6E 69 72 6F 00 65 00 00 00 00 00 00 00 00 00 00
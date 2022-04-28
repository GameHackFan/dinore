*----------------------------------------------------------------------------------------------
* Title:        CADE Title Screen Text
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
  MOVE.L      D0, ($7FE0, A5)           ; Stores D0 inside ($7FE0 + A5), saves it for safety.
  MOVE.L      D1, ($7FE4, A5)           ; Stores D1 inside ($7FE4 + A5), saves it for safety.
  MOVE.L      A0, ($7FE8, A5)           ; Stores A0 inside ($7FE8 + A5), saves it for safety.
  MOVE.L      A1, ($7FEC, A5)           ; Stores A1 inside ($7FEC + A5), saves it for safety.
  LEA         $1810E0, A1               ; Stores $1810E0, The text address.
  LEA         $90A440, A0               ; Stores $90A440, The screen region of the text.
  MOVE.W      #$1E, D1                  ; Stores 1E inside D1, the pallete id of the text.
  BSR         $181000                   ; Calls the routine that prints stuff in the screen.
  MOVE.L      ($7FE0, A5), D0           ; Stores ($7FE0 + A5) + D0 inside, restore the value.
  MOVE.L      ($7FE4, A5), D1           ; Stores ($7FE4 + A5) + D1 inside, restore the value.
  MOVE.L      ($7FE8, A5), A0           ; Stores ($7FE8 + A5) + A0 inside, restore the value.
  MOVE.L      ($7FEC, A5), A1           ; Stores ($7FEC + A5) + A1 inside, restore the value.
  RTS                                   ; Returns back to the routine that called this code.


  JMP         $181080.L                 ; Code to jump to the new code that prints the hack text in the title screen (replace 9A54E).

; ORG         $181080

  JSR         $BB6                      ; Code from the original game that was replaced to jump to this code.
  BSR         $181030                   ; Calls the routine that prints the hack name and version.
  JMP         $9A554                    ; Jumps back to where it stopped in the original code.


  JMP         $1810A0.L                 ; Code to jump to the new code that prints the hack text in the title screen (replace 9A572).

; ORG         $1810A0

  JSR         $B52                      ; Code from the original game that was replaced to jump to this code.
  BSR         $181030                   ; Calls the routine that prints the hack name and version.
  JMP         $9A578                    ; Jumps back to where it stopped in the original code.


  JMP         $1810C0.L                 ; Code to jump to the new code that prints the hack text in the title screen (replace 9D6FA).

; ORG         $1810C0

  JSR         $C0A                      ; Code from the original game that was replaced to jump to this code.
  BSR         $181030                   ; Calls the routine that prints the hack name and version.
  JMP         $9D700                    ; Jumps back to where it stopped in the original code.



; This module has routines to print in line 
; sprites and to print the hack name and version 
; text. It also executes all the necessary 
; routines to print the hack name and text in 
; in the title screen.
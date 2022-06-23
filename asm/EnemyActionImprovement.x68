*----------------------------------------------------------------------------------------------
* Title:        DINORE Enemy Action Improvement
* Written by:   GameHackFan
* Date:         
* Description:  It has routines to make some changes to the 
*               actions of the enemies.
*----------------------------------------------------------------------------------------------

; ORG         $181800

                                        ; Block of code that calculate and sets the custom outside screen flag.
  CMP.B       #$18, ($3, A6)            ; Compares 18 and ($3 + A6), Slisaur ID.
  BNE         $181826                   ; If it is not 18, go to the last line.
  MOVE.W      ($8, A6), D0              ; Stores ($8 + A6) inside D0, Slisaur position X.
  ADD.W       #$1E, D0                  ; Adds 1E to D0, a left side space tolerance.
  SUB.W       ($744, A5), D0            ; Subtracts ($744 + A5) from D0, the camera position.
  CMP.W       #$1BC, D0                 ; Compares 1BC and D0, screen resolution 384 + 30 pixels tolerance from the left and 30 from the right.
  BCS         $181822                   ; If it is lower than 1BC, ignore the 2 lines below.
  MOVE.B      #1, ($DF, A6)             ; Stores 1 inside ($DF + A6), the custom outside screen flag.
  RTS                                   ; Returns back to the routine that called this code.
  CLR.B       ($DF, A6)                 ; Clears ($DF + A6), the custom outside screen flag.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $181840                   ; Replace 5C95E.
  NOP

; ORG         $181840

                                        ; Block of code that tries to make slisaur get up on an aggressive action.
  BCLR.B      #0, ($DF, A6)             ; Test if 1st bit of ($DF + A6) is 0 and set it to 0, outside the screen flag.
  BEQ         $181856                   ; If it is was 0, go to the last 2 lines.
  MOVE.L      #$200040E, ($4, A6)       ; Stores 200040E inside ($4 + A6), force Slisaur to his aggressive action.
  JMP         $5C944                    ; Jumps back to where it stopped in the original code.
  MOVE.L      #$2000000, ($4, A6)       ; Code from the original game that was replaced to jump to this code.
  JMP         $5C966                    ; Jumps back to where it stopped in the original code.



; This module has routines that brings improvements 
; to enemy actions. The only improvement it brings 
; right now is that, if Slisaur gets knocked down 
; outside the screen, he will get up on his aggressive 
; action instead of an idle action, making it even 
; harder to beat him on corners (All his attacks
; are executed when he is in his aggressive action).
;
; 181800:   Sets Outside Screen Flag (Slisaur)
; 181840:   Force Aggressive Action When Outside Screen Flag is Active (Slisaur)
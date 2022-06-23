*----------------------------------------------------------------------------------------------
* Title:        DINORE Play Mode Limiter
* Written by:   GameHackFan
* Date:         
* Description:  Limits the game to be played only in 3 players mode.
*----------------------------------------------------------------------------------------------

; ORG         $181300

                                        ; Block of code that forces the play mode flag to 0.
  MOVE.W      A0, D6                    ; Stores A0 inside D6, the memory position that will be written.
  CMP         #$F667, D6                ; Compares F667 and D6, play mode memory address.
  BNE         $18130C                   ; if it is not equals, go to the last block of code.
  AND.W       #0, D0                    ; D0 and 0, 0 is 3 players 3 coin chute, 1 is 3 players 1 coin chute.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $A85DC                    ; Replace A85DC (There is space to replace everything without a jump).

  AND.B       #0, D2                    ; D2 and 0, 0 is 3 players 3 coin chute, 1 is 3 players 1 coin chute.
  MOVE.B      D2, ($D, A4)              ; Code from the original game, sets the play mode flag.
  RTS                                   ; Returns back to the routine that called this code.
  NOP                                   ; No operation, does nothing. 
  NOP                                   ; No operation, does nothing. 
  NOP                                   ; No operation, does nothing. 
  NOP                                   ; No operation, does nothing. 
  NOP                                   ; No operation, does nothing. 
  NOP                                   ; No operation, does nothing. 



; This module forces the play mode to always 
; be 0 (3 players mode with 3 coins chute).
;
; $181300:    Forces Play Mode to 0 (Game Starts)
; $0A85DC:    Forces Play Mode to 0 (Service Menu)
*----------------------------------------------------------------------------------------------
* Title:        CADE Play Mode Limiter
* Written by:   GameHackFan
* Date:         
* Description:  Limits the game to be played only in 3 players mode.
*----------------------------------------------------------------------------------------------
 
  JMP         $181300.L                 ; Code to jump to the new code that limits the game to 3 players mode only (replace ACAA8).

; ORG         $181300

                                        ; Block of code that checks if the address is the play mode flag.
  SWAP        D0                        ; Invert D0 higher and lower bits, lower bits will be used later.
  MOVE.W      A0, D0                    ; Stores A0 inside D0, the memory position that will be written.
  CMP         #$F667, D0                ; Compares F667 and D0, play mode memory address.
  BNE         $181312                   ; if it is not equals, go to the last block of code.

                                        ; Block of code that limits the play mode to 3 players only.
  SWAP        D0                        ; Invert D0 higher and lower bits.
  AND.W       #0, D0                    ; D0 and 0, 0 is 3 players 3 coin chute, 1 is 3 players 1 coin chute.
  SWAP        D0                        ; Invert D0 higher and lower bits.

                                        ; Block of code that fix everything, execute replaced code and go back to the original code.
  CLR.W       D0                        ; Clears D0.
  SWAP        D0                        ; Invert D0 higher and lower bits, lower bits will be used.
  JSR         $ACBDE                    ; Code from the original game readjusted.
  MOVE.B      D0, (A0)+                 ; Code from the original game that was replaced to jump to this code.
  JMP         $ACAAE                    ; Jumps back to where it stopped in the original code.



; ORG         $A85DC                    ; There is space to replace everything without a jump (replace A85DC)

  AND.B       #0, D2                    ; D2 and 0, 0 is 3 players 3 coin chute, 1 is 3 players 1 coin chute.
  MOVE.B      D2, ($D, A4)              ; Code from the original game, sets the play mode flag.
  RTS                                   ; Returns back to the routine that called this code.
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP



; This module forces the play mode to always 
; be 00, 3 players mode with 3 coins chute.
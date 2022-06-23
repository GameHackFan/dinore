*----------------------------------------------------------------------------------------------
* Title:        DINORE Game Difficulty Improvement
* Written by:   GameHackFan
* Date:         
* Description:  Drastically increases the difficulty of the game.
*----------------------------------------------------------------------------------------------

; ORG         $181700

                                        ; Block of code that converts the original difficulty to custom.
  MOVE.W      A0, D6                    ; Stores A0 inside D6, the memory position that will be written.
  CMP.W       #$F668, D6                ; Compares F668 and D6, game difficulty mode memory address.
  BNE         $18171A                   ; if it is not equals, go to the last line.
  CMP.B       #$6F, D0                  ; Compares 6F and D0, game difficulty readjusted is 70+.
  BHI         $18171A                   ; If it is greater than 6F, it is already readjusted, go to the last line.
  AND.B       #$7, D0                   ; D0 and 7, put the value at the original range.
  ADD.B       D0, D0                    ; Adds D0 to D0, doubles the current level.
  ADDQ.B      #1, D0                    ; Adds 1 to D0, to ensure maximum level is reached.
  OR.W        #$70, D0                  ; D0 or 70, 00 - 70, 01 - 71, etc.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181730

                                        ; Block of code that converts the custom difficulty back to original.
  MOVE.W      A0, D1                    ; Stores A0 inside D1, the memory position that will be written.
  CMP.W       #$F668, D1                ; Compares F668 and D1, game difficulty mode memory address.
  BNE         $18174A                   ; if it is not equals, go to the last block of code.
  CLR.W       D1                        ; Clears D1.
  MOVE.B      (A0), D1                  ; Stores (A0) inside D1, the current game difficulty.
  CMP.B       #$8, D1                   ; Compares 8 and D1, 1 over max original game difficulty.
  BCS         $18174A                   ; If it is lower than 8, original difficulty, go to the last line.
  AND.B       #$0F, D1                  ; D1 and F, removes the extra value added to the game difficulty.
  LSR.B       #1, D1                    ; Shifts right D1 bits by 1, put it back at the original range.
  MOVE.B      D1, (A0)                  ; Stores D1 inside (A0), the original game level.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $181760                   ; Replace AC9B0.

; ORG         $181760

                                        ; Block of code that converts the original difficulty to custom.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($E, A1), D0              ; Stores ($E + A1) inside D0, the selected game difficulty.
  AND.B       #$7, D0                   ; D0 and 7, put the value at the original range.
  ADD.B       D0, D0                    ; Adds D0 to D0, doubles the current level.
  ADDQ.B      #1, D0                    ; Adds 1 to D0, to ensure maximum level is reached.
  OR.W        #$70, D0                  ; D0 or 70, 00 - 70, 01 - 71, etc, custom difficulty flag.
  MOVE.B      D0, ($E, A0)              ; Stores D0 inside ($E + A0), the custom difficulty.
  JMP         $AC9B6                    ; Jumps back to where it stopped in the original code.



; This module forces the game difficulty to be 
; increased following the formula (x * 2) + 71, 
; where "x" is the original game difficulty. It
; also provides a routine that converts the custom
; difficulty back to original so it can work 
; properly in the service menu.
; 
; $181700: Converts Original Difficulty to Custom (Game Starts)
; $181730: Converts Custom Difficulty to Original (Service Menu)
; $181760: Converts Original Difficulty to Custom (Service Menu)
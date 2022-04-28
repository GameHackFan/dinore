*----------------------------------------------------------------------------------------------
* Title:        CADE Enemy Target Improvement.
* Written by:   GameHackFan
* Date:         
* Description:  It has a routines that forces the enemy to change update his target.
*----------------------------------------------------------------------------------------------

; ORG         $180D00

                                        ; Check if the enemy should change their target.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits might be used later.
  MOVE.B      ($3, A6), D6              ; Stores ($3 + A6) inside D6, the enemy ID.
  MOVE.B      ($38, PC, D6.W), D6       ; Store ($38 + PC + D6.W) inside D6, the enemy update target flag.
  TST.B       D6                        ; Compares 0 and D6.
  BLT         $180D3A                   ; If it is less than 0, go to the line before the last line.
  MOVE.B      ($4EA, A5), D6            ; Stores ($4EA + A5), part of stage time.
  SWAP        D5                        ; Invert D5 higher and lower bits, lower bits might be used later.
  CLR.W       D5                        ; Clears D5.
  ADDQ.B      #1, D5                    ; Adds 1 to D5.
  CMP.B       #5, D5                    ; Compares 5 and D5.
  BHI         $180D38                   ; If it is greater than 5, go to SWAP D5 line.
  ADDQ.B      #1, D6                    ; Adds 1 to D6.
  AND.W       #3, D6                    ; D6 and 3.
  MULU.W      #$180, D6                 ; Multiplies D6 by 180, the player memory region size.
  ADD.W       #$3274, D6                ; Adds 3274 to D6, the P1 memory region.
  TST.B       (A5, D6.W)                ; Compares 0 and (A5 + D6.W), the target active flag.
  BEQ         $180D16                   ; If it is equal 0, go back to ADD #1 to D5 line.
  ADD.W       A5, D6                    ; Adds A5 to D6.
  MOVE.W      D6, ($76, A6)             ; Stores D6 inside ($76 + A6), the new target.
  SWAP        D5                        ; Invert D5 higher and lower bits.
  SWAP        D6                        ; Invert D6 higher and lower bits.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180DD0

                                        ; Block of code that updates the enemy target.
  CMP.B       #$22, ($3, A3)            ; Compares 22 and D0, fessenden 2nd form.
  BNE         $180DDC                   ; If it is not 22, go to RTS.
  MOVE.W      A2, ($76, A3)             ; Stores A2 inside ($76 + A6), the player that went for the clinch.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $180DF0                   ; Code to jump to the new code that updates the  if the current is not active (replace 67F46, 68068, 682BA).
  NOP
  NOP

; ORG         $180DF0

                                        ; Block of code that changes tries to update the target.
  MOVE.W      ($76, A6), D1             ; Stores ($76 + A6) inside D1, current target.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1, A5 already has 8000.
  TST.B       (A5, D1.W)                ; Compares 0 and (A5 + D1.W), the target active flag.
  BNE         $180E02                   ; If it is not 0, don't update target.
  BSR         $180D00                   ; Call the code that updates the target.
  RTS                                   ; Returns back to the routine that called this code.



; Character ID Table
;
; FF FF FF FF 05 FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF 19 18 FF FF FF FF FF FF
; FF FF FF 22 25 FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF



; This module provides routines that 
; change the enemy target. It also 
; executes the routine to change target
; in some specific cases related to 
; Fessenden 1st form.
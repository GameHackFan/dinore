*----------------------------------------------------------------------------------------------
* Title:        DINORE Enemy Target Improvement
* Written by:   GameHackFan
* Date:         
* Description:  It has routines that forces the enemy to update his target.
*----------------------------------------------------------------------------------------------

; ORG         $180D00

                                        ; Check if the enemy should change their target.
  CLR.W       D0                        ; Clears D0.                                        
  MOVE.B      ($3, A6), D0              ; Stores ($3 + A6) inside D0, the enemy ID.
  MOVE.B      ($48, PC, D0.W), D0       ; Store ($48 + PC + D0.W) inside D0, the enemy update target flag.
  TST.B       D0                        ; Compares 0 and D0.
  BLT         $180D3E                   ; If it is less than 0, go to the last line.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits might be used later.
  MOVE.W      #$4, D6                   ; Stores 4 inside D6, the amount of iteration.
  MOVE.B      ($4EA, A5), D0            ; Stores ($4EA + A5) inside D0, part of the stage time.
  ADD.B       ($4E9, A5), D0            ; Adds ($4E9 + A5) to D0, the other part of the stage time.
  ADD.B       D6, D0                    ; Adds D6 to D0, the shift to get the player address.
  AND.W       #3, D0                    ; D0 and 3, to ensure the shift is a valid value.
  ADD.B       D0, D0                    ; Adds D0 to D0, doubles it, player address is 2 bytes.
  MOVE.W      ($1A, PC, D0.W), D0       ; Stores ($1A + PC + D0.W) inside D0, the player address.
  TST.B       (A5, D0.W)                ; Compares 0 and (A5 + D0.W), the target active flag.
  BNE         $180D34                   ; If it is not equal 0, ignore the 2 lines below.
  DBRA        D6, $180D14               ; Loops back to the line that stores the time inside D0.
  BRA         $180D3A                   ; If the target can't be set, ignore the 2 lines below.
  ADD.W       A5, D0                    ; Adds A5 to D0, to fix the player address.
  MOVE.W      D0, ($76, A6)             ; Stores D0 inside ($76 + A6), the new target.
  CLR.W       D6                        ; Clears D6.
  SWAP        D6                        ; Invert D6 higher and lower bits.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180DE0

                                        ; Block of code that updates the enemy target for Fessenden 2nd Form.
  CMP.B       #$22, ($3, A3)            ; Compares 22 and ($3 + A3), Fessenden 2nd form ID.
  BNE         $180DEC                   ; If it is not 22, go to RTS.
  MOVE.W      A2, ($76, A3)             ; Stores A2 inside ($76 + A6), the player that went for the clinch.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $180E00                   ; Replace 67F46, 68068, 682BA.
  NOP
  NOP

; ORG         $180E00

                                        ; Block of code that tries to update the target for Fessenden 1st Form.
  MOVE.W      ($76, A6), D1             ; Stores ($76 + A6) inside D1, current target.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1, A5 already has 8000.
  TST.B       (A5, D1.W)                ; Compares 0 and (A5 + D1.W), the target active flag.
  BNE         $180E12                   ; If it is not 0, don't update target.
  BSR         $180D00                   ; Call the code that updates the target.
  RTS                                   ; Returns back to the routine that called this code.



; This module provides routines that change the enemy 
; target. It also executes the routine to change target
; in some specific cases related to Fessenden.
;
; 180D00:   Update Enemy Target (Current Enemy)
; 180DE0:   Change Enemy Target (Current Enemy is Fessenden 2nd Form)
; 180E00:   Update Enemy Target (Fessenden 1st Form)
; 
; 180D40:   Player Address Offset Table
;           Add the data below.
; 74 32 F4 33 74 35 40 70 74 32 F4 33 74 35 40 70
;
; 180D50:   Character ID Table
;           Add the data below.
; FF FF FF FF 05 FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF 19 18 FF FF FF FF FF FF
; FF FF FF 22 25 FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
; FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
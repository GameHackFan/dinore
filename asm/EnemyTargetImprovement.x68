*----------------------------------------------------------------------------------------------
* Title:        DINORE Enemy Target Improvement
* Written by:   GameHackFan
* Date:         
* Description:  It has routines that allow the enemy to update their target.
*----------------------------------------------------------------------------------------------

; ORG         $180D00

                                        ; Check if the enemy should change their target.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($3, A6), D0              ; Stores ($3 + A6) inside D0, the enemy ID.
  MOVE.B      ($68, PC, D0.W), D0       ; Store ($68 + PC + D0.W) inside D0, the enemy update target flag.
  TST.B       D0                        ; Compares 0 and D0.
  BLT         $180D42                   ; If it is less than 0, go to the RTS line.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits might be used later.
  MOVE.B      ($75C2, A5), D6           ; Stores ($75C2 + A5) inside D6, current frame.
  ADD.W       #$30, D6                  ; Adds 30 to D6, to ensure a maximum of 10 loops.
  CMP.W       #$2000, D6                ; Compares 2000 and D6.
  BCC         $180D3E                   ; If it is 2000 or more, don't change target, go to the last CLR line.
  MOVE.W      D6, D0                    ; Stores D6 inside D0, D0 will be modified.
  MULU.W      #$7, D0                   ; Multiples D0 by 7, some constant to change the value.
  LSR.W       #2, D0                    ; Shifts right D0 bits by 2.
  MOVE.W      D0, D6                    ; Stores D0 inside D6, to be used in the next iteration.
  AND.W       #3, D0                    ; D0 and 3, put the value in a valid range.
  ADD.B       D0, D0                    ; Adds D0 to D0, doubles it, player address is 2 bytes.
  MOVE.W      ($30, PC, D0.W), D0       ; Stores ($30 + PC + D0.W) inside D0, the player address.
  TST.B       (A5, D0.W)                ; Compares 0 and (A5 + D0.W), the target active flag.
  BEQ         $180D18                   ; If it is 0, go back to the CMP line of code.
  ADD.W       A5, D0                    ; Adds A5 to D0, to fix the player address.
  MOVE.W      D0, ($76, A6)             ; Stores D0 inside ($76 + A6), the new target.
  CLR.W       D6                        ; Clears D6.
  SWAP        D6                        ; Invert D6 higher and lower bits.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180E00

                                        ; Block of code that updates the enemy target for Fessenden 2nd Form.
  CMP.B       #$22, ($3, A3)            ; Compares 22 and ($3 + A3), Fessenden 2nd form ID.
  BNE         $180E0C                   ; If it is not 22, go to RTS.
  MOVE.W      A2, ($76, A3)             ; Stores A2 inside ($76 + A6), the player that went for the clinch.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $180E20                   ; Replace 67F46, 68068, 682BA.
  NOP
  NOP

; ORG         $180E20

                                        ; Block of code that tries to update the target for Fessenden 1st Form.
  MOVE.W      ($76, A6), D1             ; Stores ($76 + A6) inside D1, current target.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1, A5 already has 8000.
  TST.B       (A5, D1.W)                ; Compares 0 and (A5 + D1.W), the target active flag.
  BNE         $180E32                   ; If it is not 0, don't update target.
  BSR         $180D00                   ; Call the code that updates the target.
  RTS                                   ; Returns back to the routine that called this code.



; This module provides routines that change the enemy 
; target. It also executes the routine to change target
; in some specific cases related to Fessenden. The 
; 180D00 target change code now has almost the same
; probability for all players.
; 
; 180D00:   Update Enemy Target (Current Enemy)
; 180E00:   Change Enemy Target (Current Enemy is Fessenden 2nd Form)
; 180E20:   Update Enemy Target (Fessenden 1st Form)
; 
; 180D60:   Player Address Offset Table (Data below)
;           74 32 F4 33 74 35 40 70 74 32 F4 33 74 35 40 70
;
; 180D70:   Character ID Table (Data below)
;           FF FF FF FF 05 FF FF FF FF FF FF FF FF FF FF FF
;           FF FF FF FF FF FF FF FF 19 18 FF FF FF FF FF FF
;           FF FF FF 22 25 FF FF FF FF FF FF FF FF FF FF FF
;           FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
;           FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
;           FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
;           FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
;           FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
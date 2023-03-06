*----------------------------------------------------------------------------------------------
* Title:        CDREE Object Pallete Improvement
* Written by:   GameHackFan
* Date:
* Description:  Adds support to custom pallete for objects / enemies.
*               Fixes the pallete of some objects.
*----------------------------------------------------------------------------------------------

  JMP         $181C00                   ; Replace FE42.

; ORG         $181C00

                                        ; Block of code that sets the custom pallete ID at spawn.
  SWAP        D0                        ; Inverts D0 higher and lower bits, D0 lower bytes are in use.
  MOVE.B      ($8, A2), D0              ; Stores ($8 + A2) inside D0, it might have a custom pallete ID.
  LSR.W       #$3, D0                   ; Shifts D0 bits by 3, to fix the custom pallete ID.
  TST.B       D0                        ; Compares 0 and D0.
  BEQ         $181C10                   ; If it is 0, ignore the line below.
  BSET        #$7, D0                   ; Sets the 8th bit of D0, custom pallete ID flag.
  MOVE.B      D0, ($7F30, A5)           ; Stores D0 inside ($7F30 + A5), to be used a few lines below.
  MOVE.W      #$BE, D0                  ; Stores BE inside D0, the offset of the custom pallete.
  CMP.B       #$4, ($82, A0)            ; Compares 4 and ($82 + A0), 4 is enemies.
  BNE         $181C24                   ; If it is not 4, ignore the line below.
  ADD.W       #$20, D0                  ; Adds 20 to D0, BE to DE, enemies custom pallete ID offset.
  MOVE.B      ($7F30, A5), (A0, D0.W)   ; Stores ($7F30 + A5) inside (A0 + D0.W), the custom pallete ID as backup.
  MOVE.B      ($7F30, A5), ($23, A0)    ; Stores ($7F30 + A5) inside ($23 + A0), the custom pallete ID.
                                        
                                        ; Block of code that readjusts the original code and clears things.
  MOVE.W      ($8, A2), D0              ; Stores ($8 + A2) inside D0, data that might have a custom pallete ID.
  AND.W       #$7FF, D0                 ; D0 and 7FF, to remove the custom pallete ID bits.
  MOVE.W      D0, ($10, A0)             ; Stores D0 inside ($10, A0), the object Y position.
  CLR.W       D0                        ; Clears D0.
  SWAP        D0                        ; Inverts D0 higher and lower bits, D0 lower bytes are in use.
  JMP         $FE48                     ; Jumps back to where it stopped in the original code.
  


  JMP         $181C60                   ; Replace 24C8A.

; ORG         $181C60

                                        ; Block of code that sets a frame based custom pallete (Ammo).
  MOVE.B      ($75C2, A5), D0           ; Stores ($75C2 + A5) inside D0, frame data.
  AND.W       #$1, D0                   ; D0 and 1, only 2 compatible palletes, so 2 indexes.
  MOVE.B      ($12, PC, D0.W), D0       ; Stores ($12 + PC + D0.W) inside D0, the custom pallete ID.
  MOVE.B      D0, ($BE, A0)             ; Stores D0 inside ($BE + A0), saves it in the custom address.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  JMP         $24C90                    ; Jumps back to where it stopped in the original code.



  JSR         $181C90                   ; Replace 24B90.

; ORG         $181C90

                                        ; Block of code that sets a frame based custom pallete (Weapon).
  CLR.B       ($7F30, A5)               ; Clears ($7F30 + A5), weapon pallete list offset is 0.
  BSR         $181D00                   ; Calls the code that sets the frame based custom pallete.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $181CB0                   ; Replace 24C0E.

; ORG         $181CB0

                                        ; Block of code that sets a frame based custom pallete (Treasure).
  MOVE.B      #$50, ($7F30, A5)         ; Stores 50 inside ($7F30 + A5), treasure pallete list offset.
  BSR         $181D00                   ; Calls the code that sets the frame based custom pallete.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $181CD0                   ; Replace 24BD4.

; ORG         $181CD0

                                        ; Block of code that resets the custom pallete ID.
  CLR.B       ($23, A0)                 ; Clears ($23 + A0), custom pallete ID.
  CLR.B       ($BE, A0)                 ; Clears ($BE + A0), custom pallete ID.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181D00

                                        ; Block of code that sets a custom pallete ID (Weapon).  
  MOVE.W      D1, D0                    ; Stores D1 inside D0, the weapon ID.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it, there are 4 colors.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it, there are 4 colors.
  ADD.B       D0, ($7F30, A5)           ; Adds D0 to ($7F30 + A5), the pallete list object index .
  MOVE.B      ($75C2, A5), D0           ; Stores ($75C2 + A5) inside D0, frame data.
  AND.W       #$3, D0                   ; 3 and D0, the pallete index shift, 4 palletes available.
  ADD.B       ($7F30, A5), D0           ; Adds ($7F30 + A5) to D0, the pallete index shift.
  MOVE.B      ($58, PC, D0.W), D0       ; Stores ($58 + PC + D0.W) inside D0, the custom pallete ID.
  MOVE.B      D0, ($BE, A0)             ; Stores D0 inside ($BE, A0), the custom pallete ID.
  MOVE.B      D0, ($23, A0)             ; Stores D0 inside ($23, A0), the custom pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181D40

                                        ; Block of code that sets a custom pallete ID (Fessenden Body Parts).  
  CMP.B       #$7, D3                   ; Compares 7 and D3, 7 is Bludge's puke sprite.
  BEQ         $181D4E                   ; If it is 7, ignore the 2 lines below.
  MOVE.B      #$81, ($23, A0)           ; Stores 81 inside ($23 + A0), pallete 1 for the body parts.
  BRA         $181D54                   ; Ignore the line below
  MOVE.B      #$80, ($23, A0)           ; Stores 80 inside ($23 + A0), pallete 0 for the puke sprite.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  JMP         $9765C                    ; Jumps back to where it stopped in the original code.



; ORG         $24642                    ; Replace 24642 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (24642).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  TST.B       ($2C, A6)                 ; Code from the original game that was replaced.
  BEQ         $24662                    ; Code from the original game readjusted.


; ORG         $24724                    ; Replace 24724 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (24724).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  TST.B       ($2C, A6)                 ; Code from the original game that was replaced.
  BEQ         $24736                    ; Code from the original game readjusted.


; ORG         $2480E                    ; Replace 24810 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (024820).
  CLR.W       ($14, A6)                 ; Code from the original game that was replaced.
  CLR.W       ($1A, A6)                 ; Code from the original game that was replaced.
  CLR.W       ($18, A6)                 ; Code from the original game that was replaced.
  CLR.W       ($1E, A6)                 ; Code from the original game that was replaced.
  CLR.B       ($AF, A6)                 ; Code from the original game that was replaced.
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.


; ORG         $24A00                    ; Replace 24A00 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (24A00).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  TST.B       ($2C, A6)                 ; Code from the original game that was replaced.
  BEQ         $24A12                    ; Code from the original game readjusted.


; ORG         $2509C                    ; Replace 2509C (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (2509C).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  MOVE.B      D0, ($59, A6)             ; Code from the original game that was replaced.
  MOVE.B      D0, ($B0, A6)             ; Code from the original game that was replaced.
  MOVE.B      D0, ($B1, A6)             ; Code from the original game that was replaced.
  MOVEQ       #$11, D0                  ; Code from the original game that was replaced.
  JSR         $120E.L                   ; Code from the original game that was replaced.
  TST.B       ($6, A6)                  ; Code from the original game that was replaced.
  BNE         $250C6                    ; Code from the original game readjusted.


; ORG         $25178                    ; Replace 25178 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (25178).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  MOVE.W      ($70, A6), A0             ; Code from the original game that was replaced.
  TST.B       (A0)                      ; Code from the original game readjusted.
  BEQ         $251A0                    ; Code from the original game readjusted.
  MOVE.W      ($B4, A0), A1             ; Code from the original game that was replaced.
  CMP.W       A1, A6                    ; Code from the original game that was replaced.
  BNE         $251A0                    ; Code from the original game readjusted.


; ORG         $25468                    ; Replace 25468 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (25468).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  SUBQ.B      #1, ($80, A6)             ; Code from the original game that was replaced.
  BNE         $25490                    ; Code from the original game readjusted.


; ORG         $25496                    ; Replace 25496 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (25496).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  JSR         $9D44.L                   ; Code from the original game that was replaced.
  BSR         $264FC.L                  ; Code from the original game that was replaced.
  LEA         ($109C, PC), A1           ; Code from the original game readjusted (26544). 
  TST.B       ($A8, A6)                 ; Code from the original game that was replaced.
  BEQ         $254B4                    ; Code from the original game readjusted.


; ORG         $28434                    ; Replace 28434 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (28434).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  LEA         ($1A0, PC), A0            ; Code from the original game readjusted (285DC). 
  JSR         $1236.L                   ; Code from the original game that was replaced.
  TST.B       ($6, A6)                  ; Code from the original game that was replaced.
  BNE         $28450                    ; Code from the original game readjusted.


; ORG         $289EA                    ; Replace 289EA (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (289EA).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  MOVE.W      ($26, A6), D0             ; Code from the original game that was replaced.
  SUBQ.W      #1, D0                    ; Code from the original game that was replaced.
  JSR         $120E.L                   ; Code from the original game that was replaced.
  MOVE.L      ($28, A6), ($30, A6)      ; Code from the original game that was replaced.
  TST.B       ($6, A6)                  ; Code from the original game that was replaced.
  BNE         $28A0E                    ; Code from the original game readjusted.


; ORG         $28E5A                    ; Replace 28E5A (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (28E5A).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  TST.B       ($B8, A6)                 ; Code from the original game that was replaced.
  BEQ         $28EBA                    ; Code from the original game readjusted.


; ORG         $2A086                    ; Replace 2A086 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (2A086).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  MOVE.W      ($26, A6), D0             ; Code from the original game that was replaced.
  SUBQ.W      #1, D0                    ; Code from the original game that was replaced.
  JSR         $120E.L                   ; Code from the original game that was replaced.
  TST.B       ($6, A6)                  ; Code from the original game that was replaced.
  BNE         $2A0A4                    ; Code from the original game readjusted.


; ORG         $2AD42                    ; Replace 2AD42 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (several objects).
  TST.B       ($51, A6)                 ; Code from the original game that was replaced.
  BNE         $2AD80                    ; Code from the original game readjusted.
  MOVE.B      ($DE, A6), ($23, A6)      ; Stores ($DE + A6) inside ($23 + A6), the custom pallete ID.


; ORG         $2B55A                    ; Replace 2B55A (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (several objects).
  MOVE.B      ($DE, A6), ($23, A6)      ; Stores ($DE + A6) inside ($23 + A6), the custom pallete ID.
  NOP                                   ; No operation, does nothing. 




; This module has a routine that allows objects / enemies to
; spawn with a custom pallete ID. It also modifies some code to 
; allow the custom pallete ID instead of resetting it to original.
;
; 181C00:   Force Custom Pallete ID (Level Trigger Object Spawn)
; 181C60:   Force Custom Pallete ID 2 (Object Spawn)
; 181C90:   Force Custom Pallete ID 3 (Object Spawn)
; 181CB0:   Force Custom Pallete ID 4 (Object Spawn)
; 181CD0:   Force Custom Pallete ID 5 (Object Spawn)
; 181D00:   Force Custom Pallete ID 6 (Object Spawn)
; 181D40:   Force Custom Pallete ID 7 (Object Spawn)
;
; 024642:   Force Custom Pallete ID 1 / Pallete Fix 1 (Current Object / Character)
; 024724:   Force Custom Pallete ID 2 / Pallete Fix 2 (Current Object / Character)
; 02480E:   Force Custom Pallete ID 3 / Pallete Fix 3 (Current Object / Character)
; 024A00:   Force Custom Pallete ID 4 / Pallete Fix 4 (Current Object / Character)
; 02509C:   Force Custom Pallete ID 5 / Pallete Fix 5 (Current Object / Character)
; 025178:   Weapon Blink Pallete Fix
; 025468:   Force Custom Pallete ID 6 / Pallete Fix 6 (Current Object / Character)
; 025496:   Force Custom Pallete ID 7 / Pallete Fix 7 (Current Object / Character)
; 028434:   Force Custom Pallete ID 8 / Pallete Fix 8 (Current Object / Character)
; 0289EA:   Force Custom Pallete ID 9 / Pallete Fix 9 (Current Object / Character)
; 028E5A:   Force Custom Pallete ID 10 / Pallete Fix 10 (Current Object / Character)
; 02A086:   Force Custom Pallete ID 11 / Pallete Fix 11 (Current Object / Character)
; 02AD42:   Force Custom Pallete ID 12 / Pallete Fix 12 (Current Object / Character)
; 02B55A:   Force Custom Pallete ID 13 / Pallete Fix 13 (Current Object / Character)
;
; 181C7C:  Force Custom Pallete ID 7 Data (add the data below)
;          86 00
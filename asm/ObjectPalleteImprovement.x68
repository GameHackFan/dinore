*----------------------------------------------------------------------------------------------
* Title:        CDREE Object Pallete Improvement
* Written by:   GameHackFan
* Date:
* Description:  Adds support to custom pallete for objects / enemies.
*               Fixes the pallete of some objects.
*----------------------------------------------------------------------------------------------

  JSR         $181C00                   ; Replace FE42, FF06.

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
  RTS                                   ; Returns back to the routine that called this code.
  


  JMP         $181C60                   ; Replace 24C8A.

; ORG         $181C60

                                        ; Block of code that sets a random custom pallete ID (Ammo).
  BSR         $181AB0                   ; Calls the routine that randomizes a value.
  AND.W       #$1, D0                   ; D0 and 1, only 2 compatible palletes, so 2 indexes.
  MOVE.B      ($12, PC, D0.W), D0       ; Stores ($12 + PC + D0.W) inside D0, the custom pallete ID.
  MOVE.B      D0, ($BE, A0)             ; Stores D0 inside ($BE + A0), saves it in the custom address.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  JMP         $24C90                    ; Jumps back to where it stopped in the original code.



  JSR         $181C90                   ; Replace 24B90.

; ORG         $181C90

                                        ; Block of code that sets a random custom pallete ID (Weapon).
  CLR.B       ($7F30, A5)               ; Clears ($7F30 + A5), weapon pallete list offset is 0.
  BSR         $181F00                   ; Calls the code that sets the random custom pallete ID.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $181CB0                   ; Replace 24C0E.

; ORG         $181CB0

                                        ; Block of code that sets a random custom pallete ID (Treasure).
  MOVE.B      #$50, ($7F30, A5)         ; Stores 50 inside ($7F30 + A5), treasure pallete list offset.
  BSR         $181F00                   ; Calls the code that sets the random custom pallete ID.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $181CD0                   ; Replace 24BD4.

; ORG         $181CD0

                                        ; Block of code that resets the custom pallete ID.
  CLR.B       ($23, A0)                 ; Clears ($23 + A0), custom pallete ID.
  CLR.B       ($BE, A0)                 ; Clears ($BE + A0), custom pallete ID.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $181D00                   ; Replace 259F2, 292B0, 29300, 294C2, 9464A, 946D2.

; ORG         $181D00

                                        ; Block of code that fixes broken object custom pallete ID transfer.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  MOVE.B      ($BE, A6), ($7E, A0)      ; Stores (BE + A6) inside (7E + A0), pallete ID transfer.
  MOVE.B      ($23, A6), ($23, A0)      ; Stores (23 + A6) inside (23 + A0), pallete ID transfer.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $181D30                   ; Replace 9377A.

; ORG         $181D30

                                        ; Block of code that fixes custom pallete ID transfer (object).
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  MOVE.B      ($23, A6), ($BE, A0)      ; Stores (23 + A6) inside (BE + A0), custom pallete ID.
  MOVE.B      ($23, A6), ($23, A0)      ; Stores (23 + A6) inside (23 + A0), custom pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $181D60                   ; Replace 97656.

; ORG         $181D60

                                        ; Block of code that sets a custom pallete ID (Fessenden Body Parts).
  CMP.B       #$7, D3                   ; Compares 7 and D3, 7 is Bludge's puke sprite.
  BEQ         $181D6E                   ; If it is 7, ignore the 2 lines below.
  MOVE.B      #$81, ($23, A0)           ; Stores 81 inside ($23 + A0), pallete 1 for the body parts.
  BRA         $181D74                   ; Ignore the line below.
  MOVE.B      #$80, ($23, A0)           ; Stores 80 inside ($23 + A0), pallete 0 for the puke sprite.
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  JMP         $9765C                    ; Jumps back to where it stopped in the original code.



  JSR         $181D90                   ; Replace 28D82

; ORG         $181D90

                                        ; Block of code that sets a random custom pallete (Barrel).
  MOVE.W      ($10, A6), ($B4, A6)      ; Code from the original game that was replaced to jump to this code.
  TST.B       ($BE, A6)                 ; Compares 0 and ($BE + A6), the custom pallete ID.
  BNE         $181DA8                   ; If it is not 0, it has a custom pallete ID, go to RTS line.
  MOVE.B      ($27, A6), D0             ; Stores ($27 + A6) inside D0, the barrel type.
  MOVE.W      ($E, PC, D0.W), D0        ; Stores ($E + PC + D0.W) inside D0, offset of the code to execute.
  JMP         (PC, D0.W)                ; Jumps to the code that handles custom pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



  JSR         $181DD0                   ; Replace 5B93C.

; ORG         $181DD0

                                        ; Block of code that sets a random custom pallete (Rolling Barrel).
  TST.B       ($DE, A6)                 ; Compares 0 and ($DE + A6), the custom pallete ID.
  BNE         $181DF4                   ; If it is not 0, it has a custom pallete ID, go to RTS line.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($27, A6), D0             ; Stores ($27 + A6) inside D0, the barrel type.
  ADD.B       D0, D0                    ; Adds D0 to D0, the jump offset is 2 bytes.
  MOVE.W      ($18, PC, D0.W), D0       ; Stores ($18 + PC + D0.W) inside D0, offset of the code to execute.
  JSR         (PC, D0.W)                ; Jumps to the code that handles custom pallete ID.
  CLR.W       ($BE, A6)                 ; Clears (BE + A6), fake custom pallete ID, rolling barrels are enemies.
  MOVE.B      D1, ($DE, A6)             ; Stores D1 inside ($DE + A6), enemy custom pallete ID.
  MOVEQ       #$0, D0                   ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($59, A6)             ; Code from the original game that was replaced to jump to this code.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181E20

                                        ; Block of code that sets a random custom pallete ID (05 or 06).
  BSR         $181AB0                   ; Calls the routine that randomizes a value.
  AND.W       #$1, D0                   ; D0 and 1, to have 0 or 1.
  ADD.W       #$85, D0                  ; Adds 85 to D0, pallete ID 15 or 16.
  MOVE.B      D0, ($BE, A6)             ; Stores D0 inside ($BE + A6), the custom pallete ID.
  MOVE.B      D0, ($23, A6)             ; Stores D0 inside ($23 + A6), the custom pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181E40

                                        ; Block of code that sets a random custom pallete ID from a list.
  MOVE.B      ($4D9, A5), D1            ; Stores (4D9 + A5) inside D1, the stage ID.
  LSL.W       #$2, D1                   ; Shifts left D1 bits by 2, 0 to 0, 1 to 4, 2 to 8, etc.
  ADD.B       ($786, A5), D1            ; Adds (786 + A5) to D1, the area ID.
  LSL.W       #$2, D1                   ; Shifts left D1 bits by 2, 4 to 10, 5 to 14, 6 to 18, etc.
  BSR         $181AB0                   ; Calls the routine that randomizes a value.
  AND.W       #$3, D0                   ; D0 and 3, each area has 4 custom pallete ID available.
  ADD.B       D1, D0                    ; Stores D1 inside D0, the final offset of the pallete ID.
  MOVE.B      ($18, PC, D0.W), D1       ; Stores ($18 + PC + D0.W) inside D1, the randomized pallete ID.
  MOVE.B      D1, ($BE, A6)             ; Stores D1 inside ($BE + A6), the custom pallete ID.
  MOVE.B      D1, ($23, A6)             ; Stores D1 inside ($23 + A6), the custom pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181F00

                                        ; Block of code that sets a custom pallete ID (Weapon).  
  MOVE.W      D1, D0                    ; Stores D1 inside D0, the weapon ID.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it, there are 4 colors.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it, there are 4 colors.
  ADD.B       D0, ($7F30, A5)           ; Adds D0 to ($7F30 + A5), the pallete list object index.
  BSR         $181AB0                   ; Calls the routine that randomizes a value.
  AND.W       #$3, D0                   ; 3 and D0, the pallete index shift, 4 palletes available.
  ADD.B       ($7F30, A5), D0           ; Adds ($7F30 + A5) to D0, the pallete index shift.
  MOVE.B      ($18, PC, D0.W), D0       ; Stores ($18 + PC + D0.W) inside D0, the custom pallete ID.
  MOVE.B      D0, ($BE, A0)             ; Stores D0 inside ($BE, A0), the custom pallete ID.
  MOVE.B      D0, ($23, A0)             ; Stores D0 inside ($23, A0), the custom pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



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



; ORG         $28F76                    ; Replace 28F76 (There is space to replace everything).

                                        ; Block of code that forces custom pallete ID (28F76).
  MOVE.B      ($BE, A6), ($23, A6)      ; Stores ($BE + A6) inside ($23 + A6), the custom pallete ID.
  MOVE.W      ($70, A6), A0             ; Code from the original game that was replaced.
  TST.B       (A0)                      ; Code from the original game readjusted.
  BEQ         $29046                    ; Code from the original game that was replaced.
  CMP.W       ($B4, A0), A6             ; Code from the original game readjusted.
  BNE         $29046                    ; Code from the original game that was replaced.
  MOVE.W      ($A0, A6), D0             ; Code from the original game that was replaced.
  CMP.W       ($B6, A0), D0             ; Code from the original game that was replaced.
  BNE         $29046                    ; Code from the original game that was replaced.
  BSR         $24A9A                    ; Code from the original game readjusted.



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



; ORG         $3590A                    ; Replace 3590A (There is space to replace everything).

                                        ; Block of code that removes custom pallete ID (Lash Terhune).
  MOVE.B      #$1, (A0)                 ; Code from the original game readjusted.
  MOVE.W      #$0C, ($20, A0)           ; Code from the original game that was replaced.
  CLR.W       ($26, A0)                 ; Code from the original game that was replaced.
  CLR.W       ($DE, A0)                 ; Clears ($DE + A0), removes custom pallete ID.



; This module has a routine that allows objects / enemies to
; spawn with a custom pallete ID. It also modifies some code to 
; allow the custom pallete ID instead of resetting it to original.
; 
; 181C00:   Force Custom Pallete ID (Level Trigger Object Spawn)
; 181C60:   Sets Random Custom Pallete ID (Ammo Drop)
; 181C90:   Sets Random Custom Pallete ID (Weapon Drop)
; 181CB0:   Sets Random Custom Pallete ID (Treasure Drop)
; 181CD0:   Force Custom Pallete ID 5 (Object Spawn)
; 181D00:   Broken Pieces Custom Pallete ID Fix (Object).
; 181D30:   Sets Custom Pallete ID (Fessenden Body Parts)
; 181D60:   Sets Random Custom Pallete ID (Barrels)
; 181DA0:   Sets Random Custom Pallete ID (Rolling Barrels)
; 181DE0:   Sets Random Custom Pallete ID (05 or 06)
; 181E10:   Sets Random Custom Pallete ID From a List (Area Based List)
; 181F00:   Sets Random Custom Pallete ID From a List (Current Object)
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
; 028F76:   Explosive Barrel Blink Pallete Fix
; 02A086:   Force Custom Pallete ID 11 / Pallete Fix 12 (Current Object / Character)
; 02AD42:   Force Custom Pallete ID 12 / Pallete Fix 13 (Current Object / Character)
; 02B55A:   Force Custom Pallete ID 13 / Pallete Fix 14 (Current Object / Character)
; 03590A:   Remove Custom Pallete (Lash Terhune)
;
; 181C7C:   Random Custom Pallete ID Data (Ammo, add the data below)
;           86 00
;
; 181D60:   Code to Execute Data (Barrels, add the data below)
;           6A 00 02 00 9A 00 6A 00 02 00 9A 00 6A 00 02 00
;
; 181DC8:   Code to Execute Data (Rolling Barrels, add the data below)
;           2C 00 5C 00 02 00 02 00
;
; 181E40:   Area Based Pallete ID Data (add the data below)
;           8B 88 9D 9C 89 88 9C 8B 91 88 9C 92 91 88 9C 92
;           98 88 9E 9A 89 88 9F 9E 89 88 89 88 89 88 89 88
;           89 88 9D 88 89 88 9D 88 89 88 9D 88 89 88 9D 88
;           89 88 8C 88 89 88 89 88 89 88 89 88 89 88 89 88
;           89 88 9F 9E 89 88 89 88 89 88 89 88 89 88 89 88
;           89 88 89 88 89 88 89 88 89 88 9F 9D 9D 88 9F 9E
;           9D 88 9F 9D 89 88 89 88 89 88 89 88 89 88 89 88
;           9D 88 9F 9E 89 88 89 88 89 88 9E 9D 89 88 9E 9D
;
; 181F30:   Weapon Pallete ID List Data (add the data below)
;           00 00 00 00 86 00 86 00 86 00 86 00 00 00 00 00
;           86 00 89 86 86 00 89 86 86 00 86 00 86 00 89 86
;           83 00 86 00 83 00 86 00 00 00 00 00 83 00 86 00
;           83 00 86 00 83 00 85 00 86 00 89 86 00 00 00 00
;           00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
;
; 181F80:   Treasure Pallete ID List Data (add the data below)
;           83 00 83 00 86 00 89 88 83 00 83 00 86 85 86 85
;           83 00 83 00 89 00 89 00 89 00 89 00 8F 00 90 00
;           00 00 00 00 00 00 00 00 86 00 86 00 86 00 86 00
;           88 00 88 00 86 00 89 88 95 00 83 00 89 00 89 00
;           86 00 89 88 00 00 00 00 00 00 00 00 00 00 00 00

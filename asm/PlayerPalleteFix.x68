*----------------------------------------------------------------------------------------------
* Title:        CDREE Player Pallete Fix
* Written by:   GameHackFan
* Date:
* Description:  Forces players to use the correct pallete.
*----------------------------------------------------------------------------------------------

  JMP         $181B00                   ; Replace 1CDA0.
  NOP
  NOP
  NOP

; ORG         $181B00

                                        ; Block of code that sets the correct pallete (1CDA8).
  MOVE.L      #$4000000, ($4, A6)       ; Code from the original game that was replaced to jump to this code.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  JMP         $1CDAC                    ; Jumps back to where it stopped in the original code.



  JMP         $181B30                   ; Replace 1CDD4.

; ORG         $181B30

                                        ; Block of code that sets the correct pallete (1CDD4).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVEQ       #$0, D0                   ; Code from the original game that was replaced to jump to this code.
  JMP         $1CDDA                    ; Jumps back to where it stopped in the original code.



  JSR         $181B60                   ; Replace 619C, 6200.

; ORG         $181B60

                                        ; Block of code that forces the pallete ID to 16.
  MOVE.B      #$96, ($23, A0)           ; Stores 96 inside ($23 + A0), the pallete ID 16.
  MOVE.B      #$1, (A0)                 ; Code from the original game that was replaced to jump to this code.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $181B80

                                        ; Block of code that sets the correct pallete (18A94).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.B      #1, (A6)                  ; Code from the original game readjusted.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $18B4C                    ; Replace 18B4C (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (18B4C).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.B      #$1, ($51, A6)            ; Code from the original game that was replaced.
  JSR         $62D6.L                   ; Code from the original game that was replaced.
  MOVE.B      #$2, (A6)                 ; Code from the original game readjusted.


; ORG         $18D18                    ; Replace 18D18 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (18D1E).
  MOVE.B      #$1, (A6)                 ; Code from the original game readjusted.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.


; ORG         $18D9A                    ; Replace 18D9A (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (18DBA).
  CMP.W       #$202, ($4, A6)           ; Code from the original game that was replaced.
  BEQ         $18DC6                    ; Code from the original game readjusted.
  MOVE.B      #$10, ($59, A6)           ; Code from the original game that was replaced.
  MOVE.L      #$2020000, ($4, A6)       ; Code from the original game that was replaced.
  MOVE.W      A6, ($68, A6)             ; Code from the original game that was replaced.
  CLR.W       ($B6, A6)                 ; Code from the original game that was replaced.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.


; ORG         $19150                    ; Replace 19150 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1915C).
  CLR.B       ($00C8, A6)               ; Code from the original game readjusted.
  MOVE.B      #$3C, ($72, A6)           ; Code from the original game that was replaced.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.


; ORG         $1986C                    ; Replace 1986C (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1986C).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.W      A6, ($70, A0)             ; Code from the original game that was replaced.
  CMP.B       #$2, ($BA, A6)            ; Code from the original game that was replaced.
  BNE         $198B4                    ; Code from the original game readjusted.


; ORG         $19A4C                    ; Replace 1AF52 (There is space to replace everything).

                                        ; Block of code that fixes a jump (19A72 is now at 19A70).
  BEQ         $19A70                    ; Code from the original game readjusted.


; ORG         $19A6C                    ; Replace 19A6C, 1AE52, 1AF72 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (19A72/1AE58/1AF78).
  MOVE.B      #$2, (A6)                 ; Code from the original game readjusted.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.


; ORG         $1AE32                    ; Replace 1AE32 (There is space to replace everything).

                                        ; Block of code that fixes a jump (1AE58 is now at 1AE56).
  BEQ         $1AE56                    ; Code from the original game readjusted.


; ORG         $1AF52                    ; Replace 1AF52 (There is space to replace everything).

                                        ; Block of code that fixes a jump (1AF78 is now at 1AF76).
  BEQ         $1AF76                    ; Code from the original game readjusted.


; ORG         $1BD78                    ; Replace 1BD78 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1BD78).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.B      ($11D, A6), D0            ; Code from the original game that was replaced.
  AND.W       #$3, D0                   ; Code from the original game that was replaced.
  CMP.W       #$3, D0                   ; Code from the original game that was replaced.
  BNE         $1BD92                    ; Code from the original game readjusted.


; ORG         $1C066                    ; Replace 1C066 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C06A).
  BNE         $1C0D0                    ; Code from the original game readjusted.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.


; ORG         $1C0DA                    ; Replace 1C0DA (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C0DA).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  TST.W       ($6C, A6)                 ; Code from the original game that was replaced.
  BNE         $1C0F4                    ; Code from the original game readjusted.


; ORG         $1C128                    ; Replace 1C128 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C12C).
  BNE         $1C192                    ; Code from the original game readjusted.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.


; ORG         $1C1C0                    ; Replace 1C1C0 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C1C0).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.B      #$23, ($00C8, A6)         ; Code from the original game that was replaced.
  MOVEQ       #$0, D0                   ; Code from the original game that was replaced.
  BSR         $1D244                    ; Code from the original game that was replaced.
  MOVE.W      ($68, A6), A0             ; Code from the original game that was replaced.
  MOVEQ       #$0, D1                   ; Code from the original game that was replaced.
  MOVE.W      ($8, A0), D0              ; Code from the original game that was replaced.
  CMP.W       ($8, A6), D0              ; Code from the original game that was replaced.
  BCC         $1C1E4                    ; Code from the original game readjusted.


; ORG         $1C3A0                    ; Replace 1C3A0 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C3A0).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.B      #$23, ($00C8, A6)         ; Code from the original game that was replaced.
  MOVEQ       #$0, D0                   ; Code from the original game that was replaced.
  BSR         $1D244                    ; Code from the original game that was replaced.
  MOVE.W      ($68, A6), A0             ; Code from the original game that was replaced.
  MOVEQ       #$0, D1                   ; Code from the original game that was replaced.
  MOVE.W      ($8, A0), D0              ; Code from the original game that was replaced.
  CMP.W       ($8, A6), D0              ; Code from the original game that was replaced.
  BCC         $1C3C4                    ; Code from the original game readjusted.


; ORG         $1C58A                    ; Replace 1C58A (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C58A).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.B      #$23, ($00C8, A6)         ; Code from the original game that was replaced.
  CLR.B       ($00CC, A6)               ; Code from the original game that was replaced.
  MOVEQ       #$8, D0                   ; Code from the original game that was replaced.
  JSR         $13B0.L                   ; Code from the original game that was replaced.
  MOVE.W      #$600, D0                 ; Code from the original game that was replaced.
  MOVE.W      #$FFE8, D1                ; Code from the original game that was replaced.
  TST.B       ($24, A6)                 ; Code from the original game that was replaced.
  BEQ         $1C5B4                    ; Code from the original game readjusted.


; ORG         $1C700                    ; Replace 1C700 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C700).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVE.W      ($68, A6), A0             ; Code from the original game that was replaced.
  MOVEQ       #$0, D1                   ; Code from the original game that was replaced.
  MOVE.W      ($8, A0), D0              ; Code from the original game that was replaced.
  CMP.W       ($8, A6), D0              ; Code from the original game that was replaced.
  BCS         $1C718                    ; Code from the original game readjusted.


; ORG         $1C814                    ; Replace 1C814 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C832).
  BNE         $1C81A                    ; Code from the original game readjusted (1C81C).
  LEA         ($AA2, PC), A0            ; Code from the original game readjusted (1D2BA). 
  MOVE.W      (A0)+, ($16, A6)          ; Code from the original game that was replaced.
  MOVE.W      (A0), D0                  ; Code from the original game that was replaced.
  ADD.W       D0, D0                    ; Code from the original game that was replaced.
  MOVE.W      D0, ($1C, A6)             ; Code from the original game that was replaced.
  JSR         $189C.L                   ; Code from the original game that was replaced.
  ADDQ.B      #$2, ($7, A6)             ; Code from the original game that was replaced.
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.


; ORG         $1C8C4                    ; Replace 1C8C4 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1C8C4).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  LEA         ($9B0, PC), A0            ; Code from the original game readjusted (1D27C). 
  CMP.B       #$E, ($6, A6)             ; Code from the original game that was replaced.
  BEQ         $1C8E4                    ; Code from the original game readjusted.



; ORG         $1CA38                    ; Replace 1CA38 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1CA38).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  LEA         ($83C, PC), A0            ; Code from the original game readjusted (1D27C). 
  CMP.B       #$14, ($6, A6)            ; Code from the original game that was replaced.
  BEQ         $1CA58                    ; Code from the original game readjusted.


; ORG         $1CFB4                    ; Replace 1CFB4 (There is space to replace everything).

                                        ; Block of code that sets the correct pallete (1CFB4).
  MOVE.B      ($17C, A6), ($23, A6)     ; Stores ($17C + A6) inside ($23 + A6), the correct pallete ID.
  MOVEQ       #$0, D0                   ; Code from the original game that was replaced.
  TST.W       ($14, A6)                 ; Code from the original game that was replaced.
  BPL         $1CFC4                    ; Code from the original game readjusted.


; This module has routines that fixes the palletes of the 
; players to being reset, which allows a custom pallete to
; be used. It also modifies some code to allow the custom 
; pallete ID instead of resetting it to original and has a
; routine that forces the player speech balloons to use
; pallete 16.
;
; 181B00:   Force Custom Pallete ID 1 (Current Player)
; 181B30:   Force Custom Pallete ID 2 (Current Player)
; 181B60:   Force Pallete ID 16
; 181B80:   Force Custom Pallete ID 3 (Current Player)
;
; 018B4C:   Force Custom Pallete ID / Player Pallete Fix 1
; 018D18:   Force Custom Pallete ID / Player Pallete Fix 2
; 018D9A:   Force Custom Pallete ID / Player Pallete Fix 3
; 019150:   Force Custom Pallete ID / Player Pallete Fix 4
; 01986C:   Force Custom Pallete ID / Player Pallete Fix 5
; 019A4C:   Force Custom Pallete ID / Player Pallete Fix 6
; 019A6C:   Force Custom Pallete ID / Player Pallete Fix 7
; 01AE32:   Force Custom Pallete ID / Player Pallete Fix 8
; 01AF52:   Force Custom Pallete ID / Player Pallete Fix 9
; 01BD78:   Force Custom Pallete ID / Player Pallete Fix 10
; 01C066:   Force Custom Pallete ID / Player Pallete Fix 11
; 01C0DA:   Force Custom Pallete ID / Player Pallete Fix 12
; 01C128:   Force Custom Pallete ID / Player Pallete Fix 13
; 01C1C0:   Force Custom Pallete ID / Player Pallete Fix 14
; 01C3A0:   Force Custom Pallete ID / Player Pallete Fix 15
; 01C58A:   Force Custom Pallete ID / Player Pallete Fix 16
; 01C700:   Force Custom Pallete ID / Player Pallete Fix 17
; 01C814:   Force Custom Pallete ID / Player Pallete Fix 18
; 01C8C4:   Force Custom Pallete ID / Player Pallete Fix 19
; 01CA38:   Force Custom Pallete ID / Player Pallete Fix 20
; 01CFB4:   Force Custom Pallete ID / Player Pallete Fix 21
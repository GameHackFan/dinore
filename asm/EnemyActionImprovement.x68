*----------------------------------------------------------------------------------------------
* Title:        DINORE Enemy Action Improvement
* Written by:   GameHackFan
* Date:         
* Description:  It has routines to make some changes to the 
*               actions of the enemies.
*----------------------------------------------------------------------------------------------

; ORG         $181800

                                        ; Block of code that calculate and sets the custom outside screen flag.
  CMP.B       #$18, ($3, A6)            ; Compares 18 and ($3 + A6), the enemy ID.
  BNE         $181826                   ; If it is not 18, it is not Slisaur, go to the last line.
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



  JMP         $181880                   ; Replace 37D3A, 37EB0, 37F86.

; ORG         $181880

                                        ; Block of code that decides if Tyrog should slap.
  MOVE.B      ($A7, A6), D2             ; Stores ($A7 + A6) inside D2, Tyrog internal timer.
  AND.W       #$3F, D2                  ; D2 and 3F, 0 - 3F range values.
  CMP.B       #$14, D2                  ; Compares 14 and D2, 0 - 14 he will try to slap, 32.8125% chance.
  BHI         $1818E6                   ; If it is bigger than 14, go to the 3rd block of code, ignore slap.
  MOVE.W      ($76, A6), D1             ; Stores ($76 + A6) inside D1, the target memory address.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1, so it can be used in combination with A5.
  MOVE.W      ($10, A5, D1.W), D2       ; Stores ($10 + A5 + D1.W) inside D2, target position Y.
  ADDQ.W      #6, D2                    ; Adds 6 to D2, makes the calc 0 based, 6 up and 6 down from where tyrog is.
  SUB.W       ($10, A6), D2             ; Subtracts ($10 + A6) from D2, Tyrog position Y.
  CMP.W       #$C, D2                   ; Compares C and D2, 0 - C (-6 to 6) is a good range to slap.
  BHI         $1818E6                   ; If it is bigger than C, go to the 3rd block of code.
  MOVE.W      ($8, A5, D1.W), D2        ; Stores ($8 + A5 + D1.W) inside D2, target position X.
  ADD.W       #$82, D2                  ; Adds 82 to D2, makes the calc 0 based, 82 left and 82 right from where tyrog is.
  SUB.W       ($8, A6), D2              ; Subtracts ($8 + A6) from D2, Tyrog position X.
  CMP.W       #$104, D2                 ; Compares 104 and D2, 0 - 104 (-82 to 82) is a good range to slap.
  BHI         $1818E6                   ; If it is bigger than 82, go to the 3rd block of code.
  
                                        ; Block of code that executes the slap attack.
  CMP.W       #$82, D2                  ; Compares 82 and D2.
  BHI         $1818C4                   ; If it is bigger than 82, player is at the right side, ignore the 2 lines below.
  CLR.B       ($24, A6)                 ; Clears ($24 + A6), Tyrog look direction flag, looks left.
  BRA         $1818CA                   ; Jumps 1 line, ignore the line below.
  MOVE.B      #1, ($24, A6)             ; Stores 1 inside ($24 + A6), Tyrog look direction flag, looks right.
  MOVE.B      #$E, ($6, A6)             ; Code from the original game, the slap action.
  MOVE.W      #$3C, ($AC, A6)           ; Code from the original game.
  CLR.B       ($B9, A6)                 ; Code from the original game readjusted.
  JSR         $32A58                    ; Code from the original game.
  MOVEQ       #$18, D0                  ; Code from the original game.
  JMP         $120E                     ; Code from the original game.

                                        ; Block of code that executes the action he would execute.
  MOVE.W      #$3C, ($AC, A6)           ; Code from the original game.
  MOVE.B      ($6, A6), D2              ; Stores ($6 + A6) inside D2, the action Tyrog wants to execute.
  BTST        #6, D2                    ; Tests if the 7th bit of D2.
  BNE         $181908                   ; If it is not 0, go to the last line.
  BTST        #5, D2                    ; Tests if the 6th bit of D2.
  BNE         $181902                   ; If it is not 0, go ignore the line below.
  JMP         $37EB6                    ; Jumps back to where it stopped in the action 1E.
  JMP         $37F8C                    ; Jumps back to where it stopped in the action 36.
  JMP         $37D40                    ; Jumps back to where it stopped in the action 46.



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
; 181880:   Tyrog Try To Change To Slap Action
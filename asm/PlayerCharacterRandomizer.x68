*----------------------------------------------------------------------------------------------
* Title:        DINORE Player Character Randomizer
* Written by:   GameHackFan
* Date:         
* Description:  Randomizes the character for every area if
*               the randomize flag is active.
*               Select the character pressing Start to do that.
*----------------------------------------------------------------------------------------------

; ORG         $180700

                                        ; Block of code that sets the randomizer flag.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($2, A6), D1              ; Stores ($2 + A6) inside D1, the player ID.
  BSET        D1, D0                    ; Sets the D1 bit of D0 to 1, the player start input bit index.
  AND.B       ($1A, A5), D0             ; D0 and ($1A + A5), the player start input, 1+ if pressed.
  MOVE.B      D0, ($17D, A6)            ; Stores D0 inside ($17D + A6), the character randomizer flag.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180730

                                        ; Block of code that randomizes a number.
  CLR.W       D1                        ; Clears D1.
  MOVE.B      ($2, A6), D1              ; Stores ($2 + A6) inside D1, the current player ID.
  ADD.W       D1, D1                    ; Adds D1 to D1, doubles it, the prime number is 2 bytes.
  MOVE.W      ($0C, PC, D1.W), D1       ; Stores ($0C + PC + D1.W) inside D1, a prime number.
  MULU.W      D6, D1                    ; Mutiplies D6 by D1, par of the randomizer calculation.
  LSR.W       #$8, D1                   ; Shifts right D1 bits by 8, part of the randomizer calculation. 
  MOVE.W      D1, D6                    ; Stores D1 inside D6, the new seed.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180760
                                        ; Block of code sets the random character.
  AND.W       #$3, D1                   ; D1 and 3, there are only 4 playable characters.
  MOVE.B      D1, ($3, A6)              ; Stores D1 inside ($3 + A6), the randomized character ID.
  LSL.W       #$2, D1                   ; Shifts left D1 bits by 2, the next value must be ID * 4. 
  MOVE.W      D1, ($20, A6)             ; Stores D1 inside ($20 + A6), the randomized character ID.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180780

                                        ; Block of code that randomizes a character for the current player.
  TST.B       ($17D, A6)                ; Compares 0 and ($17D + A6), the player randomizer flag.
  BEQ         $180794                   ; If it is 0, go to the RTS line.
  BSR         $181A00                   ; Calls the routine that saves the current time inside D6.
  BSR         $180730                   ; Calls the routine that randomizes a number.
  BSR         $180760                   ; Calls the routine that sets the random character.
  BSR         $180730                   ; Calls the routine that randomizes a number.
  BSR         $1803C0                   ; Calls the routine that sets the color.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $1807B0

                                        ; Block of code that checks if characters should be randomized.
  BSR         $181A30                   ; Calls the routine that saves some registers values.
  BSR         $181A90                   ; Calls the routine that saves the stage and area ID inside D6.
  MOVE.L      #$80420024, D0            ; Stores 80420024 inside D0, all stage area forbidden flag.
  BTST        D6, D0                    ; Test the D6 bit from D0, if it is a forbidden area.
  BNE         $1807E0                   ; If it is not 0, it is a forbidden area, go to the last BSR line.

                                        ; Block of code that randomizes the characters for all players.
  LEA         ($3274, A5), A6           ; Stores $3274 + A5 inside A6, player 1 memory address.
  BSR         $180780                   ; Calls the routine that randomizes a character for P1.
  BSR         $180500                   ; Calls the color conflict and character flags routine.
  LEA         ($33F4, A5), A6           ; Stores $33F4 + A5 inside A6, player 2 memory address.
  BSR         $180780                   ; Calls the routine that randomizes a character for P2.
  BSR         $180500                   ; Calls the color conflict and character flags routine.
  LEA         ($3574, A5), A6           ; Stores $3574 + A5 inside A6, player 2 memory address.
  BSR         $180780                   ; Calls the routine that randomizes a character for P3.
  BSR         $180500                   ; Calls the color conflict and character flags routine.
  BSR         $181A60                   ; Calls the routine that retore some registers values.
  RTS                                   ; Returns back to the routine that called this code.



; This module has several routines needed to ensure the
; player character randomizer feature will work properly.
; To activate the character randomizer, select the character
; pressing start.
;
; 180700:    Sets the Randomizer Flag.
; 180730:    Randomizes a Number in D1, D6.
; 180760:    Sets Random Character (Current Player).
; 180780:    Randomizes a Character and Color (Current Player).
; 1807B0:    Randomizes a Character and Color (All Players).
;
; 180746:    Prime Numbers Used By Randomizer (Add the text bytes bellow).
;            0778 CD67 3D49 
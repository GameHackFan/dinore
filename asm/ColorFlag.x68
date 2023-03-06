*----------------------------------------------------------------------------------------------
* Title:        DINORE Color Flag
* Written by:   GameHackFan
* Date:         
* Description:  It handles character confirmation, with color
*               conflict and randomizer flag.
*               
*----------------------------------------------------------------------------------------------

; ORG         $180500

                                        ; Block of code that fixes the color conflict.
  CLR.W       D6                        ; Clears D6, will be used as conflict mask.                                        
  MOVE.W      #$3274, D0                ; Stores 3274 inside D0, player 1 memory offset.
  BSR         $18051A                   ; Calls color conflict mask routine.
  MOVE.W      #$33F4, D0                ; Stores 33F4 inside D0, player 2 memory offset.
  BSR         $18051A                   ; Calls color conflict mask routine.
  MOVE.W      #$3574, D0                ; Stores 3574 inside D0, player 3 memory offset.
  BSR         $18051A                   ; Calls color conflict mask routine.
  BSR         $18054E                   ; Calls color conflict fix routine.
  BSR         $180570                   ; Calls the routine that sets player color flags.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that updates the color conflict mask.
  TST.B       (A5, D0.W)                ; Compares 0 and (A5 + D0.W), the other player active flag.
  BEQ         $18054C                   ; If it is 0, go to the RTS line. 
  MOVE.W      A6, D1                    ; Stores A6 inside D1, current player address.
  SUB.W       #$8000, D1                ; Subtracts 8000 from D1.
  CMP.W       D0, D1                    ; Compares D0 and D1, both players address.
  BEQ         $18054C                   ; If they are the same, go to the RTS line.
  MOVE.B      ($3, A5, D0.W), D1        ; Stores ($3 + A5 + D0.W) inside D1, the other player character ID.
  CMP.B       ($3, A6), D1              ; Compares ($3 + A6) and D1, both players character ID.
  BNE         $18054C                   ; If they are not equal, go to the RTS line.
  ADD.W       A5, D0                    ; Adds A5 to D0, current player memory region.
  SUB.W       #$B274, D0                ; Subtracts B274 from D0, P1 memory address.
  LSR.W       #8, D0                    ; Shifts right D0 bits by 8, the pallete ID.
  ADDQ.W      #1, D0                    ; Adds 1 to D0, P1 is 1, P2 is 2, P3 is 4.
  LSR.W       #1, D0                    ; Shifts right D0 bits by 1, 1 is 0, 2 is 1, 4 is 2.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, the color selected offset.
  MOVE.W      (A5, D0.W), D0            ; Stores (A5 + D0.W) inside D0, the other player color ID.
  BSET        D0, D6                    ; Sets the D0 bit from D6 to 1, the other player color to the conflict mask.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that fixes the color conflict
  CLR.W       D0                        ; Clears D0.
  MOVE.B      ($2, A6), D0              ; Stores ($2 + A6) inside D0, the current player ID.
  ADD.W       D0, D0                    ; Adds D0 to D0, doubles it because the color is 2 bytes.
  ADD.W       #$7F00, D0                ; Adds 7F00 to D0, the color selected offset.
  MOVE.W      (A5, D0.W), D1            ; Stores (A5 + D0.W) inside D1, the player color ID.
  BTST        D1, D6                    ; Test the D1 bit from D6, if the color is in use.
  BEQ         $18056A                   ; If the bit is 0, color is not in use, ignore the 3 lines below.
  ADDQ.W      #1, D1                    ; Adds 1 to D1, the next color.
  AND.W       #7, D1                    ; D1 and 7, to force a valid color.
  BRA         $18055E                   ; Jumps back to the BTST line.
  MOVE.W      D1, (A5, D0.W)            ; Stores D1 inside (A5 + D0.W), the player color ID fixed.
  RTS

                                        ; Block of code that sets the color flags.
  MOVE.W      #$EDCB, ($17E, A6)        ; Stores EDCB inside ($17E + A6), player flag.
  MOVE.B      ($2, A6), D1              ; Stores ($2 + A6) inside D1, the current player ID.
  BSET        #7, D1                    ; Sets the 8th bit of D1 to 1, custom pallete flag.
  MOVE.B      D1, ($17C, A6)            ; Stores D1 inside ($17C + A6), custom pallete ID backup.
  MOVE.B      D1, ($23, A6)             ; Stores D1 inside ($23 + A6), pallete ID.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $1805B0

                                        ; Block of code that clears all custom flags.
  CLR.L       ($33F0, A5)               ; Clears ($33F0 + A5), P1 custom flags.
  CLR.L       ($3570, A5)               ; Clears ($3570 + A5), P2 custom flags.
  CLR.L       ($36F0, A5)               ; Clears ($36F0 + A5), P3 custom flags.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $1805D0                   ; Replace 96FDE.

; ORG         $1805D0

                                        ; Block of code that sets the player pallete ID inside the car.
  MOVE.W      D0, D6                    ; Stores D0 inside D6, the seat ID.
  ADD.W       #$7F10, D6                ; Adds 7F10 to D6, the seat 1 offset.
  MOVE.B      (A5, D6.W), D6            ; Stores (A5 + D6.W) inside D6, pallete ID inside the seat.
  MOVE.B      D6, ($23, A0)             ; Stores D6 inside ($23 + A0), the custom pallete ID.
  MOVE.B      #1, (A0)                  ; Code from the original game readjusted.
  JMP         $96FE4                    ; Jumps back to where it stopped in the original code.



  JMP         $180600                   ; Replace 971E0.

; ORG         $180600

                                        ; Block of code that sets the car color flags in the memory region of the player inside the car.
  MOVE.B      ($7F10, A5), ($23, A0)    ; Stores ($7F10 + A5) inside ($23 + A0), the driver pallete ID.
  MOVE.B      #1, (A0)                  ; Code from the original game readjusted.
  JMP         $971E6                    ; Jumps back to where it stopped in the original code. 



  JMP         $180620.L                 ; Replace 8BD66.

; ORG         $180620

                                        ; Block of code that properly saves the seat pallete ID.
  BSR         $181A30                   ; Calls the routine that saves some register values.
  CLR.L       D0                        ; Clears D0.
  CLR.L       D1                        ; Clears D1.
  LEA         ($7F10, A5), A1           ; Stores ($7F10 + A5) inside A1, the 1st seat address.
  LEA         (-$100, A2), A2           ; Stores (-$100 + A2) inside A2, the current player.
  BSR         $180668                   ; Calls the routine that sets the driver seat color flag.
  LEA         ($3274, A5), A2           ; Stores ($3274 + A5) inside A0, the 1st player.
  BSR         $180654                   ; Calls the routine that sets the other seats color flags.
  LEA         ($33F4, A5), A2           ; Stores ($33F4 + A5) inside A0, the 2nd player.
  BSR         $180654                   ; Calls the routine that sets the other seats color flags.
  LEA         ($3574, A5), A2           ; Stores ($3574 + A5) inside A0, the 3rd player.
  BSR         $180654                   ; Calls the routine that sets the other seats color flags.
  BSR         $181A60                   ; Calls the routine that restore some register values.

                                        ; Block of code that executes the replaced code and go back.
  MOVE.L      D0, A0                    ; Code from the original game that was replaced to jump to this code.
  MOVE.L      D1, A1                    ; Code from the original game that was replaced to jump to this code.
  MOVE.L      D2, A2                    ; Code from the original game that was replaced to jump to this code.
  JMP         $8BD6C                    ; Jumps back to where it stopped in the original code.
  
                                        ; Block of code that stores the player color in the seat memory region.
  TST.B       (A2)                      ; Compares 0 and (A2), if the player is active.
  BEQ         $180666                   ; If it is 0, go to the RTS line.
  MOVE.B      ($2, A2), D1              ; Stores ($2 + A2) inside D1, the checking player ID.
  BTST        D1, D0                    ; Test the D1 bit of D0, if the player was already computed.
  BNE         $180666                   ; If it the bit is 0, go to the RTS line.
  MOVE.B      ($17C, A2), (A1)+         ; Stores ($17C + A2) inside (A1) and adds 1 to A1, the current player color to the seat.
  BSET        D1, D0                    ; Sets the D1 bit from D0 to 1, the current player ID flag.
  RTS                                   ; Returns back to the routine that called this code.
  MOVE.B      ($2, A2), D1              ; Stores ($2 + A2) inside D1, the checking player ID.
  MOVE.B      ($17C, A2), (A1)+         ; Stores ($17C + A2) inside (A1) and adds 1 to A1, the current player color to the seat.
  BSET        D1, D0                    ; Sets the D1 bit from D0 to 1, the current player ID flag.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $8C7B0                    ; Replace 8C7B0 (There is space to replace everything).

                                        ; Block of code that forces Mess to be the driver.
  MOVE.B      #$3, ($A2, A6)            ; Stores 3 inside ($A2 + A6), Mess ID, he has good pallete support.
  RTS                                   ; Returns back to the routine that called this code.
  NOP                                   ; No operation, does nothing. 
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.



; This module provides routines that solves color conflicts 
; that might happen if 2 or 3 players select the same color,
; changing to the next color in case of color conflict.
; It also handles all character flags needed to allow the color
; feature to be properly available.
;
; 180500:   Color Conflict and Character Flags (Current Player)
; 1805B0:   Clear All Players Character Flags.
; 1805D0:   Set Player Pallete ID Inside the Car.
; 180600:   Set Player Driver Pallete ID to CPU Driver.
; 180620:   Saves Seat Pallete ID.
;
; 08C7B0:   Force Mess As CPU Driver.
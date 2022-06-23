*----------------------------------------------------------------------------------------------
* Title:        DINORE Color Flag
* Written by:   GameHackFan
* Date:         
* Description:  It forces the custom color flag and pallete id to the players.
*----------------------------------------------------------------------------------------------

; ORG         $180600

                                        ; Block of code that sets the player custom pallete flags.
  MOVE.W      #$EDCB, ($17E, A6)        ; Stores EDCB inside ($17E + A6), custom pallete flag.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  MOVE.W      A6, D6                    ; Stores A6 inside D6, current player memory region.
  SUB.W       #$B274, D6                ; Subtracts B274 from D6, P1 address.
  LSR.W       #8, D6                    ; Shifts right D6 bits by 8, the pallete ID.
  ADDQ.W      #1, D6                    ; Adds 1 to D6, P1 is 1, P2 is 2, P3 is 4.
  LSR.W       #1, D6                    ; Shifts right D6 bits by 1, 1 is 0, 2 is 1, 4 is 2.  
  MOVE.W      D6, ($17C, A6)            ; Stores D6 inside ($17C + A6).
  CLR.W       D6                        ; Clears D6.
  SWAP        D6                        ; Invert D6 higher and lower bits, lower bits are used in a loop.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180630

                                        ; Block of code that clears car flags.
  CLR.W       ($7F10, A5)               ; Clears ($7F10 + A5), inside car flag.
  CLR.W       ($7F12, A5)               ; Clears ($7F12 + A5), seat 1.
  CLR.W       ($7F14, A5)               ; Clears ($7F14 + A5), seat 2.
  CLR.W       ($7F16, A5)               ; Clears ($7F16 + A5), seat 3.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $180660

                                        ; Block of code that clears custom pallete flag.
  CLR.W       ($33F2, A5)               ; Clears ($33F2 + A5), P1 custom pallete flag.
  CLR.W       ($3572, A5)               ; Clears ($3572 + A5), P2 custom pallete flag.
  CLR.W       ($36F2, A5)               ; Clears ($36F2 + A5), P3 custom pallete flag.
  RTS                                   ; Returns back to the routine that called this code.



  JMP         $180680.L                 ; Replace 8BD66.

; ORG         $180680

                                        ; Block of code that checks who is the current player and maps the seats.
  MOVE.W      D6, ($7FE0, A5)           ; Stores D6 inside ($7FE0 + A5), saves D6 value for safety.
  MOVE.W      ($7C, A2), D6             ; Stores ($7C + A2) inside D6, the player ID.
  TST.W       D6                        ; Compares 0 and D6, 0 if it is P1.
  BEQ         $1806BA                   ; If it is 0, go to the 4th block of code.
  BTST        #1, D6                    ; Test 2nd bit of D6, 0 for P1, 0 for P2, 1 for P3.
  BEQ         $1806A6                   ; If it is 0, go to the 3rd block of code.

                                        ; Block of code that maps the seats when P3 is the driver.
  MOVE.W      #2, ($7F12, A5)           ; Stores 2 inside ($7F12 + A5), seat 1 with P3 ID.
  MOVE.W      #0, ($7F14, A5)           ; Stores 0 inside ($7F14 + A5), seat 2 with P1 ID.
  MOVE.W      #1, ($7F16, A5)           ; Stores 1 inside ($7F16 + A5), seat 3 with P2 ID.
  BRA         $1806CC                   ; Go to the last block of code.

                                        ; Block of code that maps the seats when P2 is the driver.
  MOVE.W      #1, ($7F12, A5)           ; Stores 1 inside ($7F12 + A5), seat 1 with P2 ID.
  MOVE.W      #0, ($7F14, A5)           ; Stores 0 inside ($7F14 + A5), seat 2 with P1 ID.
  MOVE.W      #2, ($7F16, A5)           ; Stores 2 inside ($7F16 + A5), seat 3 with P3 ID.
  BRA         $1806CC                   ; Go to the last block of code.

                                        ; Block of code that maps the seats when P1 is the driver.
  MOVE.W      #0, ($7F12, A5)           ; Stores 0 inside ($7F12 + A5), seat 1 with P1 ID.
  MOVE.W      #1, ($7F14, A5)           ; Stores 1 inside ($7F14 + A5), seat 2 with P2 ID.
  MOVE.W      #2, ($7F16, A5)           ; Stores 2 inside ($7F16 + A5), seat 3 with P3 ID.

                                        ; Block of code that executes the replaced code and go back.
  MOVE.W      ($7FE0, A5), D6           ; Stores ($7FE0 + A5) inside D6, restores D6 value.
  MOVE.L      D0, A0                    ; Code from the original game that was replaced to jump to this code.
  MOVE.L      D1, A1                    ; Code from the original game that was replaced to jump to this code.
  MOVE.L      D2, A2                    ; Code from the original game that was replaced to jump to this code.
  JMP         $8BD6C                    ; Jumps back to where it stopped in the original code.



  JMP         $180700                   ; Replace 96FDE.
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP
  NOP

; ORG         $180700
                                        ; Block of code that sets the car color flags in the memory region of the player inside the car.
  MOVE.W      D0, D6                    ; Stores D0 inside D6, the seat ID.
  ADD.W       D6, D6                    ; Adds D6 to D6, doubles it because pallete ID is 2 bytes.
  ADD.W       #$7F12, D6                ; Adds 7F12 to D6, the seat 1 offset.
  MOVE.W      (A5, D6.W), D6            ; Stores (A5 + D6.W) inside D6, pallete ID inside the seat.
  MOVE.W      D6, ($FC, A0)             ; Stores D6 inside ($FC + A0), the pallete ID in the memory region.
  MOVE.W      #$EDCB, ($FE, A0)         ; Stores EDCB inside ($FE + A0), custom pallete flag.
  MOVE.W      #$90, ($20, A0)           ; Code from the original game that was replaced to jump to this code.
  MOVE.W      D0, ($26, A0)             ; Code from the original game that was replaced to jump to this code.
  MOVE.W      A6, ($58, A0)             ; Code from the original game that was replaced to jump to this code.
  MOVE.B      #1, (A0)                  ; Code from the original game readjusted.
  JMP         $96FF2                    ; Jumps back to where it stopped in the original code. 



  JMP         $180740.L                 ; Replace 8C006.
  NOP
  NOP
  NOP
  NOP

; ORG         $180740

                                        ; Block of code that sets the inside car flag.
  MOVE.W      #1, ($7F10, A5)           ; Stores 1 inside ($7F10 + A5), inside car flag.
  MOVEQ       #0, D0                    ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($338E, A5)           ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($350E, A5)           ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($368E, A5)           ; Code from the original game that was replaced to jump to this code.
  JMP         $8C014                    ; Jumps back to where it stopped in the original code.



  JMP         $180780.L                 ; Replace 8C836.
  NOP
  NOP
  NOP
  NOP

; ORG         $180780

                                        ; Block of code that clears the custom car flags.
  BSR         $180630                   ; Calls the routine that clears the inside car flag and seats.
  MOVEQ       #$FF, D0                  ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($A2, A6)             ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($A3, A6)             ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($A4, A6)             ; Code from the original game that was replaced to jump to this code.
  JMP         $8C844                    ; Jumps back to where it stopped in the original code.



; ORG         $8C7B0                    ; Replace 8C7B0 (There is space to replace everything without a jump).

                                        ; Block of code that forces Hannah to be the driver.
  MOVE.B      #2, ($A2, A6)             ; Stores 2 inside ($A2 + A6), Hannah ID, she has her original pallete.
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



; This module provides routines that handle the 
; color flags. It also executes several routines 
; that properly set the color flags, to ensure that  
; the custom color feature will work as intended.
;
; 180600:   Sets Custom Pallete Flags (Current Player)
; 180630:   Clear Custom Car Flags
; 180660:   Clears Custom Pallete Flags
; 180680:   Sets Custom Car Flags / Maps Players in the Seats (Current Player)
; 180700:   Sets Car Color Flags (Current Player)
; 180740:   Sets Inside Car Flag
; 180780:   Clear Custom Car Flags Caller
; 08C7B0:   Forces Hannah to be the Driver
*----------------------------------------------------------------------------------------------
* Title:        DINORE Game Utils
* Written by:   GameHackFan
* Date:         
* Description:  A routine to get the current time in frames.
*               Routines to save and restore register values.
*----------------------------------------------------------------------------------------------

; ORG         $181A00

                                        ; Block of code that stores the current time inside D6.
  MOVE.W      #$3C, D0                  ; Stores 3C inside D0, 60 frames per second.
  MOVE.B      ($75C5, A5), D6           ; Stores ($75C5 + A5) inside D6, the amount of seconds passed.
  MULU.W      D0, D6                    ; Multiplies D6 by D0, the seconds passed in frames.
  SUB.B       ($75C2, A5), D0           ; Subtracts ($75C2 + A5) from D0, the amount of frames left.
  ADD.W       D0, D6                    ; Adds D0 to D6, the amount of frames passed in the second.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181A30

                                        ; Block of code that saves some register values.
  MOVE.L      D0, ($7FE0, A5)           ; Stores D0 inside ($7FE0 + A5), saves D0 value for safety.
  MOVE.L      D1, ($7FE4, A5)           ; Stores D1 inside ($7FE4 + A5), saves D1 value for safety.
  MOVE.L      D6, ($7FE8, A5)           ; Stores D6 inside ($7FE8 + A5), saves D6 value for safety.
  MOVE.L      A0, ($7FEC, A5)           ; Stores A0 inside ($7FEC + A5), saves A0 value for safety.
  MOVE.L      A1, ($7FF0, A5)           ; Stores A1 inside ($7FF0 + A5), saves A1 value for safety.
  MOVE.L      A6, ($7FF4, A5)           ; Stores A6 inside ($7FF4 + A5), saves A6 value for safety.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181A60

                                        ; Block of code that restore some register values.
  MOVE.L      ($7FE0, A5), D0           ; Stores ($7FE0 + A5) inside D0, restores D0 value.
  MOVE.L      ($7FE4, A5), D1           ; Stores ($7FE4 + A5) inside D1, restores D1 value.
  MOVE.L      ($7FE8, A5), D6           ; Stores ($7FE8 + A5) inside D6, restores D6 value.
  MOVE.L      ($7FEC, A5), A0           ; Stores ($7FEC + A5) inside A0, restores A0 value.
  MOVE.L      ($7FF0, A5), A1           ; Stores ($7FF0 + A5) inside A1, restores A1 value.
  MOVE.L      ($7FF4, A5), A6           ; Stores ($7FF4 + A5) inside A6, restores A6 value.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181A90

                                        ; Block of code that stores current stage and area inside D6.
  CLR.L       D6                        ; Clears D6.
  MOVE.B      ($4D9, A5), D6            ; Stores ($4D9 + A5) inside D6, the stage ID.
  ADD.B       D6, D6                    ; Adds D6 to D6, the stage has at max 4 areas.
  ADD.B       D6, D6                    ; Adds D6 to D6, the stage has at max 4 areas.
  ADD.B       ($786, A5), D6            ; Adds ($786 + A5) to D6, the area ID.
  RTS                                   ; Returns back to the routine that called this code.



; ORG         $181AB0

                                        ; Block of code that randomizes a value in D0.
  CLR.L       D0                        ; Clears D0.
  MOVE.W      ($7EFE, A5), D0           ; Stores ($7EFE + A5) inside D0, the seed value.
  MULU.W      #$41A7, D0                ; Multiples D0 by 41A7, part of the randomization calc.
  MOVE.W      D0, ($7EFE, A5)           ; Stores D0 inside ($7EFE + A5), so D0 can be used.
  CLR.L       D0                        ; Clears D0.
  MOVE.B      ($75C2, A5), D0           ; Stores ($75C2 + A5) inside D0, current frame, to make dynamic.
  ADD.W       ($7EFE, A5), D0           ; Adds ($7EFE + A5) to D0, the value calculated earlier.
  LSR.L       #4, D0                    ; Shifts right D0 bits by 4, the final randomized value.
  MOVE.W      D0, ($7EFE, A5)           ; Stores D0 inside ($7EFE + A5), so D0 can be used.
  CLR.L       D0                        ; Clears D0.
  MOVE.W      ($7EFE, A5), D0           ; Stores ($7EFE + A5) inside D0, the seed value.
  RTS                                   ; Returns back to the routine that called this code.



; This module has a routines that saves and restore registers 
; values. It also has a routine that gets the current time
; in frames and a routine that randomizes a number and saves
; it in memory as seed for the next randomization
; 
; 181A00:   Saves Current Time in Frames in D6.
; 181A30:   Saves D0, D1, D6, A0, A1, A6 in RAM at FFFFE0.
; 181A60:   Restores D0, D1, D6, A0, A1, A6 from RAM at FFFFE0.
; 181A90:   Saves Stage ID and Area ID inside D6.
; 181AB0:   Randomizes a Value Inside D0.

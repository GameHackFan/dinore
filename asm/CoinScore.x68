*----------------------------------------------------------------------------------------------
* Title:        DINORE Coin Score
* Written by:   GameHackFan
* Date:         
* Description:  Changes the way the coin score works.
*----------------------------------------------------------------------------------------------

  JMP         $181200.L                 ; Replace 7494.
  NOP
  NOP
  NOP
  NOP

; ORG         $181200

                                        ; Block of code that checks if the coin score should be increased.
  SWAP        D2                        ; Invert D2 higher and lower bits, lower bits might be used later.
  SWAP        D3                        ; Invert D3 higher and lower bits, lower bits might be used later.
  MOVE.W      A0, D2                    ; Stores A0 inside D2, current player memory address.
  MOVE.W      A6, D3                    ; Stores A6 inside D3, the player who used a coin memory address.
  CMP.W       D2, D3                    ; Compare D2 and D3, both players address.
  BNE         $181218                   ; If they are not equal, go to the last block of code.

                                        ; Block of code that increases the coin score.
  ABCD        D1, D0                    ; Code from the original game that was replaced to jump to this code.
  BCC         $181214                   ; Code from the original readjusted.
  MOVE.B      #$99, D0                  ; Code from the original game that was replaced to jump to this code.
  MOVE.B      D0, ($103, A0)            ; Code from the original game that was replaced to jump to this code.

                                        ; Block of code that fix everything and go back to the original code.
  CLR.W       D2                        ; Clears D2.
  CLR.W       D3                        ; Clears D3.
  SWAP        D2                        ; Invert D2 higher and lower bits, lower bits might be used later.
  SWAP        D3                        ; Invert D3 higher and lower bits, lower bits might be used later.
  JMP         $74A2                     ; Jumps back to where it stopped in the original code.



; This module has a routine that forces the coin score 
; to be increased only for the player that used a coin, 
; instead of increasing the coin of all players when a 
; player uses a coin. Because the original game increases 
; the coin for all players when a player joins the game, 
; if a player joins the game after he game over, the 
; coin score of all players might go out of sync, so 
; this fix not just removes that, it also allows the 
; players to know how much coins each one of them used.
;
; 181200:   Coin Score Fix (Current Player)
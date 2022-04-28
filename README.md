# Cadillacs and Dinosaurs Readjusted
A mod for the Cadillacs and Dinosaurs (Arcade).
<br/>
This mod brings some extra features and fixes some bugs present in the original game.
<br/><br/>
You can access the patcher [here](https://gamehackfan.github.io/dinore/).
<br/><br/>

Version v1.0:
- Added Color Select Feature, see changes A to G.
- Change A: Jack, Hannah, Mustapha and Mess now have original + 7 extra colors.
- Change B: The palletes 0 (Jack), 1 (Hannah), 2 (Mustapha) are now P1, P2 and P3 palletes.
- Change C: Other sprites that were using pallete 0, 1, 2, 3 are now using palletes 16, 03, 15 and 18 (Razor, Mess, Blade, Thug palletes).
- Change D: Pallete 16 was changed to better support the new sprites attached to it (Jack pallete is used by knives and other stuff, so they need a compatible pallete to not look terrible, unfortunately, Razor now has a different colors because of that).
- Change E: Pallete 3 was replaced with Hannah's pallete to better support the new sprites attached to it (Mess doesn't need a pallete anymore, so added Hannah's pallete since it is used on body parts, blood and other stuff).
- Change F: Labels were added to represent the color selected, when selecting the character, press up or down to change the color.
- Change G: Forced Hannah to always be the driver of the car on 3rd stage due to her pallete be always available on Pallete 3.
- Added changes related to how some bosses select their target, See changes H to M.
- Change H: Slice might change his target when knocked down (no more corner bug, you have to fight him for real now).
- Change I: Tyrog might change his target when knocked down.
- Change J: Slisaur might change his target when knocked down (no more corner bug, you have to fight them for real now).
- Change K: Fessenden 1st form can now target any player (he is not locked to P2 if 2 people are playing or to P3 if 3 people are playing).
- Change L: Fessenden 2nd form might change his target when knocked down (no more stupid fights where he only walks, takes a beating and keep looking at your face).
- Change M: Fessenden 2nd form will change his target if on a clinch, he will automatically target the player that clinched him (no more clinch and beat him 3 hits and repeat forever while he does nothing until he dies).
- Changed some of the team special actions mostly due to 2 equal characters, see changes N to Q.
- Change N: Jack when pushing another Jack, the action will be the same as Mustapha's throw to the air, this change is needed or the game crashes since Jack doesn't have a team tag run animation cause no one else can push him in the game.
- Change O: Hannah when throwing Jack to the air, Jack will use the animation he uses when being thrown by Mustapha (the original one looks bugged, he temporarily runs in the air).
- Change P: Mustapha when throwing another Mustapha to the air, Mustapha will use the animation he uses when being thrown by Hannah.
- Change Q: Mess when throwing another Mess to the air, Mess will use the animation he uses when being thrown by Mustapha.
- Added changes to allow players to select the same character.
- Fixed extra life immortal bug (players could become immortal after getting an extra life).
- Increased 3rd Stage time from 3 minutes to 7 minutes, it can be finished without dying on time if you decide to not take the car now.
- Increased 5th Boss time, from 3 minutes and 50 seconds to 6 minutes.
- Increased 6th Boss time, from 3 minutes and 50 seconds to 6 minutes.
- Increased Final Boss time, from 4 minutes to 6 minutes.
- After a player die or use a coin, the time increase limit was changed from 4 minutes to 8 minutes.
- Punch + Jump Attack invulnerability after it is finished is now reduced from 60 frames to 16 (no more running from enemies and using it to become immortal, then no one can hit you and you demolish everyone).
- Punch + Jump Attack damage taken was reduced, 1st hit from 10 to 3, 2nd hit from 4 to 1. Now it can be used as it should, to avoid problematic situations without wasting all your HP.
- Jack, Hannah and Mustapha Punch + Attack damage given was reduced from 20 to 10, Mess from 23 to 11. Keep in mind the game recalculates it based on your current power (power changes as you take a hit).
- Bazooka bullets were increased from 4 to 6.
- Rifle bullets were increased from 6 to 8.
- Added a code to better handle coin score, now the player that join the battle in the middle of the game will not force all players to increase their coin score, only his own coin score will be increased.
- Play Mode is now limited to 3 players only (1 or 3 chute).
- Added a new text to the title screen displaying the name of the hack and version.

See all changes made [here](https://github.com/GameHackFan/dinore/blob/main/changelog).
<br/><br/>

Known Bugs:
- Sometimes when an enemy dies, he keeps rotating forever in the air and might softlock the game (bug present in the original game).
- If you hit butcher and your partner at the same time, all players become immortal (bug present in the original game).
- Sometimes the game throws an exception and it crashes, I saw that happen only on 4th stage, have no clue how it happens and why, it might also happen on other stages (bug present in the original game).
- Players can grab enemies from far away and sometimes even when they are in the air (bug present in the original game).
- Tyrog puke for some reason is not grabbing pallete 3, it is grabbing pallete 1 (P2) instead (Readjusted version bug).
- On 3rd Stage, sometimes the pallete of the CPU driver bugs (Readjusted version bug).
<br/><br/>


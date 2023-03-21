# Cadillacs and Dinosaurs Readjusted
A mod for the Cadillacs and Dinosaurs (World, Arcade).
<br/>
This mod brings some extra features and fixes some bugs present in the original game.
<br/><br/>
You can access the patcher [here](https://gamehackfan.github.io/dinore/).
<br/><br/>

Version 1.3:
- Changed the way the game handles custom pallete, see changes A to F.
- Change A: The custom palletes are now being handled with internal game flag to handle colors.
- Change B: Due to the change, some objects needed to have their pallete data changed.
- Change C: Zzzz and Ka Ta label pallete ID changed from 2 to E (pallete ID 2 is player 3 pallete).
- Change D: Interrogation and Exclamation Speech Ballons pallete ID changed to 16.
- Change E: The books at the library (7th Stage) are now using pallete 3, 14 and 1C.
- Change F: The knife and Slice boomerang pallete ID changed from 0 to 16.
- Change G: Boom label and Body parts pallete ID changed from 1 to 3.
- Change H: Dinosaur Egg pallete ID changed from 2 to 17.
- Change I: Player Speech Ballons are forced to use pallete 16 when they spawn.
- Change J: Bludge's puke pallete ID changed from 2 to 15 (pallete ID 2 is player 3 pallete).
- Change K: All Player Speech Balloons are now forced via code to use pallete 16.
- Change L: Player indicator 1P pallete ID changed from 0 to 3.
- Change M: Player indicator 2P pallete ID changed from 7 to E.
- Change N: That messy PalleteMapper is now gone (thank you for what you've done, good bye).
- Change O: Item Drops can spawn with different palletes, based on the current frame.
- Fixed a bug with Fessenden 1st Form targeting code that could cause the game to freeze.
- Fixed a bug where players could get wrong color on 3rd stage after getting the car.
- Forced Mess to be the CPU car driver (He matches almost every player pallete, if not all).
- Mess 8th color is now changed (it is time for mess to look like himself instead of like Hannah).
- Added a Player Character Randomizer. Select pressing the start button and the character will change for every new area.

See all changes made [here](https://github.com/GameHackFan/dinore/blob/main/changelog).
<br/><br/>

Known Bugs:
- Sometimes when an enemy dies, he keeps rotating forever in the air and might softlock the game (bug present in the original game).
- If you hit butcher and your partner at the same time, all players become immortal (bug present in the original game).
- Sometimes the game throws an exception and it crashes, I saw that happen only on 4th stage, have no clue how it happens and why, it might also happen on other stages (bug present in the original game).
- Players can grab enemies from far away and sometimes even when they are in the air (bug present in the original game).
- 2nd Form of Final Boss can be double or triple comboed by players, he dies without even moving (bug present in the original game).
- If you get an extra life in the score count screen at the end of a stage, you character doesn't cheer for defeating the boss and also stop moving, but it goes back to normal as soon as the next stage loads (bug present in the original game).
- Tyrog doesn't puke or spit fire if the player active flag is set to a value that makes the player immortal, Punch + Attack button does that, being knocked down also does that, throwing enemies too, several other situations (bug present in the original game).
- Tyrog puke for some reason is not grabbing pallete 3, it is grabbing pallete 1 / P2 instead (Readjusted version bug).
- On 3rd Stage, sometimes the pallete of the CPU driver bugs (Readjusted version bug).
- Gameplay demo is grabbing the new colors instead of the originals (Readjusted version bug).
<br/><br/>



WHAT'S NEXT: There isn't much left to do for this hack, maybe adjust some of the changes made. Forcing the sprites to use different palletes by changing their pallete values inside the ROM instead of remapping them when the game is running is one of the few major things left to improve. 

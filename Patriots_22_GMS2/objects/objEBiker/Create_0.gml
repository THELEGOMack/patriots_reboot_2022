///sprite values
//walk
legs = sprBikerLegs;
sprWalkUnarmed = sprBikerWalkUnarmed;
sprWalkShotgun = sprBikerWalkShotgun;
//sprWalkSawedOff = sprBikerWalkSawedOff;
sprWalkMP5 = sprBikerWalkMP5;
sprWalkM16 = sprBikerWalkM16;
sprWalkBat = sprBikerWalkBat;
//sprWalkButterfly = sprMafiaWalkButterfly;
//dead (placeholders)
sprDeadMachinegun = sprMafiaDeadMachinegun;
sprDeadShotgun = sprMafiaDeadShotgun;

event_inherited();

/*
if idleAnim != noone { //not working -- come back to this issue later
	sprite_index = idleAnim;
	//alarm to trigger animation
	}
*/
scrEGetAmmo();
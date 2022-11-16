//drop init, weapon assignment
switch(sprite_index)
{
	//guns
case sprMafiaWalkAK47:
case sprMafiaWalkAK47R: weapon = "AK47"; drop = sprAK47; ammoEnemy = 24; break;
case sprMafiaIdleM16:
case sprMafiaWalkM16:
case sprMafiaWalkM16R: weapon = "M16"; drop = sprM16; ammoEnemy = 24; break;
case sprMafiaWalkShotgun:
case sprMafiaWalkShotgunR: weapon = "Shotgun"; drop = sprShotgun; ammoEnemy = 6; break;
case sprMafiaWalkSilencer:
case sprMafiaWalkSilencerR:
case sprMafiaIdlePhoneSilencer: weapon = "Silencer"; drop = sprSilencer; ammoEnemy = 12; break;
	//melee
case sprMafiaIdleClub:
case sprMafiaWalkClubR:
case sprMafiaWalkClub: weapon = "Club"; drop = sprGolfClub; ammoEnemy = -1; break;
default: weapon = noone; drop = noone; ammoEnemy = -1; break;
}

//pathfinding
	//update path
	path = path_add();
	//draw target path
	if (instance_exists(objPlayer))
	{
		pathTargetX = objPlayer.x;
		pathTargetY = objPlayer.y;
	}

//initialize variables
sightDistance = 300; //100?
//sightMaxDistance = 300; //for cone of vision
attacking = false;
shootTimer = 0;
rxnTime = 15;
aggroTimer = 0;
alertTimer = 0;
hp = 1;
legAngle = 0;
legIndex = 0;
stateTXT = "null";
shellToggle = false;
seePlayer = false;
seeCorpse = false;
//foundWeapon = false;
image_speed = 0;
image_angle = direction;
currentAmmo = ammoEnemy;
weaponValues();
//drop init, weapon assignment
switch(sprite_index)
{
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
default: break;
}

//initialize variables
state = 0;
sightDistance = 200;
attacking = false;
shootTimer = 0;
rxnTime = 20;
aggroTimer = 0;
alertTimer = 0;
hp = 1;
stateTXT = "null";
shellToggle = false;
image_speed = 0;
direction = image_angle;
currentAmmo = ammoEnemy;
weaponValues();
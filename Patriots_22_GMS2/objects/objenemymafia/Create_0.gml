//state machine
stateIdle = function()
{
	stateTXT = "idle"
	aggroTimer = 0;
	if (instance_exists(objPlayer))
	{
		if (distance_to_object(objPlayer) <= 40)
		{
			stateAlert();
		}
	}
}

stateAlert = function()
{
stateTXT = "alert"
switch (sprite_index)
	{
	case sprMafiaWalkAK47R: sprite_index = sprMafiaWalkAK47; break;
	case sprMafiaWalkM16R:
	case sprMafiaIdleM16: sprite_index = sprMafiaWalkM16; break;
	case sprMafiaWalkShotgunR: sprite_index = sprMafiaWalkShotgun; break;
	case sprMafiaIdlePhoneSilencer:
	case sprMafiaWalkSilencerR: sprite_index = sprMafiaWalkSilencer; break;
	default: break;
	}
lookDir = point_direction(x, y, objPlayer.x, objPlayer.y)
direction = lerp(direction, lookDir, 0.1);
aggroTimer++; //just use a time source or alarm
if aggroTimer >= 1 {stateAttacking();}
}

stateAttacking = function()
{
	if attacking = false
	{
		if ((currentAmmo > 0) and (shootTimer <= 0))
		{
			EShoot();
		}
	}
}

stateDead = function()
{
	stateTXT = "dead"
	instance_destroy();
}

//more states, etc.

//drop init
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

currentAmmo = ammoEnemy;
attacking = false;
shootTimer = 0;

direction = image_angle;
lookDir = 0;
aggroTimer = 0;
hp = 1;
stateTXT = "null"
stateIdle();
weaponValues();
shellToggle = false;
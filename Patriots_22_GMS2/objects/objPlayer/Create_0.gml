image_speed = 0;
if !instance_exists(objCamera)
{
	instance_create_layer(x, y, layer, objCamera);
}
instance_create_layer(x, y, layer, objCursor);
instance_create_layer(x, y, layer, objPlayerViewCenter);

motion={                                // motion vector2
    x:0,
    y:0
}
axis={                                    // input vector2
    x:0,
    y:0
}
axis_interp={                            // interpolated axis between the input
    x:0,
    y:0    
}
spd_interp=0                            // speed interpolated 
spd=3.25                                // max speed
move_axis=0                                //movement direction in angles
col_radius = 12

//initialize variables
walkSpeed = 1;
accel = 0.4;
hspd = 0;
vspd = 0;
legAngle = 0;
playerLegs = sprPlayerLegs;
legIndex = 0;
attacking = 0;
shootAnimSpeed = 0;
hp = 2;

//weapon variables
weapon = noone;
ammoPlayer = 0;
shootTimer = 0;

statePDead = function()
{
	canMove = false;
	canShoot = false;
	canLook =  false;
	instance_destroy();
	objCursor.visible = false;
	var corpse = instance_create_layer(x, y, "FurnitureFloor", objPlayerDeadMachineGun);
	corpse.image_angle = lookDir;
	corpse.direction = lookDir;
}

//player character values
switch (playerCharacter)
	{
	case "Samuel":
		sprite_index = sprSamWalkUnarmed;
		playerLegs = sprSamLegs
        playerStr = 1.0
		walkSpeed = 3
		hp = 2;
		
		sprPlayerWalkUnarmed = sprSamWalkUnarmed;
		sprPlayerWalkAK47 = sprSamWalkAK47;
		sprPlayerWalkM16 = sprSamWalkM16;
		sprPlayerWalkShotgun = sprSamWalkShotgun;
		sprPlayerWalkSilencer = sprSamWalkSilencer;
		sprPlayerWalkMP5 = sprSamWalkMP5;
		sprPlayerWalkDoubleBarrel = sprSamWalkDoubleBarrel;
		sprPlayerWalkMagnum = sprSamWalkMagnum;
		
		break;
	case "Adrian":
		sprite_index = sprAdrianWalkUnarmed;
		playerLegs = sprAdrianLegs
        playerStr = 1.0
		walkSpeed = 3
		hp = 60;
		
		//unique weapon origin values
		switch  ("Silencer")
			{
			case "Silencer":
				shellSource = 14;
				barrelLength = 28;
				break;
			default: break;
			}
		
		sprPlayerWalkUnarmed = sprAdrianWalkUnarmed;
		sprPlayerWalkSilencer = sprAdrianWalkSilencer;
		sprPlayerWalkShotgun = sprAdrianWalkShotgun;
		sprPlayerWalkM16 = sprAdrianWalkM16;
		sprPlayerWalkAK47 = sprAdrianWalkAK47;
		sprPlayerWalkMagnum = sprAdrianWalkMagnum;
		
		break;
	case "Valerie":
		sprite_index = sprValWalkUnarmed;
		playerLegs = sprValLegs
        playerStr = 0.8
		walkSpeed = 3.5
		hp = 2;
		
		//unique weapon origin values
		
		sprPlayerWalkUnarmed = sprValWalkUnarmed;
		sprPlayerWalkAK47 = sprValWalkAK47;
		sprPlayerWalkM16 = sprValWalkM16;
		sprPlayerWalkShotgun = sprValWalkShotgun;
		sprPlayerWalkSilencer = sprValWalkSilencer;
		//sprPlayerWalkMP5 = sprValWalkMP5;
		//sprPlayerWalkDoubleBarrel = sprValWalkDoubleBarrel;
		//sprPlayerWalkMagnum = sprValWalkMagnum;
		
		break;
	//additional characters
	default: break;
	}
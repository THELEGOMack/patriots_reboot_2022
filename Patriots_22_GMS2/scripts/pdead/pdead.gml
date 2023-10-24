function PDead(){
	canMove = false;
	canShoot = false;
	canLook =  false;
	visible = false;
	objEffector.image_alpha = 0;
	
	if global.playerDead = false
	{
		global.playerDead = true;
		var corpse = instance_create_layer(x, y, "body_layer", objPlayerDead);
		var drop = instance_create_layer(x, y, "body_layer", objWeapon);
		corpse.image_angle = direction;
		corpse.direction = direction;
		if bulletCount >= 3 {
			corpse.sprite_index = sprDeadShotgun;
			corpse.speed = random_range(1, 3);
			corpse.image_index = random(floor(2));
			scrBleed(0, 3, random(359));
		} else {
			corpse.sprite_index = sprDeadMachinegun;
			corpse.image_index = random(floor(2));
			corpse.speed = random_range(1, 3) * bulletCount/4;
			scrBleed(0, 2, random(359));
		}
		if (weapon != "unarmed")
		{
			drop.sprite_index = pWeaponDrop;
			drop.image_angle = random(360);
			drop.depth = corpse.depth - 1;
		} else drop.visible = false;
		if (mask != noone)
		{
			instance_create_layer(x, y, layer, objMaskDrop);
		}
	}
	
	if keyboard_check_pressed(ord("R"))
	{
		with objEffector {fadeAlpha = 1}
		scrPressRToRestart();
	}
}
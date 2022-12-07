function PDead(){
	canMove = false;
	canShoot = false;
	canLook =  false;
	visible = false;
	objEffector.visible = false;
	//scrPressRToRestart();
	if global.playerDead = false
	{
		var corpse = instance_create_layer(x, y, "body_layer", objPlayerDeadMachineGun);
		var drop = instance_create_layer(x, y, "body_layer", objWeapon);
		corpse.image_angle = direction;
		corpse.direction = direction;
		if (weapon != noone)
		{
			drop.sprite_index = pWeaponDrop;
			drop.image_angle = random(360);
			drop.depth = corpse.depth - 1;
		} else drop.visible = false;
		global.playerDead = true;
	}
	else {exit}
}
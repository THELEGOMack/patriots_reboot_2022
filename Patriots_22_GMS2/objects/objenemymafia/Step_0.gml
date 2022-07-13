if hp <= 0
{
	stateDead();
	instance_destroy();
	var corpse = instance_create_layer(x, y, "FurnitureFloor", objMafiaDeadMachineGun);
	corpse.image_angle = lookDir;
	corpse.direction = lookDir;
}

shootTimer--;
if shootTimer < -200
{
	shootTimer = -1
}

shellDir = direction;
lookDir = image_angle;
stateIdle();
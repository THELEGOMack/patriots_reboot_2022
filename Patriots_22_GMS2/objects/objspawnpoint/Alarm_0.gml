///@desc enable control/spawn player
if (!instance_exists(objPlayer)) and (spawnToggle = 1)
{
	var pSpawn = instance_create_layer(x, y, "characters", playerCharacter);
	pSpawn.direction = direction;
	pSpawn.image_angle = image_angle;
	pSpawn.image_index = 0;
	pSpawn.canLook = canLook;
	pSpawn.canMove = canMove;
	pSpawn.canShoot = canShoot;
	pSpawn.mask = headwear;
}
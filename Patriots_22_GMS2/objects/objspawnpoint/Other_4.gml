if (!instance_exists(objPlayer)) and (spawnToggle = 1)
{
	var pSpawn = instance_create_layer(x, y, "characters", playerCharacter);
	pSpawn.direction = direction;
	pSpawn.canLook = canLook;
	pSpawn.canMove = canMove;
	pSpawn.canShoot = canShoot;
	pSpawn.mask = headwear;
}
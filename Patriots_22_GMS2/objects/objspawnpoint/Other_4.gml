if (!instance_exists(objPlayer))
{
	//global.floorClear = 0;
	var pSpawn = instance_create_layer(x, y, "characters", objPlayer);
	pSpawn.direction = direction; //broken? always faces right
	pSpawn.playerCharacter = global.playerCharacter;
	pSpawn.canLook = canLook;
	pSpawn.canMove = canMove;
	pSpawn.canShoot = canShoot;
}

objCamera.smooth = 1;
alarm[0] = 5;
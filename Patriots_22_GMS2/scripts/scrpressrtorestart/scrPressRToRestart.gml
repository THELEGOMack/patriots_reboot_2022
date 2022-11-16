function scrPressRToRestart(){
if (keyboard_check_released(ord("R")))
{
	if instance_exists(objCamera)
	{
		instance_destroy();
	}
	with objEnemyMafia
	{
		path_delete(path);
	}
	room_restart();
	var respawn = instance_create_layer(objSpawnPoint.x, objSpawnPoint.y, "characters", objPlayer);
	respawn.direction = objSpawnPoint.respawnDir;
	//respawn.playerCharacter = global.playerCharacter;
}
}
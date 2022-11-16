function EPursuit(){
stateTXT = "pursuit"
//go to player position
	//update grid path
	path_delete(path);
	path = path_add();
	//where to go
	pathTargetX = objPlayer.x;
	pathTargetY = objPlayer.y;
	//ride the grid
	mp_grid_path(objPathSetup.grid, path, x, y, pathTargetX, pathTargetY, 1);
	//ride the path
	path_start(path, 2, path_action_stop, true);
	
	//transition trigger(s)
	if seePlayer = true
	{
		state = 4;
	}
	else if seePlayer = false
	{
		state = 9;
	}
}
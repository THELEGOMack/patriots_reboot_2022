function scrEPathUpdate(){
	if path_exists(path) {path_delete(path)}
	path = path_add();
	pLastX = objPlayer.x;
	pLastY = objPlayer.y;
	mp_grid_path(objSetupPathway.grid, path, x, y, pLastX, pLastY, true);
	exit
}
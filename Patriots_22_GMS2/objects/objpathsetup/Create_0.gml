//create the grid
grid = mp_grid_create(0, 0, room_width/16, room_height/16, 16, 16);
//add obstacles
mp_grid_add_instances(grid, objPlayerClip, 0);

//for "debug" drawing only
//depth = -3000
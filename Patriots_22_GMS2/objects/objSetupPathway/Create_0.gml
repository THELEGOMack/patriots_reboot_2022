gridRes = 16;
grid = mp_grid_create(-(room_width/4),-(room_height/4),(room_width*1.5)/gridRes,(room_height*1.5)/gridRes, gridRes, gridRes);
mp_grid_add_instances(grid, objPlayerClip, 0);
view_width = objAppSurf.window_width/4;
view_height = objAppSurf.window_height/4;

window_scale = 8; //this value determines how "smooth" the visuals are

window_set_size(view_width*window_scale, view_height*window_scale);
window_center();

//surface_resize(application_surface, view_width*window_scale, view_height*window_scale);

follow = noone;
smooth = 1;
alarm[0] = 5;

//"default" camera values (no player to follow)
camXDef = 0;
camYDef = 0;

//max x and y boundaries
camXMax = room_width - camera_get_view_width(view_camera[0]);
camXMin = 0;
camYMax = room_height - camera_get_view_height(view_camera[0]);
camYMin = 0;
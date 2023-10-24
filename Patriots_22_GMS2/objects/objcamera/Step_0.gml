camera_set_view_size(view_camera[0], view_width, view_height);

//super primative moving debug
//if keyboard_check(vk_up) {camYDef -= 1;}
//if keyboard_check(vk_down) {camYDef += 1;}
//if keyboard_check(vk_left) {camXDef -= 1;}
//if keyboard_check(vk_right) {camXDef += 1;}

//any zooming function goes here

if global.voidActive = false {
	camXMax = room_width - camera_get_view_width(view_camera[0]);
	camXMin = 0;
	camYMax = room_height - camera_get_view_height(view_camera[0]);
	camYMin = 0;
}
else {
	camXMax = room_width + camera_get_view_width(view_camera[0]);
	camXMin = -room_width;
	camYMax = room_height + camera_get_view_height(view_camera[0]);
	camYMin = -room_height;
}

if (follow != noone)
{
	x = follow.x;
	y = follow.y;
	var cameraX = clamp(follow.x - camera_get_view_width(view_camera[0])/2, camXMin, camXMax);
	var cameraY = clamp(follow.y - camera_get_view_height(view_camera[0])/2, camYMin, camYMax);
	camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), cameraX, smooth), lerp(camera_get_view_y(view_camera[0]), cameraY, smooth));
} else {
	x = camXDef;
	y = camYDef;
	var cameraXDef = clamp(camXDef - camera_get_view_width(view_camera[0])/2, camXMin, camXMax);
	var cameraYDef = clamp(camYDef - camera_get_view_height(view_camera[0])/2, camYMin, camYMax);
	camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), cameraXDef, smooth), lerp(camera_get_view_y(view_camera[0]), cameraYDef, smooth));
}
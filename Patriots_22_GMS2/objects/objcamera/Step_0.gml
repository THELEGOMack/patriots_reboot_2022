//#macro view view_camera[0]
camera_set_view_size(view_camera[0], view_width, view_height);

x = follow.x;
y = follow.y;

//any zooming function goes here

if (follow != noone)
{
	if instance_exists(objPlayer)
	{
		//var smooth = 0.1;
		var cameraX = clamp(follow.x - camera_get_view_width(view_camera[0])/2, 0, room_width - camera_get_view_width(view_camera[0]));
		var cameraY = clamp(follow.y - camera_get_view_height(view_camera[0])/2, 0, room_height - camera_get_view_height(view_camera[0]));
		camera_set_view_pos(view_camera[0], lerp(camera_get_view_x(view_camera[0]), cameraX, smooth), lerp(camera_get_view_y(view_camera[0]), cameraY, smooth));
	}
}
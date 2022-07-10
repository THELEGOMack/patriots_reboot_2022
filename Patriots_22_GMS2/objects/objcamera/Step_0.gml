#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height);

x = follow.x;
y = follow.y;

//any zooming function goes here

if (follow != noone)
{
	if instance_exists(objPlayer)
	{
		//var smooth = 0.1;
		var cameraX = clamp(follow.x - camera_get_view_width(view)/2, 0, room_width - camera_get_view_width(view));
		var cameraY = clamp(follow.y - camera_get_view_height(view)/2, 0, room_height - camera_get_view_height(view));
		camera_set_view_pos(view, lerp(camera_get_view_x(view), cameraX, smooth), lerp(camera_get_view_y(view), cameraY, smooth));
	}
}
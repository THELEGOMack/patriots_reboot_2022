// Here we update the "player" with the torch. DEMO only and can be removed.

var ang = point_direction(x, y, mouse_x, mouse_y);
var dif = angle_difference(ang, image_angle);
image_angle += median(-5, dif, 5);

// Note! Changing the image_angle of the instance changes how the light is drawn too!
// You can also set the image xscale or yscale to get different effects, but to make 
// it visible the light needs to be updated afterwards or not be static. The scaled 
// sprite cannot be larger than the radius used to initialise it.

var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
camera_set_view_pos(view_camera[0], floor(clamp(x - (_vw / 2), 0, room_width - _vw)), floor(clamp(y - (_vh / 2), 0, room_width - _vh)));
/// @description Input Controls

// Check mouse click/release or mouse click/hold for moving the view
// or the player torch, or for creating new lights.

if mouse_check_button_pressed(mb_left)
{
click_time = 0;
}

if os_type == os_android
{
if device_mouse_check_button(0, mb_left)
	{
	++click_time;
	if click_time > 30
		{
		var _xx = device_mouse_x(0);
		var _yy = device_mouse_y(0);
	    with (obj_Aura_Torch_Light)
	        {
		    var pd = point_direction(x, y, _xx, _yy);
		    repeat(4)
		        {
		        if !collision_circle(x + lengthdir_x(1, pd), y + lengthdir_y(1, pd), 4, obj_Aura_ShadowCaster_Parent, true, true)
		            {
					var _tmap = layer_tilemap_get_id("Shadow_Tiles");
					if tilemap_get_at_pixel(_tmap, x + lengthdir_x(4, pd), y + lengthdir_y(4, pd)) == 0
						{
			            x += lengthdir_x(1, pd);
				        y += lengthdir_y(1, pd);
						}
		            }
	            }
			}
        }
	}
}
else if mouse_check_button(mb_left)
{
++click_time;
switch(room)
    {
    case rm_Aura_Demo:
        with (obj_Aura_Torch_Light)
            {
	        var pd = point_direction(x, y, mouse_x, mouse_y);
	        repeat(4)
	            {
	            if !collision_circle(x + lengthdir_x(1, pd), y + lengthdir_y(1, pd), 4, obj_Aura_ShadowCaster_Parent, true, true)
	                {
					var _tmap = layer_tilemap_get_id("Shadow_Tiles");
					if tilemap_get_at_pixel(_tmap, x + lengthdir_x(4, pd), y + lengthdir_y(4, pd)) == 0
						{
		                x += lengthdir_x(1, pd);
			            y += lengthdir_y(1, pd);
						}
	                }
                }
            }
        break;
    default:
        if click_time > 14
            {
            motion_set(point_direction(x, y, mouse_x, mouse_y),  point_distance(x, y, mouse_x, mouse_y) / 10);
			var _vw = camera_get_view_width(view_camera[0]);
			var _vh = camera_get_view_height(view_camera[0]);
			camera_set_view_pos(view_camera[0], floor(clamp(x - (_vw / 2), 0, room_width - _vw)), floor(clamp(y - (_vh / 2), 0, room_width - _vh)));
            }
    }
}

if mouse_check_button_released(mb_left)
{
speed = 0;
if click_time < 15
    {
    switch (room)
        {
        case rm_Aura_Dynamic:
			with (instance_create_layer(mouse_x, mouse_y, "Lights", obj_Aura_Point_Light))
				{
				aura_light_set_radius(id, 64 + irandom(128), true);
				}
			break;
        case rm_Aura_Static: with(instance_create_layer(mouse_x, mouse_y, "Lights", obj_Aura_Point_Light)) aura_light_static = true; break;
        }
    }
}

// Create FAST lights
if mouse_check_button_pressed(mb_right)
{
// Switch off cursor light temporarily
if room != rm_Aura_Demo aura_light_set_enabled(obj_Aura_Mouse_Light, false);
}

if mouse_check_button(mb_right)
{
instance_create_layer(mouse_x, mouse_y, "Lights", obj_Aura_Fast_Light);
}

if mouse_check_button_released(mb_right)
{
// Switch cursor light on again
if room != rm_Aura_Demo aura_light_set_enabled(obj_Aura_Mouse_Light, true);
}

// Check for soft shadows modifier
if keyboard_check_pressed(vk_f1)
{
var _s = aura_get_soft();
_s += 0.5;
if _s > 4 _s = 0;
aura_set_soft(_s);
}

// Check for anti-aliasing modifier
if keyboard_check_pressed(vk_f2)
{
var _aa = aura_get_aa();
switch(_aa)
	{
	case 0: _aa = 2; break;
	case 2: _aa = 4; break;
	case 4: _aa = 8; break;
	case 8: _aa = 0; break;
	}
aura_set_aa(_aa);
}

// Check the Alpha modifier
if keyboard_check_pressed(vk_f3)
{
var _a = aura_get_alpha();
_a += 0.1;
if _a > 1 _a = 0;
aura_set_alpha(_a);
}

// Check colour modifier
if keyboard_check_pressed(vk_f4)
{
var _c = aura_get_colour();
switch(_c)
	{
	case c_black: _c = c_red; break;
	case c_red: _c = c_blue; break;
	case c_blue: _c = c_green; break;
	case c_green: _c = c_yellow; break;
	case c_yellow: _c = c_orange; break;
	case c_orange: _c = c_aqua; break;
	case c_aqua: _c = c_black; break;
	}
aura_set_colour(_c);
}





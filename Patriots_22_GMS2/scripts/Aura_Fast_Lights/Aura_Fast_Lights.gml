/// The functions in this script are used ofr "fast" lights. Fast lights are just
///	a way of creating simply and processor light effects that DON'T cast shadows.
///	In general you only need to use the "aura_light_create_fast()" function, and
///	the others are internal to the Aura engine.
///
/// The functions created in this script are:
/// 
///		aura_light_create_fast(layer, instance, sprite, index, x, y, xscale, yscale, angle, colour, alpha)
///		aura_light_init_fast(xscale, yscale, angle, colour, alpha)
///		aura_light_draw_fast();
///


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USER FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function					Aura_Light_Create_Fast(layer_id, instance, sprite, index, _x, _y, xscale, yscale, angle, colour, alpha);
/// @param {real}	layer_id	The layer (real or string) to create the light instance on
/// @param {real}	instance	The instance to create (must be a child of "obj_Aura_Light_Parent"
/// @param {real}	sprite		The sprite for the light to use (set to -1 for default instance sprite)
/// @param {real}	index		The image index of the sprite to use (set to -1 to use the index set by the instance)
/// @param {real}	_x			The x position to create the light at
/// @param {real}	_y			The y position to create the light at
/// @param {real}	xscale		The x-axis scale to use
/// @param {real}	yscale		The y-axis scale to use
/// @param {real}	angle		The angle for the sprite
/// @param {real}	colour		The colour to tint the light with
/// @param {real}	alpha		The alpha (0-1) for the light to use

/// @description	This is a convenience function for creating a fast light instance on a layer. It is 
///					designed so that you simply need a parent or generic fast light instance and use this 
///					to set its properies on create. The function will return the ID of the new instance,
///					or "noone" (-4) if it fails to create the instance.

function Aura_Light_Create_Fast(layer_id, instance, sprite, index, _x, _y, xscale, yscale, angle, colour, alpha)
{
if layer_exists(layer_id)
	{
	var _id = instance_create_layer(_x, _y, layer_id, instance);
	with (_id)
		{
		if sprite != -1
			{
			sprite_index = sprite;
			}
		if index != -1
			{
			image_index = index;
			}
		Aura_Light_Init_Fast(xscale, yscale, angle, colour, alpha);
		}
	return _id;
	}
else return noone;
}


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ENGINE FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function				Aura_Light_Init_Fast(xscale, yscale, angle, colour, alpha);
/// @param {real}	xscale	The x-axis scale to use
/// @param {real}	yscale	The y-axis scale to use
/// @param {real}	angle	The angle for the sprite
/// @param {real}	colour	The colour to tint the light with
/// @param {real}	alpha	The alpha (0-1) for the light to use

/// @description			Initialise the instance variables for the fast light

function Aura_Light_Init_Fast(xscale, yscale, angle, colour, alpha)
{
image_xscale = xscale;
image_yscale = yscale;
image_angle = angle;
image_blend = colour;
image_alpha = alpha;
}


/// @function		Aura_Light_Draw_Fast();

/// @description	Draw the fast lights to the main AURA surface.
///					This function should not be called outside of the aura_update function.

function Aura_Light_Draw_Fast()
{
// Draw the light sprite, using the colour and alpha settings
if aura_view > -1
	{
	var _v = aura_view;
	with (obj_Aura_Light_Parent_Fast)
	    {
		var _vx = camera_get_view_x(view_camera[_v]);
		var _vy = camera_get_view_y(view_camera[_v]);
	    draw_sprite_ext(sprite_index, image_index, x - _vx, y - _vy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	    }
	}
else
	{
	with (obj_Aura_Light_Parent_Fast)
	    {
	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	    }
	}
}









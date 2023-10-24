/// The functions in this script are all related to creating, updating and drawing LIGHTS.
/// Each light object will need to be initialised, updated and then drawn to the screen, and
/// there are a number of functions for that. However, all you really need to use are the 
/// "aura_light_create()" function to create lights in a room when the game is running, 
///	and ensure that each light calls "aura_light_init()" in its CREATE event and "aura_light_free()"
/// in its CLEAN UP event. The rest of the functions listed here are more-or-less internal to 
/// the engine and shouldn't need to be called outside of the "aura_update()" or "aura_draw()" 
///	functions. That said, I recommend that you take some time to read all the comments and 
///	descriptions for all the functions to get a better understanding of how the engine works.
///
/// The functions created in this script are:
/// 
///		aura_light_create(layer_id, instance, sprite, index, x, y, radius, colour, alpha, staticlight, vis)
///		aura_light_init(radius, colour, alpha, static, scale)
///		aura_light_reinit(iterations)
///		aura_light_update(vertex_f, vertex_b)
///		aura_light_update_alt(vertex_f, vertex_b)
///		aura_light_draw()
///		aura_light_free()
/// 


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< USER FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function					aura_light_create(layer_id, instance, sprite, index, x, y, radius, colour, alpha, staticlight, vis);
/// @param {real}	layer_id	The layer (real or string) to create the light instance on
/// @param {real}	instance	The instance to create (must be a child of "obj_Aura_Light_Parent"
/// @param {real}	sprite		The sprite for the light to use (set to -1 for default instance sprite)
/// @param {real}	index		The image index of the sprite to use (set to -1 to use the index set by the instance)
/// @param {real}	_x			The x position to create the light at
/// @param {real}	_y			The y position to create the light at
/// @param {real}	radius		The radius of the light being created
/// @param {real}	colour		The colour of the light blending
/// @param {real}	alpha		The alpha of the light (0 - 1)
/// @param {bool}	staticlight	Whether the light is static (set to true) or dynamic (false)
/// @param {bool}	vis			Whether the light is ebnabled and visible (set to true) or not (false)

/// @description	This is a convenience function for creating a light instance on a layer. It is 
///					designed so that you simply need a aparent or generic light instance and use this 
///					to set its properies on create. The function will return the ID of the new instance,
///					or "noone" (-4) if it fails to create the instance.

function aura_light_create(layer_id, instance, sprite, index, _x, _y, radius, colour, alpha, staticlight, vis)
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
		aura_light_init(radius, colour, alpha, staticlight, false);
		aura_light_enabled = vis;    // Is the light enabled (true) or not (false)
		}
	return _id;
	}
else
	{
	aura_log("aura_light_create(): WARNING! Cannot create instance, invalid layer supplied.");
	return noone;
	}
}


/// @function				aura_light_init(radius, colour, alpha, static, scale);
/// @param {real}	radius	The radius of the light being created
/// @param {real}	colour	The colour of the light blending
/// @param {real}	alpha	The alpha of the light
/// @param {bool}	static	Whether the light is static (set to true) or dynamic (false)
/// @param {bool}	scale	OPTIONAL! Whether to scale the light sprite or not

/// @description	Initialising the light creates a unique surface for it, and also a 
///					number of variables for the instance which can then be modified at 
///					any time to change things. Note that if the light is STATIC you can 
///					still modify the light colour and alpha with - NO PERFORMANCE LOSS - a
///					good way to get some simple effects like alarm lights without the hit 
///					to performance associated with dynamic lights.
///					A static light will generate a shadow mesh once when created, but
///					Not update again afterwards, meaning that the shadows it generates 
///					will not change if it is moved. You CAN force a static light to update
///					for one step by setting "aura_light_renew" to "true". The shadows cast
///					will update and then light will become static again the next. In the 
///					Demo room this is used in the "door" objects to only update their
///					shadows when the door moves.
///					
///					Notes:
///					    1) Use the "enabled" variable to switch a light on and off
///					    2) If a light is flagged as static, you can force it to update by setting 
///					       the "update" variable to true. The update is for one frame only.
///					    3) If you change a static light to dynamic, you will also need to set the 
///					       the update variable to true otherwise it won't change.
///					    4) A dynamic light can be made static at any time by simply setting the 
///					       "static" variable to true. It takes one frame to become static.
///
///					Note that if your sprite is larger or smaller than the radius of the light 
///					being created, you can set the optional scale argument to true and the 
///					sprite will be scaled to fit the radius (this ONLY WORKS WITH SPRITES THAT 
///					HAVE THE ORIGIN CENTERED!)

function aura_light_init(radius, colour, alpha, staticlight, scale)
{
// Set the light variables
aura_light_radius = radius;			// Light radius
aura_light_colour = colour;			// Light colour
aura_light_alpha = alpha;			// Light alpha
aura_light_static = staticlight;    // Set the light to static (true) or dynamic (false)
aura_light_renew = true;           // Should the light update (true) or not(false)
aura_light_enabled = true;          // Is the light enabled (true) or not (false)

// Compensate for greater/smaller radius of the light than the sprite
if argument_count > 4
	{
	if scale == true
		{
		image_xscale = (aura_light_radius * 2) / sprite_get_width(sprite_index);
		image_yscale = (aura_light_radius * 2) / sprite_get_height(sprite_index);
		}
	}

/// The light is drawn to a surface along with the shadow meshes, so create the surface
aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);
if surface_exists(aura_light_surface)
	{
	surface_set_target(aura_light_surface);
	draw_clear_alpha(c_black, 1);
	surface_reset_target();
	}
}


/// @function		aura_light_free();

/// @description	This function should be called if you destroy the light instance before the room ends, 
///					otherwise it is called automatically when you call aura_cleanup() function on room end.

function aura_light_free()
{
if surface_exists(aura_light_surface)
	{
	surface_free(aura_light_surface);
	}
}


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< ENGINE FUNCTIONS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function					aura_light_reinit(iterations);
/// @param {real}	iterations	The number of iterations to attempt before failing the light

/// @description				Recreate an existing light source when the surface has been lost

function aura_light_reinit(iterations)
{
aura_log("aura_light_reinit(): Light surface re-initialised");

// Create a count variable for the checking iterations
var count = 0;
while (!surface_exists(aura_light_surface) && count < iterations)
	{
	aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);
	count++;
	}
// If the light surface can't be initialised, switch it off.
if count >= iterations
	{
	aura_log("aura_light_reinit(): WARNING! Light Surface Error - Light has been disabled");
	aura_light_renew = false;
	aura_light_enabled = false;
	return false
	}
else
	{
	// Set the light to update since it has been re-created
	aura_light_renew = true;
	return true;
	}
}


/// @function					aura_light_update(vertex_f, vertex_b);
/// @param {ptr}	vertex_f	The vertex format to use
/// @param {ptr}	vertex_b	The vertex buffer to use

/// @description	This function should only be called from the main aura_update() function, and 
///					you shouldn't ever need to call this from within a game project.
///					Here all the main drawing for each light is done. It also uses two extra 
///					"helper" scripts to check for collisions and to check the light is in the view.

function aura_light_update(vertex_f, vertex_b)
{
// Set up the variables
var a_tx, a_ty, i, a_dir, a_inst, a_rad, a_px, a_py, a_ox, a_oy;
var _v = aura_view;
var _t = aura_tiles;

// Update the lights
with (obj_Aura_Light_Parent)
	{
	if aura_light_enabled
	    {
	    // Check the light surface exists
	    if !surface_exists(aura_light_surface)
	        {
	        aura_light_reinit(25);
	        }
	    else
	        {
	        // Check if it is to be updated and is in the view
	        if aura_light_renew && aura_in_view(_v)
	            {
	            // Set surface
	            surface_set_target(aura_light_surface);
	            draw_clear_alpha(c_black, 1);
			
	            // Draw the light sprite
	            draw_sprite_ext(sprite_index, image_index, aura_light_radius, aura_light_radius, image_xscale, image_yscale, image_angle, c_white, 1);
            
	            //making a temp object variable for the with loop.
	            a_inst = id;
	            a_rad = aura_light_radius;
	            a_ox = x;
	            a_oy = y;
            
	            //loop through all shadow casters, adding to the vertex buffer for each
	            vertex_begin(vertex_b, vertex_f); 
	            with(obj_Aura_ShadowCaster_Parent)
	                {
	                if aura_in_light(a_inst)
	                    {
	                    // Loop through the shadow caster vertices and add them to the vertex buffer
	                    for(i = 0; i < aura_shadow_points; i++;)
	                        {
	                        a_tx[i] = x + aura_shadow_x[i] - a_ox + a_rad;
	                        a_ty[i] = y + aura_shadow_y[i] - a_oy + a_rad;
	                        a_dir = point_direction(a_tx[i], a_ty[i], a_rad, a_rad) + 180;
	                        a_px[i] = a_tx[i] + lengthdir_x(aura_shadow_length, a_dir);
	                        a_py[i] = a_ty[i] + lengthdir_y(aura_shadow_length, a_dir);
	                        }
	                    for(i = 0; i < aura_shadow_points; i++;)
	                        {
	                        if i != aura_shadow_points - 1
	                            {
	                            vertex_position(vertex_b, a_tx[i], a_ty[i]);
	                            vertex_colour(vertex_b, c_black, 1); 
	                            vertex_position(vertex_b, a_px[i], a_py[i]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            vertex_position(vertex_b, a_tx[i + 1], a_ty[i + 1]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            vertex_position(vertex_b, a_px[i], a_py[i]);
	                            vertex_colour(vertex_b, c_black, 1); 
	                            vertex_position(vertex_b, a_px[i + 1], a_py[i + 1]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            vertex_position(vertex_b, a_tx[i + 1], a_ty[i + 1]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            }
	                        else
	                            {
	                            vertex_position(vertex_b, a_tx[i], a_ty[i]);
	                            vertex_colour(vertex_b, c_black, 1); 
	                            vertex_position(vertex_b, a_px[i], a_py[i]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            vertex_position(vertex_b, a_tx[0], a_ty[0]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            vertex_position(vertex_b, a_px[i], a_py[i]);
	                            vertex_colour(vertex_b, c_black, 1); 
	                            vertex_position(vertex_b, a_px[0], a_py[0]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            vertex_position(vertex_b, a_tx[0], a_ty[0]);
	                            vertex_colour(vertex_b, c_black, 1);
	                            }
	                        }
	                    }
	                }
				if _t
					{
					a_len = obj_Aura_Control.aura_tile_length;
					for (var _a = 0; _a < ds_list_size(obj_Aura_Control.aura_tile_list); _a++;)
						{
						var _map = obj_Aura_Control.aura_tile_list[| _a];
			            a_tx[0] = _map[? "x1"] - a_ox + a_rad;
			            a_ty[0] = _map[? "y1"] - a_oy + a_rad;
			            a_tx[1] = _map[? "x2"] - a_ox + a_rad;
			            a_ty[1] = _map[? "y2"] - a_oy + a_rad;						
			            a_tx[2] = _map[? "x3"] - a_ox + a_rad;
			            a_ty[2] = _map[? "y3"] - a_oy + a_rad;						
			            a_tx[3] = _map[? "x4"] - a_ox + a_rad;
			            a_ty[3] = _map[? "y4"] - a_oy + a_rad;
						for (i = 0; i < 4; i++;)
							{
			                a_dir = point_direction(a_tx[i], a_ty[i], a_rad, a_rad) + 180;
			                a_px[i] = a_tx[i] + lengthdir_x(a_len, a_dir);
			                a_py[i] = a_ty[i] + lengthdir_y(a_len, a_dir);
							}
			            for(i = 0; i < 4; i++;)
			                {
			                if i != 3
			                    {
			                    vertex_position(vertex_b, a_tx[i], a_ty[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[i + 1], a_ty[i + 1]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[i + 1], a_py[i + 1]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[i + 1], a_ty[i + 1]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    }
			                else
			                    {
			                    vertex_position(vertex_b, a_tx[i], a_ty[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[0], a_ty[0]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[0], a_py[0]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[0], a_ty[0]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    }
							}
	                    }
					}
	            vertex_end(vertex_b);
	            vertex_submit(vertex_b, pr_trianglelist, -1);
	            surface_reset_target();
	            // Check to see if static
	            if aura_light_static
	                {
	                aura_light_renew = false;
	                }
	            }
	        }
	    }
	}
}


/// @function					aura_light_update_alt(vertex_f, vertex_b);
/// @description				An alternative update function for an individual light
/// @param {ptr}	vertex_f	The vertex format to use
/// @param {ptr}	vertex_b	The vertex buffer to use

/// @description	This function is an ALTERNATIVE version of the update function. The other version greatly 
///					reduces vertex batches and so should be faster and better especially on mobile. However,
///					if you have any issues with it, simply edit the "aura_update" function to use this function
///					instead of "aura_light_update" and see if that fixes the probem.

function aura_light_update_alt(vertex_f, vertex_b)
{
// Set up the variables
var a_tx, a_ty, i, a_dir, a_inst, a_rad, a_ox, a_oy;
var _v = aura_view;
var _t = aura_tiles;

// Update the lights
with (obj_Aura_Light_Parent)
	{
	if aura_light_enabled
	    {
	    // Check the light surface exists
	    if !surface_exists(aura_light_surface)
	        {
	        aura_light_reinit(25);
	        }
	    else
	        {
	        // Check if it is to be updated and is in the view
	        if aura_light_renew && aura_in_view(_v)
	            {
	            // Set surface
	            surface_set_target(aura_light_surface);
				draw_clear_alpha(c_black, 1);
            
	            // Draw the light sprite
	            draw_sprite_ext(sprite_index, image_index, aura_light_radius, aura_light_radius, image_xscale, image_yscale, image_angle, c_white, 1);
            
	            //making a temp object variable for the with loop.
	            a_inst = id;
	            a_rad = aura_light_radius;
	            a_ox = x;
	            a_oy = y;
            
	            //loop through all shadow casters, creating a vertex buffer for each
	            with(obj_Aura_ShadowCaster_Parent)
	                {
	                if aura_in_light(a_inst)
	                    {
	                    // Loop through the shadow caster vertices and add them to the vertex buffer
	                    vertex_begin(vertex_b, vertex_f);            
	                    for(i = 0; i < aura_shadow_points; i++;)
	                        {
	                        a_tx = x + aura_shadow_x[i] - a_ox + a_rad;
	                        a_ty = y + aura_shadow_y[i] - a_oy + a_rad;                
	                        a_dir = point_direction(a_tx, a_ty, a_rad, a_rad) + 180;               
	                        vertex_position(vertex_b, a_tx,a_ty);
	                        vertex_colour(vertex_b, c_black, 1);                
	                        vertex_position(vertex_b, a_tx + lengthdir_x(a_rad * 8, a_dir), a_ty + lengthdir_y(a_rad * 8, a_dir));
	                        vertex_colour(vertex_b, c_black, 1);
	                        }
	                    a_tx = x + aura_shadow_x[0] - a_ox + a_rad;
	                    a_ty = y + aura_shadow_y[0] - a_oy + a_rad;
	                    a_dir = point_direction(a_tx, a_ty, a_rad, a_rad) + 180;
	                    vertex_position(vertex_b, a_tx,a_ty);
	                    vertex_colour(vertex_b, c_black, 1);
	                    vertex_position(vertex_b, a_tx + lengthdir_x(a_rad * 8, a_dir), a_ty + lengthdir_y(a_rad * 8, a_dir));
	                    vertex_colour(vertex_b, c_black, 1);
	                    vertex_end(vertex_b);
	                    // Submit the vertex buffer for drawing
	                    vertex_submit(vertex_b, pr_trianglestrip, -1);
	                    }
	                }
				if _t
					{
					for (var _a = 0; _a < ds_list_size(obj_Aura_Control.aura_tile_list); _a++;)
						{
						vertex_begin(vertex_b, vertex_f);
						var _map = obj_Aura_Control.aura_tile_list[| _a];
			            a_tx[0] = _map[? "x1"] - a_ox + a_rad;
			            a_ty[0] = _map[? "y1"] - a_oy + a_rad;
			            a_tx[1] = _map[? "x2"] - a_ox + a_rad;
			            a_ty[1] = _map[? "y2"] - a_oy + a_rad;						
			            a_tx[2] = _map[? "x3"] - a_ox + a_rad;
			            a_ty[2] = _map[? "y3"] - a_oy + a_rad;						
			            a_tx[3] = _map[? "x4"] - a_ox + a_rad;
			            a_ty[3] = _map[? "y4"] - a_oy + a_rad;
						for (i = 0; i < 4; i++;)
							{
			                a_dir = point_direction(a_tx[i], a_ty[i], a_rad, a_rad) + 180;
			                a_px[i] = a_tx[i] + lengthdir_x(a_rad * 1000, a_dir);
			                a_py[i] = a_ty[i] + lengthdir_y(a_rad * 1000, a_dir);
							}
			            for(i = 0; i < 4; i++;)
			                {
			                if i != 3
			                    {
			                    vertex_position(vertex_b, a_tx[i], a_ty[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[i + 1], a_ty[i + 1]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[i + 1], a_py[i + 1]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[i + 1], a_ty[i + 1]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    }
			                else
			                    {
			                    vertex_position(vertex_b, a_tx[i], a_ty[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[0], a_ty[0]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_px[i], a_py[i]);
			                    vertex_colour(vertex_b, c_black, 1); 
			                    vertex_position(vertex_b, a_px[0], a_py[0]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    vertex_position(vertex_b, a_tx[0], a_ty[0]);
			                    vertex_colour(vertex_b, c_black, 1);
			                    }
							}
						vertex_end(vertex_b);
	                    // Submit the vertex buffer for drawing
	                    vertex_submit(vertex_b, pr_trianglestrip, -1);
	                    }
					}
	            surface_reset_target();
	            // Check to see if static
	            if aura_light_static
	                {
	                aura_light_renew = false;
	                }
	            }
	        }
	    }
	}
}


/// @function		aura_light_draw();

/// @description	Draw the light to the main AURA surface.
///					This function should not be called outside of the aura_update function.

function aura_light_draw()
{
// Draw the individual light surface, using the colour and alpha settings
if aura_view > -1
	{
	var _v = aura_view;
	with (obj_Aura_Light_Parent)
	    {
		if aura_light_enabled
			{
			var _vx = camera_get_view_x(view_camera[_v]);
			var _vy = camera_get_view_y(view_camera[_v]);
			draw_surface_ext(aura_light_surface, x - aura_light_radius - _vx, y - aura_light_radius - _vy, 1, 1, 0, aura_light_colour, aura_light_alpha);
			}
		}
	}
else
	{
	with (obj_Aura_Light_Parent)
	    {
		if aura_light_enabled
			{
			draw_surface_ext(aura_light_surface, x - aura_light_radius, y - aura_light_radius,  1, 1, 0, aura_light_colour, aura_light_alpha);
			}
		}
	}
}

















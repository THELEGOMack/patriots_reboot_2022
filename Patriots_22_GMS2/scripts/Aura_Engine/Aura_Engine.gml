/// This set of functions forms the CORE of the AUra lighting system. Most of 
/// the functions here are for the main Aura light contoller object and will 
/// go in distinct events. Please see the object "obj_Aura_Control" for a 
/// simple setup using these functions. Note that the accompany script
/// "Aura_Engine_GetSet" has a great number of functions designed
/// to change any of the settings for the lighting system without having to 
/// know the internal variables that the engine creates and uses.
///
/// The functions defined in this script are:
///
///		aura_init(ambient_alpha, ambient_colour, aa_enable, view, tilelayer, soft, blendtype)
///		aura_reinit(iterations)
///		aura_update()
///		aura_draw()
///		aura_cleanup()
///
///	We also define a couple of macro values which are used for setting the blendmodes.

#macro	aura_blend_multiply	0
#macro	aura_blend_additive	1

/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< AURA LIGHT ENGINE >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

/// @function								aura_init(ambient_alpha, ambient_colour, aa_enable, view, tilemap, blendtype)
/// @param {real}			ambient_alpha	The base alpha value (0 - 1) for the penumbra that the light will illuminate
/// @param {real}			ambient_colour	The colour for the penumbra ambience
/// @param {bool}			aa_enable		Whether the shadows should be smooth or not
/// @param {real}			view			The view to use, or -1 for no views
/// @param {real/string}	tilelayer		*OPTIONAL* The tile layer to use for shadow casting (layer ID or -1)
/// @param {real}			soft			*OPTIONAL* Set "soft" shadow level (use 0 for none, or an integer value to enable - the higher the value the greater the softness)
/// @param {real}			blendtype		*OPTIONAL* Set the lighting blend type, using the macros

/// @description	This function is used to initialise the entire Aura light system and should be 
///					called in the CREATE event of the controller object. If you are using tiles for
///					for shadow casting, supply the tile LAYER ID (value or string) and Aura will get
///					the element ID for the tilemap element. Also, even though you are specifying a tile 
///					layer for shadows, this layer will still need to be initialised using the function 
///					"aura_shadow_caster_tile_init()". See the CREATE event of the DEMO controller object 
///					to see how and the function description for more information.
///
///					You can also set a value between 0 and 8 for "soft" shadows. This is done using 
///					a shader. If you require pixelated shadows, this should be set to 0, and the
///					"aa_enable" argument should be set to false.
///
///					The "blendtype" argument uses one of the macros "aura_blend_multiply" or
///					"aura_blend_additive". By default Aura uses a "multiply" blendmode which gives
///					a more realistic and natural lighting solution. However for special effects or
///					specific games, you may want to use the "additive" style, which completely 
///					changes how the Aura engine looks!
///
///					Note that this engine ONLY PERMITS ONE ACTIVE VIEW! You specify the view to use
///					when you call the function or set it to -1 if no views are required. Also note that 
///					if you are not using views and your room size is large (or even with a large view 
///					size) you may have memory issues on mobile devices. As a rule of thumb, try not 
///					to make any surface larger than 2048x2048.
///
///					
///					DO NOT USE THIS FUNCTION MORE THAN ONCE TO INIITIALISE AURA. Note too that there 
///					is an "aura_reinit()" function resource which will be used to re-initialise the 
///					surface if it is lost from memory for whatever reason.

function aura_init(ambient_alpha, ambient_colour, aa_enable, view, tilelayer, soft, blendtype)
{
aura_log("aura_init(): Initialise the main surface");

// Set the darkness alpha value (0 - 1)
aura_alpha = ambient_alpha;

// Set the ambient colour for the darkness 
aura_colour = ambient_colour;

// Set the view port to use (-1 for no views, or 0 - 7)
aura_view = view;

// Now set the anti-alaiasing level. With anti-aliasing enabled, the shadows created 
// will have smoother, aliased edges. Without this then they will be pixelated (ideal 
// for retro games). Note that if you disable anti-aliasing then you should also disable
// soft shadows otherwise you won't get the pixelated effect.
aura_aa = 0;
if aa_enable == true
	{
	if display_aa >= 12
	    {
	    display_reset(8, false);
		aura_aa = 8;
	    }
	else
	    {
	    if display_aa >= 6
	        {
	        display_reset(4, false);
			aura_aa = 4;
	        }
	    else
	        {
	        if display_aa >= 2
	            {
	            display_reset(2, false);
				aura_aa = 2;
	            }
	        else
	            {
	            display_reset(0, false);
	            }
	        }
	    }
	}
else
	{
	display_reset(0, false);
	}

// Start defining a custom vertex format. This is sligthly faster than using the 
// general built in primitive vertex formats.
vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();

// Save the vertex format to a variable and create a vertex buffer for the shadow meshes
aura_v_format = vertex_format_end();
aura_s_buffer = vertex_create_buffer();

// If a layer tilemap is going to be used for a shadow caster, we need to initialise this.
// This is an OPTIONAL argument, and can be either ignored, set to -1 (no tilemap) or 
// be set to a layer ID value (string or real, depending on how the layer was created).
aura_tiles = -1;
if argument_count > 4
	{
	// If a tilemap layer ID is supplied as a string, we need to convert it to a real.
	// Note that the code handles cases where the tilemap argument is not supplied, 
	// or the tilemap layer given does not exist in the current room, so you can either
	// omit this argument, or supply one even if the layer doesn't exist in all rooms 
	// and the engine will adapt.
	if is_string(tilelayer)
		{
		tilelayer = layer_get_id(tilelayer);
		}
	// See if the supplied layer actually exists in the room
	if !layer_exists(tilelayer) && tilelayer != -1
		{
		aura_tiles = -1;
		aura_log("aura_init(): WARNING! Specified tile layer does not exist and will not be used");
		}
	else aura_tiles = tilelayer
	// IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	// Even though you are specifying a tile layer for shadows, this layer will still
	// need to be initialised using the function "aura_shadowcaster_tile_init". See the
	// Create Event of the DEMO controller object to see how and the function resource 
	// for more information.
	// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	}

// Setup the tile map DS list. This list will hold a series of DS maps with the 
// vertex coordinates for each of the tile layer shadow casters.
aura_tile_list = -1;
if aura_tiles > -1
	{
	aura_tile_list = ds_list_create();
	}

// Set up tilemap initial shadow length
aura_tile_length = 100000;

// Check for soft shadows. Soft shadows uses a shader to add "blur" to the final AURA 
// surface. It's fast and simple to use, so shouldn't affect performance too much when
// enabled. This is another OPTIONAL argument and can be omitted when callin the Init
// function, or it can be set to 0 to disable or greater than 0 for different levels 
// of smoothing (2 looks good for the demo, but it will depend on many factors, like
// room/viewport size, so experiment!).
aura_soft = 0;
aura_soft_usize = -1;
if argument_count > 5
	{
	if shader_is_compiled(sh_Aura_Blur)
		{
		aura_soft = soft;
		aura_soft_usize = shader_get_uniform(sh_Aura_Blur,"size");
		}
	}
	
// Now set the blending type to use, which can be either "additive" or "multiply"
// If this is not supplied it will default to "multiply", which is the recommended setting.
aura_blendmode = aura_blend_multiply;
if argument_count > 6
	{
	if (blendtype != aura_blend_multiply) && (blendtype != aura_blend_additive)
		{
		aura_log("aura_init(): WARNING! Blendtype not recognised. Set to default multiply blendmode.");
		}
	else aura_blendmode = blendtype;
	}

// Check to see if we are using views or not and initialise the main AURA surface
if aura_view > -1
	{
	// View is active so create a surface that size
	var _vw = camera_get_view_width(view_camera[aura_view]);
	var _vh = camera_get_view_height(view_camera[aura_view]);
	aura_surface = surface_create(_vw, _vh);
	}
else
	{
	// No views, so create a surface for the room
	aura_surface = surface_create(room_width, room_height);
	}
}


/// @function					aura_reinit(iterations);
/// @param {real}	iterations	The number of times Aura should try to recreate the surface before failing

/// @description	Recreate the main surface if necessary.
///					Since we are using surfaces, these can disappear at any time and so we need to catch 
///					this and deal with it otherwise the game will crash and the player get an error.
///					This function is run from within the "Aura_Upate" function, and should NEVER be called
///					anywhere else (ie: you shouldn't need to call this yourself ever).
///					
///					When this is called we set the iterations to use, which is the number of times that 
///					we want AURA to try and create the surface. The default value is 50, but you can 
///					change this from the Update function where it is called.

function aura_reinit(iterations)
{
aura_log("aura_reinit(): Re-initiliasing the main Aura light surface.");
var count = 0;	// This variable will be used to check that a surface has actually been created
// Check the surface exists
if !surface_exists(aura_surface)
	{
	// It doesn't so attempt to recreate it
	while (!surface_exists(aura_surface) && count < iterations)
		{
		if aura_view > -1
		    {
			var _vw = camera_get_view_width(view_camera[aura_view]);
			var _vh = camera_get_view_height(view_camera[aura_view]);
		    aura_surface = surface_create(_vw, _vh);
		    }
		else
		    {
		    aura_surface = surface_create(room_width, room_height);
		    }
		count++;
		}
	// If it STILL doesn't exist, return an error
	if count >= iterations
		{
		// Show the user a message...
		aura_log("aura_reinit(): WARNING! Surface error - There may not be enough memory to run this game!");
		// This function returns "false" when it fails so you can handle it however you want.
		// By default it calls "game_end" after showing the user the above message, but you can 
		// handle this how you wish by editing the aura_update function.
		return false
		}
	}
return true;
}


/// @function		aura_update();

/// @description	Update all lights and shadows. This function is where all the 
///					lights and shadows are updated and then drawn to the main AURA 
///					surface ready to be drawn to the screen.

function aura_update()
{
// First, update all lights before drawing them...
aura_light_update(aura_v_format, aura_s_buffer);

// Set drawing to the main surface if it exists, and if it doesn't recreate
// or end the game on an error. The number if iterations for the surface 
// re-init function is set to 50, but this can be changed to a lower or higher
// amount. Generally if it doesn't recreate after the first couple of attempts
// it won't, so a lower number like 5 is usually fine.

if !surface_exists(aura_surface)
	{
	if !aura_reinit(50)
	    {
	    // surface doesn't exist so end the game... This can be changed as required.
		aura_log("aura_update(): ERROR! Main light surface could not be created. Ending game.");
	    game_end();
	    exit;
	    }
	}
else
	{
	surface_set_target(aura_surface);

	// Clear the surface to black
	draw_clear(c_black);

	// Draw the ambient penumbra colour
	if aura_view > -1
	    {
		var _vw = camera_get_view_width(view_camera[aura_view]);
		var _vh = camera_get_view_height(view_camera[aura_view]);
	    draw_sprite_ext(spr_Aura_Pixel, 0, -10, -10, _vw + 20, _vh + 20, 0, aura_colour, aura_alpha);
	    }
	else
	    {
	    draw_sprite_ext(spr_Aura_Pixel, 0, -10, -10, room_width + 20, room_height + 20, 0, aura_colour, aura_alpha);
	    }
	// Set the blend mode for the lights. We use an additive belnd mode
	// here to get the best luminosity, but the main AURA surface will be 
	// drawn using a multiply blend mode for better realism.
	gpu_set_blendmode(bm_add);
	// Draw the fast lights (these do not cast shadows)
	Aura_Light_Draw_Fast();
	// Draw the lights (these do cast shadows)
	aura_light_draw();
	// Reset blend mode
	gpu_set_blendmode(bm_normal);
	// Reset surface
	surface_reset_target();
	}
}



/// @function		aura_draw();

/// @description	Draw the final AURA surface to the screen

function aura_draw()
{
// Set the blend mode (by default we use a multiply blend mode to get better lighting
// that isn't as "burnt" or saturated as an additive blend mode, but this can be changed 
// when you call the aura_init() function).
if aura_blendmode == aura_blend_additive
	{
	gpu_set_blendmode(bm_add);
	}
else gpu_set_blendmode_ext(bm_dest_color, bm_zero);

// Draw the main AURA surface... First we get the position to draw at based 
// on whether there is a view active or not.
if aura_view > -1
	{
	var _vx = camera_get_view_x(view_camera[aura_view]);
	var _vy = camera_get_view_y(view_camera[aura_view]);
	}
else
	{
	var _vx = 0;
	var _vy = 0;
	}
// Here we check to see whether soft shadows are enabled
if aura_soft > 0
	{
	// Soft shadows are enabled so we need to set the shader properties before drawing
	var _vw = camera_get_view_width(view_camera[aura_view]);
	var _vh = camera_get_view_height(view_camera[aura_view]);
	shader_set(sh_Aura_Blur)
	shader_set_uniform_f(aura_soft_usize, _vw, _vh, aura_soft);
	// Draw the surface
	draw_surface(aura_surface, _vx, _vy);
	shader_reset()
	}
else
	{
	// No soft shadows so just draw the surface
	draw_surface(aura_surface, _vx, _vy);
	}
// Reset the blend mode
gpu_set_blendmode(bm_normal);
}


/// @function		aura_cleanup();
/// @description	Free the surfaces, buffers, etc... at the end of the room.
///					This should be called in the CLEAN UP Event in the main controller instance.
function aura_cleanup()
{
aura_log("aura_cleanup(): Cleaning dynamic resources");
// Free up the light surfaces
with (obj_Aura_Light_Parent)
	{
	aura_light_free();
	}
// Free up the main AURA surface
if surface_exists(aura_surface)
	{
	surface_free(aura_surface);
	}
// Free up the vertex buffer and vertex format
vertex_delete_buffer(aura_s_buffer);
vertex_format_delete(aura_v_format);
// Free up tilemap shadow caster data if anabled
if aura_tiles != -1
	{
	for (var i = 0; i < ds_list_size(aura_tile_list); i++;)
		{
		ds_map_destroy(aura_tile_list[| i]);
		}
	ds_list_destroy(aura_tile_list);
	}
}










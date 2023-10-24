/// The functions in this script are used to define the different types of
///	shadow caster objects. These objects will be used to generate the "shadow 
///	mesh" that occludes all the differnt light sources in the Aura engine.
///
///	The functions in this script are:
///
///		aura_shadowcaster_box_init([length])
///		aura_shadowcaster_circle_init(precision, radius, [length])
///		aura_shadowcaster_poly_init([length])
///		aura_shadowcaster_add_point(_x, _y)
///		aura_shadowcaster_tile_init(tile_w, tile_h, vis, [length])
///		aura_shadowcaster_rect_init(half_width, half_height, [length])
///		
///	The last functionl isted here is for use when you want to rotate a shadow 
///	caster:
///
///		aura_shadowcaster_rotate(angle)
///


/// @function					aura_shadowcaster_box_init([length]);
/// @description				Create a box shaped shadow caster based on the current sprite
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

/// @description	Assign a box shadow based on the sprite bounding box of the sprite assigned 
///					to the instance. This takes into consideration any scaling done in the room editor, 
///					or using the image_x/yscale (as long as they have been set previously to calling 
///					this function). Note that the function has an optional "length" argument so you 
///					can tell Aura the length multiplier to use for the shadow (EXPERIMENTAL! the results
///					aren't really very good, but it may provide an interesting effect for some games).

function aura_shadowcaster_box_init()
{
// Number of shadow points
aura_shadow_points = 4;

// Add the points to the shadow caster array
aura_shadow_x[0] = bbox_left - x;
aura_shadow_y[0] = bbox_top - y;
aura_shadow_x[1] = (bbox_right + 1) - x;
aura_shadow_y[1] = bbox_top - y;
aura_shadow_x[2] = (bbox_right + 1) - x;
aura_shadow_y[2] = (bbox_bottom + 1)- y;
aura_shadow_x[3] = bbox_left - x;
aura_shadow_y[3] = (bbox_bottom + 1) - y;

for (var i = 0; i < 4; i++;)
	{
	aura_shadow_xylen[i] = point_distance(0, 0, aura_shadow_x[i], aura_shadow_y[i]);
	aura_shadow_xydir[i] = point_direction(0, 0, aura_shadow_x[i], aura_shadow_y[i]);
	}

// EXPERIMENTAL! This will set the length of the shadow cast by lights
// To be honest, I'm not too happy with how this looks and recommend 
// that it'snot used, but it may be useful to some people or for specific
// effects...
aura_shadow_length = 100000;
if argument_count > 0
	{
	aura_shadow_length = argument[0];
	}
}


/// @function		aura_shadowcaster_circle_init(precision, radius, [length]);
/// @param {real}	precision	The precision with which to generate the shadow caster vertex data (min: 4)
/// @param {real}	radius		The radius of the shadow caster
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

/// @description	Create a circular shadow caster. It is assumed that the x/y of the shadow
///					caster instance sprite is centered (if you use a sprite, but this is not 
///					required) and a precision of 8 is usually fine, but you may need to make it 
///					higher for larger sprites / circles. Note that the function has an optional
///					"length" argument so you can tell Aura the length multiplier to use for the
///					shadow (EXPERIMENTAL! the results aren't really very good, but it may provide
///					an interesting effect for some games).

function aura_shadowcaster_circle_init(precision, radius)
{
// Initialise instance variables
aura_shadow_points = 0;

// Set base circle angle var
var a_ang = 360 / precision;

// Add vertices
for (var i = 0; i <= 360; i += a_ang;)
	{
	aura_shadow_x[aura_shadow_points] = lengthdir_x(radius, i);
	aura_shadow_y[aura_shadow_points] = lengthdir_y(radius, i);
	aura_shadow_xylen[aura_shadow_points] = point_distance(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);
	aura_shadow_xydir[aura_shadow_points] = point_direction(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);
	++aura_shadow_points;
	}

// EXPERIMENTAL! This will set the length of the shadow cast by lights
// To be honest, I'm not too happy with how this looks and recommend 
// that it'snot used, but it may be useful to some people or for specific
// effects...
aura_shadow_length = 100000;
if argument_count > 2
	{
	aura_shadow_length = argument[2];
	}
}


/// @function		aura_shadowcaster_poly_init([length]);
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

/// @description	After initialising the polygon shadow caster, you must then call the function
///					"aura_shadowcaster_add_point" to add the points of the poligon in CLOCKWISE order.
///					Note that the function has an optional "length" argument so you can tell Aura the length 
///					multiplier to use for the shadow (EXPERIMENTAL! the results aren't really very good, 
///					but it may provide an interesting effect for some games).

function aura_shadowcaster_poly_init()
{
// Initialise the shadow caster points variable
aura_shadow_points = 0;

// EXPERIMENTAL! This will set the length of the shadow cast by lights
// To be honest, I'm not too happy with how this looks and recommend 
// that it'snot used, but it may be useful to some people or for specific
// effects...
aura_shadow_length = 100000;
if argument_count > 0
	{
	aura_shadow_length = argument[0];
	}
}


/// @function		aura_shadowcaster_add_point(_x, _y);
/// @param {real}	_x	The x position for the shadow caster in the room
/// @param {real}	_y	The y position for the shadow caster in the room

/// @description		Add points to a polygon shadow caster

function aura_shadowcaster_add_point(_x, _y)
{
// Add a point to the shadow caster polygon in CLOCKWISE order
aura_shadow_x[aura_shadow_points] = _x;
aura_shadow_y[aura_shadow_points] = _y;
aura_shadow_xylen[aura_shadow_points] = point_distance(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);
aura_shadow_xydir[aura_shadow_points] = point_direction(0, 0, aura_shadow_x[aura_shadow_points], aura_shadow_y[aura_shadow_points]);
aura_shadow_points++;
}


/// @function					aura_shadowcaster_tile_init(tile_w, tile_h, vis, [length]);
/// @param {real}	tile_width	The width of a single tile cell (in pixels)
/// @param {real}	tile_height	The height of a single tile cell (in pixels)
/// @param {bool}	visible		Set the tile layer used to visible (true) or not (false)
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

///	@description	This will initialise a tile map from the room editor as a shadow caster.
///					You give the width and height of a single tile cell as well as the layer 
///					to use (this can be a dynamic layer created before the shadow caster is
///					initialised or a layer from the room editor) and the function will go through 
///					the layer data and generate a series of shadow caster vertices based on
///					the position of the tiles. You can also flag the layer as being visible
///					or not and the function will enable/disable it for you. If the shadow vertices
///					are created correctly the function returns "true" otherwise it will return "false"

function aura_shadowcaster_tile_init(tile_w, tile_h, vis)
{
if instance_exists(obj_Aura_Control)
	{
	var _l = obj_Aura_Control.aura_tiles;
	if _l > -1 && layer_exists(_l)
		{
		// Create temp objects at all the tile positions.
		// This is required so that we can optimise the vertex count for the shadow casters
		var _inst_layer = layer_create(10000);
		var _tmap_layer = layer_tilemap_get_id(_l);
		for (var i = 0; i < room_width; i+= tile_w;)
			{
			for (var j = 0; j < room_height; j+= tile_h;)
				{
				var _td = tilemap_get_at_pixel(_tmap_layer, i, j);
				if !tile_get_empty(_td)
					{
					// IMPORTANT!
					// This object MUST have a sprite that is the same size as a single tile cell!
					with (instance_create_layer(i, j, _inst_layer, obj_Aura_ShadowCaster_Tiles))
						{
						initial_width = sprite_get_width(sprite_index);
						initial_height = sprite_get_height(sprite_index);
						xorigin = sprite_get_xoffset(sprite_index);
						yorigin = sprite_get_yoffset(sprite_index);
						}
					}
				}
			}
		// Optimise the temporary objects. This simply "expands" the objects to 
		// create as large an area as possible. We will then use the corner vertices
		// of these objects to generate the shadow mesh
		var _wall = obj_Aura_ShadowCaster_Tiles;
		var _obj = noone;
		repeat (2)
			{
			with (_wall)
			    {
			    _obj = instance_place(x + 1, y, _wall);
			    if instance_exists(_obj)
			        {
			        if (_obj.sprite_height == sprite_height) && (_obj.y == y) && (bbox_right + 1 = _obj.bbox_left)
			            {
			            var bx = bbox_left;
			            image_xscale = (sprite_width + _obj.sprite_width) / initial_width;
			            x = bx + xorigin * image_xscale;
			            with (_obj) instance_destroy();
			            }
			        }
			    _obj = instance_place(x - 1, y, _wall);
			    if instance_exists(_obj)
			        {
			        if (_obj.sprite_height == sprite_height) && (_obj.y == y) && (_obj.bbox_right + 1 == bbox_left)
			            {
			            image_xscale = (sprite_width + _obj.sprite_width) / initial_width;
			            x = _obj.bbox_left + xorigin * image_xscale;
			            with (_obj) instance_destroy();
			            }
			        }
			    } 
			with (_wall)
			    {
			    _obj = instance_place(x, y + 1, _wall);
			    if instance_exists(_obj)
			        {
			        if (_obj.sprite_width == sprite_width) && (_obj.x == x) && (bbox_bottom + 1 == _obj.bbox_top)
			            {
			            var by = bbox_top;
			            image_yscale = (sprite_height + _obj.sprite_height) / initial_height;
			            y = by + yorigin * image_yscale;
			            with (_obj) instance_destroy();
			            }
			        }   
			    _obj = instance_place(x, y - 1, _wall);
			    if instance_exists(_obj)
			        {
			        if (_obj.sprite_width = sprite_width) && (_obj.x = x) && (_obj.bbox_bottom + 1 = bbox_top)
			            {
			            image_yscale = (sprite_height + _obj.sprite_height) / initial_height;
			            y = _obj.bbox_top + yorigin * image_yscale;
			            with (_obj) instance_destroy();
			            }
			        }
			    }
			}
		// Add the tilemap shadow vertex data into the AURA tile vertex list
		var _list = obj_Aura_Control.aura_tile_list;
		with (_wall)
			{
			var pos = ds_list_size(_list);
			ds_list_add(_list, ds_map_create());
			ds_map_add(_list[| pos], "x1", bbox_left);
			ds_map_add(_list[| pos], "y1", bbox_top);
			ds_map_add(_list[| pos], "x2", bbox_right);
			ds_map_add(_list[| pos], "y2", bbox_top);
			ds_map_add(_list[| pos], "x3", bbox_right);
			ds_map_add(_list[| pos], "y3", bbox_bottom);
			ds_map_add(_list[| pos], "x4", bbox_left);
			ds_map_add(_list[| pos], "y4", bbox_bottom);
			// Destroy the temp object and move on
			instance_destroy();
			}
		// Switch off the tilemap shadow caster layer if required
		layer_set_visible(_l, vis);
		// EXPERIMENTAL! This will set the length of the shadow cast by lights
		// To be honest, I'm not too happy with how this looks and recommend 
		// that it's not used, but it may be useful to some people or for specific
		// effects...
		if argument_count > 3
			{
			obj_Aura_Control.aura_tile_length = argument[3];
			}
		return true;
		}
	else
		{
		aura_log("aura_shadowcaster_tile_init(): WARNING! Tilemap shadow caster not initialised. Invalid (or non-exisiting) tile layer given!");
		obj_Aura_Control.aura_tiles = -1;
		return false;
		}
	}
else
	{
	aura_log("aura_shadowcaster_tile_init(): WARNING! Tilemap shadow caster not initialised. No AURA controller found!");
	return false;
	}
}


/// @function		aura_shadowcaster_rect_init(half_width, half_height, [length]);
/// @param {real}	half_width		Half the width of the rectangular shadow you want to make
/// @param {real}	half_height		Half the height of the rectangular shadow you want to make
/// @param {real}	length		OPTIONAL! If this is set to any value over 0, then the shadow will
///								be drawn using this length multiplier.

/// @description	This assigns a rectangular shadow to the instance calling the function. You supply the 
///					half width and height and the shadow will be calculated using that around the position
///					of the instance in the room. Note that the function has an optional "length" argument 
///					so you can tell Aura the length multiplier to use for the shadow (EXPERIMENTAL! the 
///					results aren't really very good, but it may provide an interesting effect for some games)..

function aura_shadowcaster_rect_init(half_width, half_height)
{
// Number of shadow points
aura_shadow_points = 4;

// Add the points to the shadow caster array
aura_shadow_x[0] = -half_width;
aura_shadow_y[0] = -half_height;

aura_shadow_x[1] = half_width;
aura_shadow_y[1] = -half_height;

aura_shadow_x[2] = half_width;
aura_shadow_y[2] = half_height;

aura_shadow_x[3] = -half_width;
aura_shadow_y[3] = half_height;

for (var i = 0; i < 4; i++;)
	{
	aura_shadow_xylen[i] = point_distance(0, 0, aura_shadow_x[i], aura_shadow_y[i]);
	aura_shadow_xydir[i] = point_direction(0, 0, aura_shadow_x[i], aura_shadow_y[i]);
	}

// EXPERIMENTAL! This will set the length of the shadow cast by lights
// To be honest, I'm not too happy with how this looks and recommend 
// that it'snot used, but it may be useful to some people or for specific
// effects...
aura_shadow_length = 100000;
if argument_count > 2
	{
	aura_shadow_length = argument[2];
	}
}


/// @function		aura_shadowcaster_rotate(angle);
/// @param {real}	angle	The angle to rotate the shadow by

/// @description	Rotate a shadow caster by a given amount

function aura_shadowcaster_rotate(angle)
{
for (var i = 0; i < aura_shadow_points; i++;)
	{
	aura_shadow_x[i] = lengthdir_x(aura_shadow_xylen[i], aura_shadow_xydir[i] + angle);
	aura_shadow_y[i] = lengthdir_y(aura_shadow_xylen[i], aura_shadow_xydir[i] + angle);
	}
}




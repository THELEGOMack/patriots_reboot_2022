/// The functions in this script are "convenience" functions used by
///	the Aura scripts, but not really designed for use outside of the
///	the Aura system.
///
///	The functions in this script are:
///
///		aura_log(value)
///		aura_in_view(view)
///		aura_in_sight(instance)
///


/// @function						aura_log(value)
/// @param {real/string}	value	The base alpha value (0 - 1) for the penumbra that the light will illuminate

/// @description	This function is basically a wrapper for "show_debug_message" and used to
///					specifically show information related to the Aura Light System.

function aura_log(value)
{
if !is_string(value)
	{
	value = string(value);
	}
show_debug_message("AURA LOG >>>>>>>> " + value);
}


/// @function				aura_in_view(view);
/// @param {real}	view	The view to check (-1 for no views)

/// @description	Check if an instance is in view, or if views aren't enabled.

function aura_in_view(view)
{
// Check view is enabled
if view != -1
	{
	// Setup light bounding box vars
	var a_left = x - aura_light_radius;
	var a_top = y - aura_light_radius;
	var a_right = x + aura_light_radius;
	var a_bottom = y + aura_light_radius;
	// Get view vars
	var _vx = camera_get_view_x(view_camera[view]);
	var _vy = camera_get_view_y(view_camera[view]);
	var _vw = camera_get_view_width(view_camera[view]);
	var _vh = camera_get_view_height(view_camera[view]);
	// Check
	if (a_right < _vx) || (a_bottom < _vy) || (a_left > (_vx + _vw)) || (a_top > (_vy + _vh))
		{
		return false;
		}
	else return true;
	}
else return true;
}


/// @function					aura_in_light(instance);
/// @param {real}	instance	ID of the instance to check if within the lightsource

/// @description	Helper function. Check if a caster instance is actually within the light source

function aura_in_light(instance)
{
// Init temp vars
var left = 1000000;
var right = -1000000;
var top = 1000000;
var bottom = -1000000
// Loop through the shadow caster vertices
for (var i = 0; i < aura_shadow_points; i++;)
	{
	if x + aura_shadow_x[i] < left		{left = x + aura_shadow_x[i];}
	if x + aura_shadow_x[i] > right		{right = x + aura_shadow_x[i];}
	if y + aura_shadow_y[i] > bottom	{bottom = y + aura_shadow_y[i];}
	if y + aura_shadow_y[i] < top		{top = y + aura_shadow_y[i];}
	}
if !rectangle_in_circle(left, top, right, bottom, instance.x, instance.y, instance.aura_light_radius)
	{
	return false;
	}
else return true;
}






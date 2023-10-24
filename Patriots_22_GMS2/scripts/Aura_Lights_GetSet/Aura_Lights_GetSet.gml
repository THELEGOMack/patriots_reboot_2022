///	The functions in this script are for getting and setting values for
///	all the different lights in a room. Most of these functions require
/// the instance ID for the the instance you want to get the value for.
/// Use the instance ID constant from the room editor for the instance, 
///	or the ID value as returned by the "aura_light_create()" functon.
///
///	The script contains the following GETTER functions:
/// 
///		aura_light_get_enabled(light_instance)
///		aura_light_get_static(light_instance)
///		aura_light_is_updating(light_instance)
///		aura_light_get_radius(light_instance)
///		aura_light_get_colour(light_instance)
///		aura_light_get_alpha(light_instance)
/// 
/// The following SETTER functions are also included:
/// 
///		aura_light_set_enabled(light_instance, flag)
///		aura_light_set_update(light_instance, flag)
///		aura_light_set_static(light_instance, flag)
///		aura_light_set_radius(light_instance, radius, scale)
///		aura_light_set_colour(light_instance, colour)
///		aura_light_set_alpha(light_instance, alpha)
/// 


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< GETTERS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function		aura_light_get_enabled(light_instance);
/// @param {real}	light_instance	The instance to get the enabled flag from

/// @description	This getter function returns true (1) if the instance is currently enabled or 
///					"false" (0) if it is not. If the instance doesn't exist, it will return 
///					"noone" (-4), or if the instance doesn't have the light variable (it's 
///					not a light instance or isn't a child of one of the light parent objects)
///					then it will return -1.

function aura_light_get_enabled(light_instance)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_enabled")
		{
		return light_instance.aura_light_enabled;
		}
	else
		{
		aura_log("aura_light_get_enabled(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_get_enabled(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_light_get_static(light_instance);
/// @param {real}	light_instance	The instance to get the static flag from

/// @description	This getter function returns true (1) if the instance is a static light or 
///					"false" (0) if it is not. If the instance doesn't exist, it will return 
///					"noone" (-4), or if the instance doesn't have the light variable (it's 
///					not a light instance or isn't a child of one of the light parent objects)
///					then it will return -1.

function aura_light_get_static(light_instance)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_static")
		{
		return light_instance.aura_light_static;
		}
	else
		{
		aura_log("aura_light_get_static(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_get_static(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_light_is_updating(light_instance);
/// @param {real}	light_instance	The instance to get the update flag from

/// @description	This getter function returns true (1) if the instance is currently updating
///					 or "false" (0) if it is not. If the instance doesn't exist, it will return 
///					"noone" (-4), or if the instance doesn't have the light variable (it's 
///					not a light instance or isn't a child of one of the light parent objects)
///					then it will return -1. Note that this may change automatically from one
///					step to another if the light is also flagged as static.

function aura_light_is_updating(light_instance)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_renew")
		{
		return light_instance.aura_light_renew;
		}
	else
		{
		aura_log("aura_light_is_updating(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_is_updating(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_light_get_radius(light_instance);
/// @param {real}	light_instance	The instance to get the radius of

/// @description	This getter function returns the radius of the given light source instance
///					If the instance doesn't exist, then "noone" (-4) will be retuned. If the
///					instance doesn't have the light variable (it's not a light instance or 
///					isn't a child of one of the light parent objects) then it will return -1,
///					otherwise it will return the radius of the light source.

function aura_light_get_radius(light_instance)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_radius")
		{
		return light_instance.aura_light_radius;
		}
	else
		{
		aura_log("aura_light_get_radius(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_get_radius(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_light_get_colour(light_instance);
/// @param {real}	light_instance	The instance to get the colour of

/// @description	This getter function returns the colour of the given light source instance
///					If the instance doesn't exist, then "noone" (-4) will be retuned. If the
///					instance doesn't have the light variable (it's not a light instance or 
///					isn't a child of one of the light parent objects) then it will return -1,
///					otherwise it will return the colour of the light source.

function aura_light_get_colour(light_instance)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_colour")
		{
		return light_instance.aura_light_colour;
		}
	else
		{
		aura_log("aura_light_get_colour(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_get_colour(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_light_get_alpha(light_instance);
/// @param {real}	light_instance	The instance to get the alpha of

/// @description	This getter function returns the alpha of the given light source instance
///					If the instance doesn't exist, then "noone" (-4) will be retuned. If the
///					instance doesn't have the light variable (it's not a light instance or 
///					isn't a child of one of the light parent objects) then it will return -1,
///					otherwise it will return the alpha of the light source.

function aura_light_get_alpha(light_instance)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_alpha")
		{
		return light_instance.aura_light_alpha;
		}
	else
		{
		aura_log("aura_light_get_alpha(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_get_alpha(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< SETTERS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function		aura_light_set_enabled(light_instance, flag);
/// @param {real}	light_instance	The instance to set the enabled flag on
/// @param {bool}	flag			The enabled flag (set to true or false)

/// @description	This setter function permits you to set the update variable for a light caster.
///					You supply the light instance to set, and then the flag value, where "true" (1)
///					is enabled and "false" (0) is disbled. If the funtion fails because the instance
///					given doesn't exist, it will return -4, or if the instance doesn't have the 
///					variable (ie: it is not a light caster instance) it will return -1. If it is
///					successful then it will return "true" (1).

function aura_light_set_enabled(light_instance, flag)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_enabled")
		{
		light_instance.aura_light_enabled = flag;
		return true;
		}
	else
		{
		aura_log("aura_light_set_enabled(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_set_enabled(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_light_set_update(light_instance, flag);
/// @param {real}	light_instance	The instance to set the update flag on
/// @param {bool}	flag			The update flag (set to true or false)

/// @description	This setter function permits you to set the update variable for a light caster.
///					You supply the light instance to set, and then the flag value, where "true" (1)
///					is updating and "false" (0) is no update. If the funtion fails because the instance
///					given doesn't exist, it will return "noone" (-4), or if the instance doesn't have 
///					the variable (ie: it is not a light caster instance) it will return -1. If it is
///					successful then it will return "true" (1).
///					
///					Note that setting this to "true" on a STATIC light will only work for one step 
///					before being automatically set to "false" again. Also note that switching update
///					to "false" for a DYNAMIC light will prevent it from updating too, essentially
///					converting a dynmaic light into a static one, but without using the static flag. 
	
function aura_light_set_update(light_instance, flag)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_renew")
		{
		light_instance.aura_light_renew = flag;
		return true;
		}
	else
		{
		aura_log("aura_light_set_update(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_set_update(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_light_set_static(light_instance, flag);
/// @param {real}	light_instance	The instance to set the static flag on
/// @param {bool}	flag			The static flag (set to true or false)

/// @description	This setter function permits you to set the static variable for a light caster.
///					You supply the light instance to set, and then the flag value, where "true" (1)
///					is static and "false" (0) is dynamic. If the funtion fails because the instance
///					given doesn't exist, it will return "noone" (-4), or if the instance doesn't have 
///					the variable (ie: it is not a light caster instance) it will return -1. If it is
///					successful then it will return "true" (1).
///
///					Note that setting the light to dynamic will ALSO set the "aura_light_renew" 
///					variable to "true".

function aura_light_set_static(light_instance, flag)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_static")
		{
		light_instance.aura_light_static = flag;
		if light_instance.aura_light_renew == false
			{
			light_instance.aura_light_renew = true;
			}
		return true;
		}
	else
		{
		aura_log("aura_light_set_static(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_set_static(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function						aura_light_set_radius(light_instance, radius, scale);
/// @param {real}	light_instance	The instance to set the radius of
/// @param {real}	radius			The new radius value
/// @param {bool}	scale			OPTIONAL! Whether to scale the sprite too or not

/// @description	This setter function permits you to set the radius variable for a light caster.
///					You supply the light instance to set, and then the radius value, which must be
///					greater than 0. If the funtion fails because the instance given doesn't exist, 
///					then it will return "noone" (-4), or if the instance doesn't have the variable
///					(ie: it is not a light caster instance) it will return -1. If it is successful 
///					then it will return "true" (1), and if it fails because the surface couldn't be 
///					initialised it returns "false".
///					
///					Note, when you change the light radius yu are destroying and recreating the 
///					light surface and as such the variable "aura_light_renew" will be set to 
///					true as well so the surface gets the updated shadow mesh for the new radius.
///					Also note that there is an optional scale argument that when set to true will 
///					also set the light sprite to be scaled to fit the new surface size (this ONLY 
///					WORKS WITH SPRITES THAT HAVE THE ORIGIN CENTERED!).

function aura_light_set_radius(light_instance, radius, scale)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_radius")
		{
		with (light_instance)
			{
			aura_light_radius = radius;
			// Compensate for greater/smaller radius of the light than the sprite
			if argument_count > 2
				{
				if scale == true
					{
					image_xscale = (aura_light_radius * 2) / sprite_get_width(sprite_index);
					image_yscale = (aura_light_radius * 2) / sprite_get_height(sprite_index);
					}
				}
			if surface_exists(aura_light_surface)
				{
				surface_free(aura_light_surface);
				}
			aura_light_surface = surface_create(aura_light_radius * 2 ,aura_light_radius * 2);
			if surface_exists(aura_light_surface)
				{
				surface_set_target(aura_light_surface);
				draw_clear_alpha(c_black, 1);
				surface_reset_target();
				}
			else return false;
			aura_light_renew = true;
			}
		return true;
		}
	else
		{
		aura_log("aura_light_set_radius(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_set_radius(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function						aura_light_set_colour(light_instance, colour);
/// @param {real}	light_instance	The instance to set the colour of
/// @param {bool}	colour			The new colour value

/// @description	This setter function permits you to set the colour variable for a light caster.
///					You supply the light instance to set, and then the colour value, which must be
///					greater than 0. If the funtion fails because the instance given doesn't exist, 
///					then it will return "noone" (-4), or if the instance doesn't have the variable
///					(ie: it is not a light caster instance) it will return -1. If it is successful 
///					then it will return "true" (1).
///					
///					Note that this is essentially a "free" change to make and you can set the colour
///					and alpha for a light with no performance hit or changes to the surface.

function aura_light_set_colour(light_instance, colour)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_colour")
		{
		light_instance.aura_light_colour = colour;
		return true;
		}
	else
		{
		aura_log("aura_light_set_colour(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_set_colour(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function						aura_light_set_alpha(light_instance, alpha);
/// @param {real}	light_instance	The instance to set the alpha of
/// @param {bool}	alpha			The new alpha value (0 - 1)

/// @description	This setter function permits you to set the alpha variable for a light caster.
///					You supply the light instance to set, and then the alpha value, which must be
///					greater than 0. If the funtion fails because the instance given doesn't exist, 
///					then it will return "noone" (-4), or if the instance doesn't have the variable
///					(ie: it is not a light caster instance) it will return -1. If it is successful 
///					then it will return "true" (1).
///					
///					Note that this is essentially a "free" change to make and you can set the colour
///					and alpha for a light with no performance hit or changes to the surface.

function aura_light_set_alpha(light_instance, alpha)
{
if instance_exists(light_instance)
	{
	if variable_instance_exists(light_instance, "aura_light_alpha")
		{
		light_instance.aura_light_alpha = clamp(alpha, 0 , 1);
		return true;
		}
	else
		{
		aura_log("aura_light_set_alpha(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_light_set_alpha(): ERROR! Light controller does not exist!");
	return noone;
	}
}



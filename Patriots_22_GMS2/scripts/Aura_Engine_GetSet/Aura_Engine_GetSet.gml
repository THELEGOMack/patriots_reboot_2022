/// This script contains a number of "getter" and "setter" functions that can
///	be used to retrieve and set values that are used by the Aura lighting
///	engine. These functions can be called form any instance of any object as 
///	they all reference the "obj_Aura_Control" object, so DO NOT RENAME THIS OBJECT
/// otherwise the functions will not work correctly.
///
///	The GETTER functions in this script are:
///	
///		aura_get_colour()
///		aura_get_alpha()
///		aura_get_soft()
///		aura_get_aa()
///		aura_get_view()
///		aura_get_blendtype()
///	
///	The SETTER functions in this script are:
///	
///		aura_set_colour(colour)
///		aura_set_alpha(alpha)
///		aura_set_soft(soft)
///		aura_set_aa(aa_level)
///		aura_set_view(view)
///		aura_set_blendtype(blendtype)
///	


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< GETTERS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function		aura_get_colour();

/// @description	This getter function returns the colour that is currently used for the
///					penumbra (darkness). If there is no light control instance the function
///					will return "noone" (-4), or if the controller instance doesn't have the
///					variable defined, it will return -1.

function aura_get_colour()
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_colour")
		{
		return obj_Aura_Control.aura_colour;
		}
	else
		{
		aura_log("aura_get_colour(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_get_colour(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_get_alpha();

/// @description	This getter function returns the alpha that is currently used for the
//					penumbra (darkness). If there is no light control instance the function
//					will return "noone" (-4), or if the controller instance doesn't have the
//					variable defined, it will return -1.
	
function aura_get_alpha()
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_alpha")
		{
		return obj_Aura_Control.aura_alpha;
		}
	else
		{
		aura_log("aura_get_alpha(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_get_alpha(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_get_soft();

/// @description	This getter function returns the soft shadow setting that is currently used for
//					shadows. The function will return 0 for no soft shadows, greater than 0 for the 
//					soft shadow level, "noone" (-4) if there is no light controller or -1 if the
//					variable doesn't exist in the controller instance.

function aura_get_soft()
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_soft")
		{
		return obj_Aura_Control.aura_soft;
		}
	else
		{
		aura_log("aura_get_soft(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_get_soft(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_get_aa();

/// @description	This getter function returns the anti-aliasing setting that is currently used
///					for shadows. The function will return 0 for no AA, greater than 0 for the AA
///					level, "noone" (-4) if there is no light controller or -1 if the variable
///					doesn't exist in the controller instance.
	
function aura_get_aa()
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_aa")
		{
		return obj_Aura_Control.aura_aa;
		}
	else
		{
		aura_log("aura_get_aa(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_get_aa(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_get_view();

/// @description	This getter function returns the viewport that is currently assigned for AURA.
///					The function will return -1 for no view, a value between 0 and 7 for the viewport
///					being used, "noone" (-4) if there is no lightcontroller or -1 if the variable
///					doesn't exist in the controller instance.

function aura_get_view()
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_view")
		{
		return obj_Aura_Control.aura_view;
		}
	else
		{
		aura_log("aura_get_view(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_get_view(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function		aura_get_blendtype();

/// @description	This getter function returns the blendtype currently being used by the
///					the engine to render the lighting. It will return one of the macros 
///					"aura_blend_multiply" or "aura_blend_additive" if correct, otherwise it 
///					will return -1 if the engine doesn't have the required variable, or
///					the keyword noone if the controller instance doesn't exist.
///					

function aura_get_blendtype()
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_blendmode")
		{
		return obj_Aura_Control.aura_blendmode;
		}
	else
		{
		aura_log("aura_get_blendtype(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_get_blendtype(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< SETTERS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


/// @function				aura_set_colour(colour);
/// @param {real}	colour	The colour to use

/// @description	This setter function sets the colour that is currently used for the
///					penumbra (darkness). If there is no light control instance the function
///					will return "noone" (-4), or if the controller instance doesn't have the
///					variable defined, it will return -1, otherwise it will return "true" (1).

function aura_set_colour(colour)
{

if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_colour")
		{
		obj_Aura_Control.aura_colour = colour;
		return true;
		}
	else
		{
		aura_log("aura_set_colour(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_set_colour(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function				aura_set_alpha(alpha);
/// @param {real}	alpha	The alpha value to use

/// @description	This setter function sets the alpha that is currently used for the
///					penumbra (darkness). If there is no light control instance the function
///					will return "noone" (-4), or if the controller instance doesn't have the
///					variable defined, it will return -1, otherwise it will return "true" (1).
///					
///					Note that with this engine, an alpha value of 1 will make the shadows
///					LIGHTER while an alpha value of 0 will make the shadows DARKER.

function aura_set_alpha(alpha)
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_alpha")
		{
		obj_Aura_Control.aura_alpha = alpha;
		return true;
		}
	else
		{
		aura_log("aura_set_alpha(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_set_alpha(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function				aura_set_soft(soft);
/// @param {int}	soft	The level of "softness" to set (0 - 8)

/// @description	This setter function sets the softness value for the shadow shader. If you set
///					it to 0, then soft shadows are disabled, and any value greater than 0 will
///					enable them, setting the amount of softness at the same time. If there is no 
///					light control instance the function will return "noone" (-4), or if the controller
///					instance doesn't have the variable defined, it will return -1, and if the shader
///					isn't compiled then it will return "false" (0), otherwise it will return "true" (1).

function aura_set_soft(soft)
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_soft")
		{
		obj_Aura_Control.aura_soft = soft;
		return true;
		}
	else
		{
		aura_log("aura_set_soft(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_set_soft(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function					aura_set_aa(aa_value);
/// @param {int}	aa_value	The level of AA to set.

/// @description	This setter function sets the anti-aliasing value for shadow edges. If you set
///					it to 0, then aa is disabled, and setting it to 2, 4, or 8 will enable it with
///					that level of aa (if supported). If there is no light control instance the 
///					function will return "noone" (-4), or if the controller instance doesn't have
///					the variable defined, it will return -1, otherwise it will return "true" (1).

function aura_set_aa(aa_value)
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_aa")
		{
		var _max_aa = 0;
		if display_aa >= 12
		    {
			_max_aa = 8;
		    }
		else
		    {
		    if display_aa >= 6
		        {
				_max_aa = 4;
		        }
		    else
		        {
		        if display_aa >= 2
		            {
					_max_aa = 2;
		            }
		        else
		            {
		            _max_aa = 0;
		            }
		        }
		    }
		if _max_aa < aa_value
			{
			aura_log("aura_set_aa(): WARNING! AA value requested higher than permitted AA. Set to " + string(_max_aa) + ".");
			obj_Aura_Control.aura_aa = _max_aa;
			}
		else
			{
			obj_Aura_Control.aura_aa = aa_value;
			}
		display_reset(obj_Aura_Control.aura_aa, false);
		return true;
		}
	else
		{
		aura_log("aura_set_aa(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_set_aa(): ERROR! Light controller does not exist!");
	return noone;
	}
}	
	
	
/// @function					aura_set_view(viewport);
/// @param {real}	viewport	Set to -1 for full room, or 0 - 7 for a viewport

/// @description	This setter function sets the viewport for drawing the AURA surface. If you set
///					it to -1, then the engine will cover the full room, and setting it to a 
///					viewport will make the engine draw only within the view. If there is no light 
///					control instance the function will return "noone" (-4). If the controller 
///					instance doesn't have the variable defined it will return -1. If there is an 
///					issue with creating the resized surface it will return "false" (0). If successful
///					it will return "true" (1).
///					
///					Note that changing the view port in this way will mean a complete reset of the
///					lighting system and all surfaces that are contained within. This shouldn't be
///					an issue, but it's not recommended that you change the view in this way after
///					initialsing the engine within a room.

function aura_set_view(view)
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_view")
		{
		var _ov = aura_get_view();
		obj_Aura_Control.aura_view = view;
		if !aura_reinit(5)
		    {
		    // surface doesn't exist so something is wrong and we go back to the previous setting
			aura_log("aura_set_view(): WARNING! Surface doesn't exist so revertinig to previous setting.");
			obj_Aura_Control.aura_view = _ov;
			return false;
		    }
		else
			{
			return true;
			}
		}
	else
		{
		aura_log("aura_set_view(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_set_view(): ERROR! Light controller does not exist!");
	return noone;
	}
}


/// @function					aura_set_blendtype(blendtype);
/// @param {int}	blendtype	The type of blending to set, either aura_blend_,ultiply, or aura_blend_additive

/// @description	This setter function lets you use one of the Aura macros to change the 
///					the blendmode used to generate the main Aura surface. Multiply is the 
///					default (and recommended) setting, but additive is also available if
///					required for special effects or other reasons.

function aura_set_blendtype(blendtype)
{
if instance_exists(obj_Aura_Control)
	{
	if variable_instance_exists(obj_Aura_Control.id, "aura_blendmode")
		{
		if blendtype != aura_blend_multiply && blendtype != aura_blend_additive
			{
			aura_log("aura_set_blendtype(): WARNING! Blendtype setting is not one of the recognised macros.");
			return -1;
			}
		else
			{
			obj_Aura_Control.aura_blendmode = blendtype;
			return true;
			}
		}
	else
		{
		aura_log("aura_set_blendtype(): WARNING! Light controller has not initialised correctly!");
		return -1;
		}
	}
else
	{
	aura_log("aura_set_blendtype(): ERROR! Light controller does not exist!");
	return noone;
	}
}



/// @description  Draw Demo Text

var _static = 0;
var _updating = 0;
var _enabled = 0;
var _soft = aura_get_soft();
var _aa = aura_get_aa();
var _a = aura_get_alpha();
var _c = aura_get_colour();
switch(_c)
	{
	case c_black: _c = "black"; break;
	case c_red: _c = "red"; break;
	case c_blue: _c = "blue"; break;
	case c_green: _c = "green"; break;
	case c_yellow: _c = "yellow"; break;
	case c_orange: _c = "orange"; break;
	case c_aqua: _c = "aqua"; break;
	}

with (obj_Aura_Light_Parent)
	{
	if (aura_light_static)
		{
		(++_static);
		}
	if (aura_light_renew)
		{
		(++_updating);
		}
	if (aura_light_enabled)
		{
		(++_enabled);
		}
	}

// This can all be rmeoved as all we are doing is drawing some text for the demo.

draw_text_colour(32, 8, string_hash_to_newline("FPS_Real:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 32, string_hash_to_newline("Light Number:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 48, string_hash_to_newline("Lights active:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 64, string_hash_to_newline("Lights enabled:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 80, string_hash_to_newline("Lights static:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 96, string_hash_to_newline("Soft Shadows:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 112, string_hash_to_newline("Anti-Aliasing:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 128, string_hash_to_newline("Alpha:"), c_white, c_white, c_white, c_white, 1);
draw_text_colour(32, 144, string_hash_to_newline("Colour:"), c_white, c_white, c_white, c_white, 1);

draw_text_colour(200, 8, string_hash_to_newline(string(fps_real)), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 32, string_hash_to_newline(string(instance_number(obj_Aura_Light_Parent))), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 48, string_hash_to_newline(string(_updating)), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 64, string_hash_to_newline(string(_enabled)), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 80, string_hash_to_newline(string(_static)), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 96, string_hash_to_newline(string(_soft)), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 112, string_hash_to_newline(string(_aa)), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 128, string_hash_to_newline(string(_a)), c_white, c_white, c_white, c_white, 1);
draw_text_colour(200, 144, string_hash_to_newline(_c), c_white, c_white, c_white, c_white, 1);

draw_text_colour(250, 96, "Press F1 to Change", c_white, c_white, c_white, c_white, 1);
draw_text_colour(250, 112, "Press F2 to Change", c_white, c_white, c_white, c_white, 1);
draw_text_colour(250, 128, "Press F3 to Change", c_white, c_white, c_white, c_white, 1);
draw_text_colour(250, 144, "Press F4 to Change", c_white, c_white, c_white, c_white, 1);

draw_text_colour(32, display_get_gui_height() - 64, string_hash_to_newline("Press <BACKSPACE> or the Back button to change rooms"), c_white, c_white, c_white, c_white, 1);
switch(room)
{
case rm_Aura_Demo:
    draw_text_colour(32, display_get_gui_height() - 48, string_hash_to_newline("Click and hold to move the player torch."), c_white, c_white, c_white, c_white, 1);
    break;
default:
    draw_text_colour(32, display_get_gui_height() - 48, string_hash_to_newline("Click to place a light, click and drag the mouse to move the view."), c_white, c_white, c_white, c_white, 1);
}
draw_text_colour(32, display_get_gui_height() - 32, string_hash_to_newline("Right click to create a random fast light"), c_white, c_white, c_white, c_white, 1);


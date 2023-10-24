display_mouse_set(floor(window_get_width()/2), floor(window_get_height()/2));

//debug mode toggle
if (keyboard_check_released(ord("Q")))
    {
    if global.debug = false {global.debug = true}
	else if global.debug = true {global.debug = false}
    }
	
if (keyboard_check_pressed(vk_escape)){game_restart();} //restart game from main menu
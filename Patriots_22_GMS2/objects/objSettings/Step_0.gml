//debug mode toggle
if (keyboard_check_released(ord("Q")))
    {
    if global.debug = false {global.debug = true}
	else if global.debug = true {global.debug = false}
    }
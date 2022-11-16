//get inputs
menuLeftKey = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
menuRightKey = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));

//switch between campaigns using left/right on main menu
if menuLeftKey
{
	image_index -= 1;
}
if menuRightKey
{
	image_index += 1;
}

switch (image_index) {
    case 0:
        global.campaign = 0; //Patriots
        break;
	case 1:
		global.campaign = 1; //Hunter
		break;
	case 2:
		global.campaign = 2; //Predators
		break;
	default:
        global.campaign = 0;
        break;
}
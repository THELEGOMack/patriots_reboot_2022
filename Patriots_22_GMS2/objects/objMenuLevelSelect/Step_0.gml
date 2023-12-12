//get inputs
menuRightKey = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
menuLeftKey = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
menuSelectKey = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left);
//menuBackKey = keyboard_check_pressed(vk_escape); //make "back" option separate from objEffector's ESC function

//store number of options in current menu
opLength = array_length(option[menuArrayLevel]);

//move thru menu
pos += menuRightKey - menuLeftKey;
if (pos >= opLength) {pos = 0}
if (pos < 0) {pos = opLength-1}
switch (pos) {
    case 0: //level one
		txtHeading = "DEMO LEVEL ONE"
        txtLevelTitle = "VANGUARD";
		levelCover = sprLevelSelect_Laundry;
        break;
	case 1: //level two
		txtHeading = "DEMO LEVEL TWO";
		txtLevelTitle = "BATH HOUSE";
		levelCover = sprLevelSelect_Bathhouse;
		break;
	case 2: //level three
		txtHeading = "DEMO LEVEL THREE";
		txtLevelTitle = "VILLA";
		levelCover = sprLevelSelect_Villa;
		break;
    default:
        // code here
        break;
}

//using the menu options
if menuSelectKey
	{
	var _sml = menuArrayLevel;

	switch(pos)
		{
			case 0: scrLoadLevel("vanguard"); break; //level one
			case 1: scrLoadLevel("villa"); break; //level two
			case 2: scrLoadLevel("vegasMeth"); break; //level three
			//...
			}
	
	if _sml != menuArrayLevel {pos = 0};
	
	//correct option length
	opLength = array_length(option[menuArrayLevel]);
	
	}
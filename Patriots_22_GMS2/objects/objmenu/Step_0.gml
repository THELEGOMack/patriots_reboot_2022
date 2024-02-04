//get inputs
menuUpKey = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
menuDownKey = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
menuSelectKey = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left);

//store number of options in current menu
opLength = array_length(option[menuArrayLevel]);

//move thru menu
pos += menuDownKey - menuUpKey;
if (pos >= opLength) {pos = 0}
if (pos < 0) {pos = opLength-1}

//using the menu options
if menuSelectKey
	{
	var _sml = menuArrayLevel;

	switch(menuArrayLevel)
		{
		case 0: //main menu
		switch(pos)
			{
			case 0: scrLoadLevel("enemyTest") break; //New Game
			case 1: room_goto(rmLevelSelect); break; //Level Select
			case 2: menuArrayLevel = 1; break; //~~Achievements~~ Level Select Actual
			case 3: menuArrayLevel = 2; break; //Settings
			case 4: game_end(); break; //Exit
			}
		break;
		case 1: //level select actual
		switch(pos)
			{
			case 0: scrLoadLevel("samGarage") break;
			case 1: scrLoadLevel("vetGarage") break;
			case 2: scrLoadLevel("vanguard"); break;
			case 3: scrLoadLevel("villa") break;
			case 4: scrLoadLevel("vegasMeth") break;
			case 5: scrLoadLevel("penthouse"); break;
			case 6: scrLoadLevel("transitionTest"); break;
			case 7: scrLoadLevel("samApartment"); break;
			case 8: scrLoadLevel("bathHouse"); break;
			case 9: menuArrayLevel = 0; break;
			}
		break;
		case 2: //options
		switch(pos)
			{
			case 0: break;
			case 1: break;
			case 2: menuArrayLevel = 0; break;
			}
		break;
		}
	
	if _sml != menuArrayLevel {pos = 0};
	
	//correct option length
	opLength = array_length(option[menuArrayLevel]);
	
	}
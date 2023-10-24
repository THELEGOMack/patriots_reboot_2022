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
			case 0: scrLocaleSet(0); room_goto(rmAdrianPenthouse2); break; //New Game
			case 1: room_goto(rmLevelSelect); break; //Level Select
			case 2: menuArrayLevel = 1; break; //Achievements
			case 3: menuArrayLevel = 2; break; //Settings
			case 4: game_end(); break; //Exit
			}
		break;
		case 1: //level select
		switch(pos)
			{
			case 0: scrLocaleSet(0); room_goto(rmSamGarage); break;
			case 1: scrLocaleSet(2); room_goto(rmVetGarage); break;
			case 2: scrLocaleSet(0); room_goto(rmLaundry); break;
			case 3: scrLocaleSet(1); room_goto(rmVilla1); break;
			case 4: scrLocaleSet(2); room_goto(rmVegasMeth1); break;
			case 5: scrLocaleSet(0); room_goto(rmEnemyTesting); break;
			case 6: menuArrayLevel = 0; break;
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
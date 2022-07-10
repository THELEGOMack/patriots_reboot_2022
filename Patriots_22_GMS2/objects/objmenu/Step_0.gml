//get inputs
menuUpKey = keyboard_check_pressed(vk_up);
menuDownKey = keyboard_check_pressed(vk_down);
menuSelectKey = keyboard_check_pressed(vk_enter);

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
			case 0: break; //New Game
			case 1: menuArrayLevel = 1; break; //Level Select
			case 2: break; //Settings
			case 3: game_end(); break; //Exit
			}
		break;
		case 1: //level select
		switch(pos)
			{
			case 0: room_goto(rmBathhouse1); break;
			case 1: room_goto(rmMania_int_F1); break;
			case 2: room_goto(rmLaundry); break;
			case 3: room_goto(rmInvestigation2); break;
			case 4: menuArrayLevel = 0; break;
			}
		break;
		}
	
	if _sml != menuArrayLevel {pos = 0};
	
	//correct option length
	opLength = array_length(option[menuArrayLevel]);
	
	}
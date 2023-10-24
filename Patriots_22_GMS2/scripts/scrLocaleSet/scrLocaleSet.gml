function scrLocaleSet(locale){
switch (locale) {
    case 0: //Miami
		global.bloodColor = c_red;
		global.wpnSpriteMod = 0;
		break;
		
	case 1: //Russia
		global.bloodColor = c_purple;
		global.wpnSpriteMod = 1;
		break;
		
	case 2: //Vegas
		global.bloodColor = c_black; //placeholder
		global.wpnSpriteMod = 2;
		break;
		
    default:
        break;
}

exit;
}
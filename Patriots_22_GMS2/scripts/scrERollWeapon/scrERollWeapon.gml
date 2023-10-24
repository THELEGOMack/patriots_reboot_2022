function scrERollWeapon(){
	switch (sprite_index) {
	    case sprMafiaWalkAK47:
		case sprMafiaIdleAK47Check:		weapon = "AK47";			break;
		case sprMafiaWalkM16:
		case sprMafiaIdleM16:
		case sprMafiaIdleM16Check:		weapon = "M16";				break;
		case sprMafiaWalkSilencer:
		case sprMafiaIdlePhoneSilencer:	weapon = "Silencer";		break;
		case sprMafiaWalkShotgun:		weapon = "Shotgun";			break;
		case sprMafiaIdlePhoneSkorp:
		case sprMafiaWalkSkorpion:		weapon = "Skorpion";		break;
		case sprMafiaWalkDoubleBarrel:	weapon = "DoubleBarrel";	break;
		case sprMafiaWalkClub:
		case sprMafiaIdleClub:			weapon = "Club";			break;
		case sprMafiaWalkBat:			weapon = "Bat";				break;
		case sprMafiaWalkKnife:			weapon = "Knife";			break;
		case sprMafiaWalkPipe:			weapon = "Pipe";			break;
		case sprMafiaIdleTalk:
		case sprMafiaIdleSmoke:			weapon = choose("AK47", "M16", "Silencer", "Shotgun", "Silencer", "Skorpion"); break;
		case sprMafiaIdlePee:			weapon = choose("Club", "Bat", "Knife", "Pipe")	break;
		case sprMafiaWalkUnarmed:		weapon = "unarmed";	break;
	
		//placeholders
		case sprMafiaIdleBeer:
		case sprMafiaIdleNewspaper:
		case sprMafiaIdleSit1:
		case sprMafiaIdleSit2:
		case sprMafiaIdleWashHands:
	    default:												break;
	}
	scrEGetAmmo();
	exit;
}
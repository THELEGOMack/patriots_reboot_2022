//Set player character
switch (room) {
	
	//SAMUEL
	case rmMania_int_F1:		global.playerCharacter = 0;	break;
	
	//ADRIAN
	case rmLaundry:
	case rmInvestigation1:
	case rmTESTROOM:
    case rmAdrianPenthouse2:	global.playerCharacter = 1;	break;
	
	//VAL
	case rmBathhouse1:			global.playerCharacter = 2; break;
	
	//IOSIF
	case rmVilla1:				global.playerCharacter = 3; break;
	
	//NULL
    default:					global.playerCharacter = -1;break;
}

if (!instance_exists(objPlayer))
{
	var pSpawn = instance_create_layer(x, y, "characters", objPlayer);
	pSpawn.direction = direction; //broken? always faces right -- issue with cursor positioning
	pSpawn.playerCharacter = global.playerCharacter;
	pSpawn.canLook = canLook;
	pSpawn.canMove = canMove;
	pSpawn.canShoot = canShoot;
}
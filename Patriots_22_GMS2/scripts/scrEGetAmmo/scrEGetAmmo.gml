function scrEGetAmmo(){ //plus other weapon values
	switch (weapon) {
		case "Knife":
		case "Pipe":
		case "Bat":
		case "Club":		currentAmmo = -1;	break;
		
		case "unarmed":		currentAmmo = 0;	break;
		
		case "DoubleBarrel":
							currentAmmo = 2;
							barrelLength = 21; if currentAmmo = 1 {barrelHeight = -2} else barrelHeight = 0;
							silenced = false;
							sfx = sndDoubleBarrel;
							shellToggle = false;
							spread = random_range(3, 9);
							shotDelay = 4;
							shootAnimSpeed = 3;
							break;
		case "Shotgun":	
							currentAmmo = 6;
							barrelLength = 20; shellSource = 9; barrelHeight = 0;
							silenced = false;
							sfx = sndShotgun;
							shellToggle = true;
							spread = random_range(5, 7);
							shotDelay = 80;
							shootAnimSpeed = 1;
							break;
		case "Skorpion":
							currentAmmo = 20;
							barrelHeight = 1; shellSource = 22; barrelLength = 29;
							silenced = false;
							sfx = sndSkorpion;
							shellToggle = true;
							spread = 4;
							shotDelay = 7;
							shootAnimSpeed = 3;
							break;
		case "Silencer":
							currentAmmo = 12;
							barrelHeight =  0; shellSource = 21; barrelLength = 32;
							silenced = true;
							sfx = sndSilencer;
							shellToggle = true;
							spread = 2;
							shotDelay = 20;
							shootAnimSpeed = 3;
							break;
		case "M16":
							currentAmmo = 24;
							barrelLength = 20; barrelHeight = 0; shellSource = 9;
							silenced = false;
							sfx = sndM16;
							shellToggle = true;
							spread = 5;
							shotDelay = 7;
							shootAnimSpeed = 3;
							break;
							
	    case "AK47":		currentAmmo = 24;
							barrelLength = 20; barrelHeight = -2; shellSource = 7;
							silenced = false;
							sfx = sndAK47;
							shellToggle = true;
							spread = 4;
							shotDelay = 7;
							shootAnimSpeed = 3;
							break;
	    default:			break;
	}
	exit;
}
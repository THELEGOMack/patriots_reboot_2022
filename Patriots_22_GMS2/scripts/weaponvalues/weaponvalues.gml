function weaponValues(){
switch(weapon)
	{
	case "AK47":
		damage = 1; sfx = sndAK47; shotgun = false; auto = true;
		barrelLength = 20; flashValue = 12; shellToggle = true; shellSource = 7;
		shotSpeed = 1.2; shotDelay = 7; spread = 5; shootAnimSpeed = 3;
		piercing = false; silenced = false;
		break;
	case "Shotgun":
		damage = 1; sfx = sndShotgun; shotgun = true; auto = false;
		barrelLength = 20; flashValue = 12; shellToggle = true; shellSource = 9;
		shotSpeed = 1; shotDelay = 40; spread = random_range(5, 7);	shootAnimSpeed = 2;
		piercing = false; silenced = false;
		break;
	case "M16":
		damage = 1; sfx = sndM16; shotgun = false; auto = true;
		barrelLength = 20; flashValue = 12; shellToggle = true; shellSource = 9;
		shotSpeed = 1; shotDelay = 5; spread = 10; shootAnimSpeed = 4;
		piercing = false; silenced = false;
		break;
	case "DoubleBarrel":
		damage = 1; sfx = sndDoubleBarrel; shotgun = true; auto = false;
		barrelLength = 20; flashValue = 12; shellToggle = false; shellSource = 0;
		shotSpeed = 1; shotDelay = 2; spread = random_range(3, 9); shootAnimSpeed = 3;
		piercing = false; silenced = false;
		break;
	case "Magnum":
		damage = 1; sfx = sndMagnum; shotgun = false; auto = false;
		barrelLength = 34; flashValue = 12; shellToggle = false; shellSource = 0;
		shotSpeed = 1.2; shotDelay = 10; spread = 0; shootAnimSpeed = 3;
		piercing = true; silenced = false;
		break;
	case "MP5":
		damage = 1; sfx = sndMP5; shotgun = false; auto = true;
		barrelLength = 31; flashValue = 12; shellToggle = true; shellSource = 20;
		shotSpeed = 0.9; shotDelay = 4; spread = 10; shootAnimSpeed = 5;
		piercing = false; silenced = false;
		break;
	case "Silencer":
		damage = 1; sfx = sndSilencer; shotgun = false; auto = false;
		barrelLength = 32; flashValue = 6; shellToggle = true; shellSource = 17;
		shotSpeed = 0.8; shotDelay = 20; spread = 2; shootAnimSpeed = 3;
		piercing = false; silenced = true;
		break;
	//etc.
	default: break;
	}
}
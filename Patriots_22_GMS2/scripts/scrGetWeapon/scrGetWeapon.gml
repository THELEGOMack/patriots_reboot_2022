function scrGetWeapon(){ //these are STARTING values
switch (weapon) {		
	case "Shotgun":
		sprite_index = sprWalkShotgun; //THIS is what is overriding the animation for idle enemies
		startingAmmo = 6;
		sfx = sndShotgun; auto = false;
		flashValue = 12; shellToggle = true; shellSource = 9; shellWait = 30;
		shotSpeed = 1; shotDelay = 40; spread = random_range(5, 7);	shootAnimSpeed = 2;
		piercing = false; silenced = false;
		barrelLength = 20; barrelHeight = 0;
		shootRange = 6;
		weaponType = "gun";
		break;
		
	case "Baikal":
		sprite_index = sprWalkBaikal;
		startingAmmo = 6;
		sfx = sndBaikal; auto = false;
		flashValue = 12; shellToggle = true; shellSource = 9; shellWait = 30;
		shotSpeed = 1; shotDelay = 40; spread = random_range(5, 7);	shootAnimSpeed = 2;
		piercing = false; silenced = false;
		barrelLength = 20; barrelHeight = 0;
		shootRange = 6;
		weaponType = "gun";
		break;
		
	case "DoubleBarrel":
		sprite_index = sprWalkDoubleBarrel;
		startingAmmo = 2;
		sfx = sndDoubleBarrel; auto = false;
		flashValue = 12; shellToggle = false; shellSource = 0; shellWait = 0;
		shotSpeed = 1; shotDelay = 2; spread = random_range(3, 9); shootAnimSpeed = 3;
		piercing = false; silenced = false;
		barrelLength = 21;
		shootRange = 6;
		with objPlayer {if ammoPlayer = 1 {barrelHeight = -2} else barrelHeight = 0;}
		//with objEnemy {}
		weaponType = "gun";
		break;
		
	case "SawedOff":
		sprite_index = sprWalkSawedOff;
		startingAmmo = 2;
		sfx = sndDoubleBarrel; auto = false;
		flashValue = 12; shellToggle = false; shellSource = 0; shellWait = 0;
		shotSpeed = 1; shotDelay = 2; spread = random_range(3, 9); shootAnimSpeed = 3;
		piercing = false; silenced = false;
		barrelLength = 21; //UPDATE THIS AND BARREL HEIGHT BELOW
		shootRange = 6;
		//with objPlayer {if ammoPlayer = 1 {barrelHeight = -2} else barrelHeight = 0;}
		////with objEnemy {}
		weaponType = "gun";
		break;
		
	case "Spas12":
		sprite_index = sprWalkSpas12;
		startingAmmo = 8;
		sfx = sndSpas12; auto = true;
		flashValue = 12; shellToggle = true; shellSource = 10; shellWait = 1;
		shotSpeed = 1; shotDelay = 15; spread = random_range(4, 6);	shootAnimSpeed = 3;
		piercing = false; silenced = false;
		barrelLength = 21; barrelHeight = -1;
		shootRange = 5;
		weaponType = "gun";
		break;
		
	case "M16":
		sprite_index = sprWalkM16;
		startingAmmo = 24;
		sfx = sndM16; auto = true;
		flashValue = 12; shellToggle = true; shellSource = 9; shellWait = 1;
		shotSpeed = 1; shotDelay = 5; spread = 5; shootAnimSpeed = 4;
		piercing = false; silenced = false;
		barrelLength = 20; barrelHeight = 0;
		shootRange = 15;
		weaponType = "gun";
		break;
		
	case "AK47":
		sprite_index = sprWalkAK47;
		startingAmmo = 24;
		sfx = sndAK47; auto = true;
		flashValue = 12; shellToggle = true; shellSource = 7; shellWait = 1;
		shotSpeed = 1.2; shotDelay = 7; spread = 4; shootAnimSpeed = 3;
		piercing = false; silenced = false;
		barrelLength = 20; barrelHeight = -2;
		shootRange = 15;
		weaponType = "gun";
		break;
		
	case "MP5":
		sprite_index = sprWalkMP5;
		startingAmmo = 32;
		sfx = sndMP5; auto = true;
		flashValue = 12; shellToggle = true; shellWait = 1;
		shotSpeed = 0.9; shotDelay = 5; spread = 10; shootAnimSpeed = 4;
		piercing = false; silenced = false;
		barrelLength = 31; shellSource = 23; barrelHeight = 0;
		shootRange = 20;
		with objPlayerAdrian {barrelLength = 19; shellSource = 9; barrelHeight = -2;}
		weaponType = "gun";
		break;
		
	case "Skorpion":
		sprite_index = sprWalkSkorpion;
		startingAmmo = 20;
		sfx = sndSkorpion; auto = true;
		flashValue = 12; shellToggle = true; shellWait = 1;
		shotSpeed = 0.8; shotDelay = 5; spread = 4; shootAnimSpeed = 4;
		piercing = false; silenced = false;
		barrelHeight =  0; shellSource = 0; barrelLength = 0; //placeholders
		shootRange = 20;
		with objPlayerAdrian {barrelHeight = -2; shellSource = 9; barrelLength = 18;}
		weaponType = "gun";
		break;
		
	case "Pistol":
		sprite_index = sprWalkPistol;
		startingAmmo = 15;
		sfx = snd9mm; auto = false;
		flashValue = 12; shellToggle = true; shellWait = 1;
		shotSpeed = 0.8; shotDelay = 20; spread = 2; shootAnimSpeed = 3;
		piercing = false; silenced = false;
		barrelHeight =  0; shellSource = 0; barrelLength = 0; //placeholders
		shootRange = 8;
		with objPlayerAdrian {barrelHeight = -1; shellSource = 12; barrelLength = 21;}
		weaponType = "gun";
		break;
		
	case "Silencer":
		sprite_index = sprWalkSilencer;
		startingAmmo = 12;
		sfx = sndSilencer; auto = false;
		flashValue = 6; shellToggle = true; shellWait = 1;
		shotSpeed = 0.8; shotDelay = 20; spread = 2; shootAnimSpeed = 3;
		piercing = false; silenced = true;
		barrelHeight =  0; shellSource = 21; barrelLength = 32;
		shootRange = 8;
		with objPlayerAdrian {barrelHeight = -1; shellSource = 12; barrelLength = 26;}
		weaponType = "gun";
		break;
		
	case "Magnum":
		sprite_index = sprWalkMagnum;
		startingAmmo = 6;
		sfx = sndMagnum; auto = false;
		flashValue = 12; shellToggle = false; shellSource = 0; shellWait = 0;
		shotSpeed = 1.2; shotDelay = 10; spread = 0; shootAnimSpeed = 3;
		piercing = true; silenced = false;
		barrelLength = 34; barrelHeight = -1;
		shootRange = 8;
		with objPlayerAdrian {barrelLength = 26; barrelHeight = -2;}
		weaponType = "gun";
		break;
		
		
		
		
		
		
		
	case "unarmed": //"zero" values (WIP melee?)
        sprite_index = sprWalkUnarmed;
		startingAmmo = 0;
		damage = 0; sfx = choose(sndSwing1, sndSwing2); auto = true;
		flashValue = 0; shellToggle = false; shellSource = 0;
		shotSpeed = 0; shotDelay = 20; spread = 0; shootAnimSpeed = 2;
		piercing = false; silenced = true;
		barrelLength = 0; barrelHeight = 0;
		weaponType = "none";
		shootRange = 90;
        break;
		
	case "Bat":
		sprite_index = sprWalkBat;
		startingAmmo = 0;
		damage = 1; sfx = choose(sndSwing1, sndSwing2); auto = true;
		flashValue = 0; shellToggle = false; shellSource = 0;
		shotSpeed = 0; shotDelay = 40; spread = 0; shootAnimSpeed = 2;
		piercing = false; silenced = true;
		barrelLength = 0; barrelHeight = 0;
		weaponType = "melee";
		shootRange = 90;
		break;
		
	case "Club":
		sprite_index = sprWalkClub;
		startingAmmo = 0;
		damage = 1; sfx = choose(sndSwing1, sndSwing2); auto = true;
		flashValue = 0; shellToggle = false; shellSource = 0;
		shotSpeed = 0; shotDelay = 40; spread = 0; shootAnimSpeed = 2;
		piercing = false; silenced = true;
		barrelLength = 0; barrelHeight = 0;
		weaponType = "melee";
		shootRange = 90;
		break;
		
	case "Knife":
		sprite_index = sprWalkKnife;
		startingAmmo = 0;
		damage = 1; sfx = choose(sndSwing1, sndSwing2); auto = true;
		flashValue = 0; shellToggle = false; shellSource = 0;
		shotSpeed = 0; shotDelay = 40; spread = 0; shootAnimSpeed = 2;
		piercing = false; silenced = true;
		barrelLength = 0; barrelHeight = 0;
		weaponType = "melee";
		shootRange = 90;
		break;
		
	case "Pipe":
		sprite_index = sprWalkPipe;
		startingAmmo = 0;
		damage = 1; sfx = choose(sndSwing1, sndSwing2); auto = true;
		flashValue = 0; shellToggle = false; shellSource = 0;
		shotSpeed = 0; shotDelay = 40; spread = 0; shootAnimSpeed = 2;
		piercing = false; silenced = true;
		barrelLength = 0; barrelHeight = 0;
		weaponType = "melee";
		shootRange = 90;
		break;
	
	case "Chain":
		sprite_index = sprWalkChain;
		startingAmmo = 0;
		damage = 1; sfx = choose(sndSwing1, sndSwing2); auto = true;
		flashValue = 0; shellToggle = false; shellSource = 0;
		shotSpeed = 0; shotDelay = 40; spread = 0; shootAnimSpeed = 2;
		piercing = false; silenced = true;
		barrelLength = 0; barrelHeight = 0;
		weaponType = "melee";
		shootRange = 90;
		break;
		
	//etc.

    default:
		break;
}
exit;
}
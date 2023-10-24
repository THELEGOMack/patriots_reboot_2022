if attacking = 1 {
	image_speed = shootAnimSpeed
	sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Walk", "Attack"));
	}

//weapon type switch (informs behavior)
switch (weapon) {
	case "Shotgun":
	case "DoubleBarrel":
	case "Spas12":
	case "M16":
	case "AK47":
	case "MP5":
	case "Skorpion":
	case "Pistol":		
	case "Silencer":
	case "Magnum": weaponType = "gun"; break;	
	case "Bat":
	case "Club":
	case "Knife":
	case "Pipe":
	case "Chain": weaponType = "melee"; break;
	case "unarmed":
	default: weaponType = "none"; break;
}
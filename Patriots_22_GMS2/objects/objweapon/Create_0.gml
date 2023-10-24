event_inherited();

SaveState = function(buf)
{
	buffer_write(buf, buffer_string, weapon);
	buffer_write(buf, buffer_string, sprite_index);
	buffer_write(buf, buffer_u8, ammo);
	buffer_write(buf, buffer_u16, image_angle);
}

LoadState = function(buf)
{
	weapon = buffer_read(buf, buffer_string);
	sprite_index = buffer_read(buf, buffer_string);
	ammo = buffer_read(buf, buffer_u8);
	image_angle = buffer_read(buf, buffer_u16);
}

image_angle = random(360);
dir = 0;
ammo = 0;

//Pickup starting ammo values
switch (weapon)
{
	//firearms
	case "AK47":
					switch (global.wpnSpriteMod) {
				    case 0: sprite_index = sprAK47; break;
					case 1: sprite_index = sprAK47_ru; break;
					case 2: sprite_index = sprAK47; break;
				    default: break;}
					ammo = 24; break;
	
	case "M16":	
					sprite_index = sprM16;
					ammo = 24; break;
	
	case "DoubleBarrel":
					switch (global.wpnSpriteMod) {
				    case 0:
					case 1: sprite_index = sprDoubleBarrel; break;
					case 2: sprite_index = sprDoubleBarrel_sawedoff; break;
				    default: break; }
					ammo = 2; break;
	
	case "Magnum":
					switch (global.wpnSpriteMod) {
				    case 0:
					case 2: sprite_index = sprMagnum; break;
					case 1: sprite_index = sprMagnum_ru; break;
				    default: break; }
					ammo = 6; break;
	
	case "MP5":		
					sprite_index = sprMP5;
					ammo = 32; break;
	
	case "Shotgun":
					switch (global.wpnSpriteMod) {
				    case 0:
					case 2: sprite_index = sprShotgun; break;
					case 1: sprite_index = sprShotgun_ru; break;
				    default: break; }
					ammo = 6; break;
	
	case "Spas12":
					sprite_index = sprSpas12;
					ammo = 8; break;
					
	case "Silencer":
					switch (global.wpnSpriteMod) {
				    case 0:
					case 2: sprite_index = sprSilencer; break;
					case 1: sprite_index = sprSilencer_ru; break;
				    default: break; }
					ammo = 12;	break;
	
	case "Skorpion":
					switch (global.wpnSpriteMod) {
				    case 0:
					case 2: sprite_index = sprSkorpion; break;
					case 1: sprite_index = sprSkorpion_ru; break;
				    default: break; }
					ammo = 20;	break;
					
	case "Pistol":
					sprite_index = sprPistol;
					ammo = 15;	break;
	//melee
	case "Club":	
					sprite_index = sprGolfClub;
					ammo = -1; break;
					
	case "Knife":
					switch (global.wpnSpriteMod) {
				    case 0:
					case 1: sprite_index = sprKnife; break;
					case 2: sprite_index = sprKnife_butterfly; break;
				    default: break;}
					ammo = -1;	break;
					
	case "Bat":	
					switch (global.wpnSpriteMod) {
				    case 0:
					case 2: sprite_index = sprBat; break;
					case 1: sprite_index = sprBat_ru; break;
				    default: break;}
					ammo = -1; break;
					
	case "Pipe":
					sprite_index = sprPipe;
					ammo = -1; break;
	//
	default:		sprite_index = sprPlayerClip;
					ammo = 0; break;
}
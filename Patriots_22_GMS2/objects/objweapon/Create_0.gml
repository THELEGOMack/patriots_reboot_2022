image_angle = random(360)
dir = 0
ammo = 0
melee = 0

//Max ammo values
switch (weapon)
{
	case "AK47": sprite_index = sprAK47; ammo = 24; break;
	case "M16": sprite_index = sprM16; ammo = 24; break;
	case "DoubleBarrel": sprite_index = sprDoubleBarrel; ammo = 2; break;
	case "Magnum": sprite_index = sprMagnum; ammo = 6; break;
	case "MP5": sprite_index = sprMP5; ammo = 32; break;
	case "Shotgun": sprite_index = sprShotgun; ammo = 6; break;
	case "Silencer": sprite_index = sprSilencer; ammo = 12; break;
	default: break;
}
	
//Melee weapon values
switch (weapon)
{
	case "Club": sprite_index = sprGolfClub; ammo = -1; break;
}
function scrDropWeapon(dist, ammo){
switch (weapon) {
	//guns
    case "AK47":			var _weaponSprite = sprAK47;			break;
	case "M16":				var _weaponSprite = sprM16;				break;
	case "DoubleBarrel":	var _weaponSprite = sprDoubleBarrel;	break;
	case "Magnum":			var _weaponSprite = sprMagnum;			break;
	case "MP5":				var _weaponSprite = sprMP5;				break;
	case "Shotgun":			var _weaponSprite = sprShotgun;			break;
	//case "Spas12":			_weaponObject = sprSpas12;		break;
	case "Silencer":		var _weaponSprite = sprSilencer;		break;
	case "Skorpion":		var _weaponSprite = sprSkorpion;		break;
	case "Pistol":			var _weaponSprite = sprPistol;			break;
	//melee
	case "Club":			var _weaponSprite = sprGolfClub;		break;
	case "Bat":				var _weaponSprite = sprBat;				break;
	case "Knife":			var _weaponSprite = sprKnife;			break;
	case "Butterfly":		var _weaponSprite = sprButterfly;		break;
	case "Pipe":			var _weaponSprite = sprPipe;			break;
	//
	default:														break;
}

var _posX = lengthdir_x(random_range(10, 30), lookDir);
var _posY = lengthdir_y(random_range(10, 30), lookDir);
var _weaponDrop = instance_create_depth(x+(dist*_posX), y+(dist*_posY), depth, objWeaponThrow);

_weaponDrop.ammoThrow = ammo;
_weaponDrop.sprite_index = _weaponSprite;
_weaponDrop.direction = random(floor(360));
_weaponDrop.spin = random_range(3, 8);
_weaponDrop.speed = random_range(3, 6);
_weaponDrop.image_angle = random(floor(360));
exit;
}
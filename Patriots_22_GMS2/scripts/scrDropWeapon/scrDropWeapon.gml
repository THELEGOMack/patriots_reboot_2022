function scrDropWeapon(dist, ammo){
var _dropSprite;
var _posX = lengthdir_x(random_range(10, 30), lookDir);
var _posY = lengthdir_y(random_range(10, 30), lookDir);
var _weaponDrop = instance_create_depth(x+(dist*_posX), y+(dist*_posY), depth, objWeapon);

switch (weapon) {
    case "AK47":			_dropSprite = sprAK47;			break;
	case "M16":				_dropSprite = sprM16;			break;
	case "DoubleBarrel":	_dropSprite = sprDoubleBarrel;	break;
	case "Magnum":			_dropSprite = sprMagnum;		break;
	case "MP5":				_dropSprite = sprMP5;			break;
	case "Shotgun":			_dropSprite = sprShotgun;		break;
	case "Spas12":			_dropSprite = sprSpas12;		break;
	case "Silencer":		_dropSprite = sprSilencer;		break;
	case "Skorpion":		_dropSprite = sprSkorpion;		break;
	case "Pistol":			_dropSprite = sprPistol;		break;
	//melee
	case "Club":			_dropSprite = sprGolfClub;		break;
	case "Bat":				_dropSprite = sprBat;			break;
	case "Knife":			_dropSprite = sprKnife;			break;
	case "Pipe":			_dropSprite = sprPipe;			break;
	//
	default:												break;
}

_weaponDrop.ammo = ammo;
_weaponDrop.sprite_index = _dropSprite;
exit;
}
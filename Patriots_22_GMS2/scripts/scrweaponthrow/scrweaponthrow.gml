function scrWeaponThrow(){
if (mouse_check_button_pressed(mb_right) and (weapon != "unarmed")) //and (shootTimer <= 0))
    {
    var throwWeapon = instance_create_depth(x, y, depth, objWeaponThrow);
    throwWeapon.direction = lookDir;
    throwWeapon.speed = 12*playerStr;
    throwWeapon.ammoThrow = ammoPlayer;
    switch(weapon)
        {
        case "AK47":			throwWeapon.sprite_index = sprAK47;         break;
        case "M16":				throwWeapon.sprite_index = sprM16;          break;
        case "Shotgun":			throwWeapon.sprite_index = sprShotgun;      break;
		case "Spas12":			throwWeapon.sprite_index = sprSpas12;		break;
        case "Silencer":		throwWeapon.sprite_index = sprSilencer;     break;
        case "MP5":				throwWeapon.sprite_index = sprMP5;          break;
        case "DoubleBarrel":	throwWeapon.sprite_index = sprDoubleBarrel;	break;
        case "Magnum":			throwWeapon.sprite_index = sprMagnum;       break;
		case "Club":			throwWeapon.sprite_index = sprGolfClub;		break;
		case "Bat":				throwWeapon.sprite_index = sprBat;			break;
		case "Pipe":			throwWeapon.sprite_index = sprPipe;			break;
		case "Skorpion":		throwWeapon.sprite_index = sprSkorpion;		break;
		case "Pistol":			throwWeapon.sprite_index = sprPistol;		break;
        default:				throwWeapon.sprite_index = sprPlayerClip;	break;
        }
    audio_play_sound(sndThrow, 10, false);
    objPlayer.sprite_index = sprWalkUnarmed;
    //objPlayer.sprite_index = sprSamThrow;
    //image_speed = 0.4
	objPlayer.weapon = "unarmed";
    ammoPlayer = 0;
    }
}
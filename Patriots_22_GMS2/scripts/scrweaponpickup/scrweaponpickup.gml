function scrWeaponPickup(){
var _inst = instance_place(x, y, objWeaponParent)
if _inst != noone
{
    if (instance_place(x, y, objWeaponParent) and (mouse_check_button_pressed(mb_right)) /*and (_inst.ammo != 0)*/)
    {
	image_yscale = 1;
    weapon = _inst.sprite_index
        switch(weapon)
            {
			//guns
            case sprAK47:
			case sprAK47_ru:				objPlayer.sprite_index = sprWalkAK47;			weapon = "AK47";			pWeaponDrop = sprAK47;					break;
            case sprM16:					objPlayer.sprite_index = sprWalkM16;			weapon = "M16";				pWeaponDrop = sprM16;					break;
            case sprShotgun:				objPlayer.sprite_index = sprWalkShotgun;		weapon = "Shotgun";			pWeaponDrop = sprShotgun;				break;
			case sprBaikal:					objPlayer.sprite_index = sprWalkBaikal;			weapon = "Baikal";			pWeaponDrop = sprBaikal;				break;
			case sprSpas12:					objPlayer.sprite_index = sprWalkSpas12;			weapon = "Spas12";			pWeaponDrop = sprSpas12;				break;
            case sprSilencer:				objPlayer.sprite_index = sprWalkSilencer;		weapon = "Silencer";		pWeaponDrop = sprSilencer;				break;
			case sprSilencer_ru:			objPlayer.sprite_index = sprWalkSilencer;		weapon = "Silencer";		pWeaponDrop = sprSilencer_ru;			break;
            case sprMP5:					objPlayer.sprite_index = sprWalkMP5;			weapon = "MP5";				pWeaponDrop = sprMP5;					break;
            case sprDoubleBarrel:			objPlayer.sprite_index = sprWalkDoubleBarrel;	weapon = "DoubleBarrel";	pWeaponDrop = sprDoubleBarrel;			break;
			//case sprSawedOff:	objPlayer.sprite_index = sprWalkDoubleBarrel;	weapon = "DoubleBarrel";	pWeaponDrop = sprSawedOff;	break;
            case sprMagnum:					objPlayer.sprite_index = sprWalkMagnum;			weapon = "Magnum";			pWeaponDrop = sprMagnum;				break;
			case sprMagnum_ru:				objPlayer.sprite_index = sprWalkMagnum;			weapon = "Magnum";			pWeaponDrop = sprMagnum_ru;				break;
			case sprSkorpion:				objPlayer.sprite_index = sprWalkSkorpion;		weapon = "Skorpion";		pWeaponDrop = sprSkorpion;				break;
			case sprSkorpion_ru:			objPlayer.sprite_index = sprWalkSkorpion;		weapon = "Skorpion";		pWeaponDrop = sprSkorpion_ru;			break;
			case sprPistol:					objPlayer.sprite_index = sprWalkPistol;			weapon = "Pistol";			pWeaponDrop = sprPistol;				break;
			//melee
			case sprGolfClub:				objPlayer.sprite_index = sprWalkClub;			weapon = "Club";			pWeaponDrop = sprGolfClub;				break;
			case sprBat:					objPlayer.sprite_index = sprWalkBat;			weapon = "Bat";				pWeaponDrop = sprBat;					break;
			case sprBatRu:					objPlayer.sprite_index = sprWalkBat;			weapon = "Bat";				pWeaponDrop = sprBatRu;				break;
			case sprPipe:					objPlayer.sprite_index = sprWalkPipe;			weapon = "Pipe";			pWeaponDrop = sprPipe;					break;
			case sprKnife:
			case sprButterfly: break;
            default:						objPlayer.sprite_index = sprWalkUnarmed;		weapon = "unarmed";													break;
            }
        objPlayer.ammoPlayer = _inst.ammo;
        instance_destroy(_inst);
        audio_play_sound(sndPickup, 10, false);
		scrGetWeapon();
    }
}
}
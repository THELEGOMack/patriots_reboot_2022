function scrWeaponPickup(){
var _inst = instance_place(x, y, objWeapon)
if _inst != noone
{
    if (instance_place(x, y, objWeapon) and (mouse_check_button_pressed(mb_right)) and (_inst.ammo != 0))
    {
	image_yscale = 1;
    weapon = _inst.sprite_index
        switch(weapon)
            {
			//guns
            case sprAK47:         objPlayer.sprite_index = sprPlayerWalkAK47;         weapon = "AK47";         pWeaponDrop = sprAK47;			break;
            case sprM16:          objPlayer.sprite_index = sprPlayerWalkM16;          weapon = "M16";          pWeaponDrop = sprM16;			break;
            case sprShotgun:      objPlayer.sprite_index = sprPlayerWalkShotgun;      weapon = "Shotgun";      pWeaponDrop = sprShotgun;		break;
            case sprSilencer:     objPlayer.sprite_index = sprPlayerWalkSilencer;     weapon = "Silencer";     pWeaponDrop = sprSilencer;		break;
            case sprMP5:          objPlayer.sprite_index = sprPlayerWalkMP5;          weapon = "MP5";          pWeaponDrop = sprMP5;			break;
            case sprDoubleBarrel: objPlayer.sprite_index = sprPlayerWalkDoubleBarrel; weapon = "DoubleBarrel"; pWeaponDrop = sprDoubleBarrel;	break;
            case sprMagnum:       objPlayer.sprite_index = sprPlayerWalkMagnum;       weapon = "Magnum";       pWeaponDrop = sprMagnum;			break;
			//melee
			case sprGolfClub:	  objPlayer.sprite_index = sprPlayerWalkClub;		  weapon = "Club";		   pWeaponDrop = sprGolfClub;		break;
            default:              objPlayer.sprite_index = sprPlayerWalkUnarmed;      weapon = noone;											break;
            }
        objPlayer.ammoPlayer = _inst.ammo;
        instance_destroy(_inst);
        audio_play_sound(sndPickup, 10, false);
    }
}
}
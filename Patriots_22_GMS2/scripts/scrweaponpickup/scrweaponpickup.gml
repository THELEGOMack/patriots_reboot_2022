function scrWeaponPickup(){
var _inst = instance_place(x, y, objWeapon)
if _inst != noone
{
    if (instance_place(x, y, objWeapon) and (mouse_check_button_pressed(mb_right)) and _inst.ammo != 0)
    {
    weapon = _inst.sprite_index
        switch(weapon)
            {
            case sprAK47:         objPlayer.sprite_index = sprPlayerWalkAK47;         weapon = "AK47";         break;
            case sprM16:          objPlayer.sprite_index = sprPlayerWalkM16;          weapon = "M16";          break;
            case sprShotgun:      objPlayer.sprite_index = sprPlayerWalkShotgun;      weapon = "Shotgun";      break;
            case sprSilencer:     objPlayer.sprite_index = sprPlayerWalkSilencer;     weapon = "Silencer";     break;
            case sprMP5:          objPlayer.sprite_index = sprPlayerWalkMP5;          weapon = "MP5";          break;
            case sprDoubleBarrel: objPlayer.sprite_index = sprPlayerWalkDoubleBarrel; weapon = "DoubleBarrel"; break;
            case sprMagnum:       objPlayer.sprite_index = sprPlayerWalkMagnum;       weapon = "Magnum";       break;
            default:              objPlayer.sprite_index = sprPlayerWalkUnarmed;   weapon = noone;          break;
            }
        objPlayer.ammoPlayer = _inst.ammo;
        instance_destroy(_inst);
        audio_play_sound(sndPickup, 10, false);
    }
}
}
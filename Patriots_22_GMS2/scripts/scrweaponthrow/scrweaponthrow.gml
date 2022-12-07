function scrWeaponThrow(){
if (mouse_check_button_pressed(mb_right) and (weapon != noone)) //and (shootTimer <= 0))
    {
    var throwWeapon = instance_create_layer(x, y, layer, objWeaponThrow);
    throwWeapon.direction = lookDir
    throwWeapon.speed = 12*playerStr
    //throwWeapon.sprite_index = sprPlayerClip
    throwWeapon.ammoThrow = ammoPlayer
    switch(weapon)
        {
        case "AK47":         throwWeapon.sprite_index = sprAK47;         break;
        case "M16":          throwWeapon.sprite_index = sprM16;          break;
        case "Shotgun":      throwWeapon.sprite_index = sprShotgun;      break;
        case "Silencer":     throwWeapon.sprite_index = sprSilencer;     break;
        case "MP5":          throwWeapon.sprite_index = sprMP5;          break;
        case "DoubleBarrel": throwWeapon.sprite_index = sprDoubleBarrel; break;
        case "Magnum":       throwWeapon.sprite_index = sprMagnum;       break;
		case "Club":		 throwWeapon.sprite_index = sprGolfClub;	 break;
        default:             throwWeapon.sprite_index = sprPlayerClip;   break;
        }
    audio_play_sound(sndThrow, 10, false);
    weapon = noone;
    objPlayer.sprite_index = sprPlayerWalkUnarmed;
    //objPlayer.sprite_index = sprSamThrow;
    //image_speed = 0.4
    ammoPlayer = 0;
    }
}
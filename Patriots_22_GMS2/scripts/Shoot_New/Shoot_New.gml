function Shoot_New(){
var shotX = 0;
var shotY = 0;
shotX = x + lengthdir_x(barrelLength, lookDir);
shotY = y + lengthdir_y(barrelLength, lookDir);
attacking = 1;
if silenced = false {global.gunshotHeard = true}


switch (weapon) {
    case "AK47":
    case "M16":			var shot = instance_create_layer(shotX, shotY, "characters", objMuzzleFlashRifle); shot.image_xscale = random_range(0.70, 1.30); shot.image_yscale = random_range(0.8, 1.2);	break;
	//9mm
	case "Silencer":	var shot = instance_create_layer(shotX, shotY, "characters", objMuzzleFlash9mm); shot.image_xscale = random_range(0.75, 1.25); shot.image_yscale = random_range(0.9, 1.1);		break; //replace later
    default:																																															break;
}
shot.image_angle = objPlayer.lookDir;
shot.image_speed = 1;

//create flash
//create gunsmoke
image_index = 0;
image_speed = 1;
sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Walk", "Attack"));
audio_play_sound(sfx, 10, false)
shootTimer = shotDelay;
//ammoPlayer--;

if (weapon = "Shotgun"){
  shellTimer = 30;
}else{shellTimer = 5;}

if (shellToggle = 1)
    {
		alarm[0] = shellTimer;
    }
else if (shellToggle = 0)
	{
		alarm[1] = 5;
		exit;
	}
}
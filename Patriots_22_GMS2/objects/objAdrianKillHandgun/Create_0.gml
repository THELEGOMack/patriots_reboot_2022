event_inherited();
sound = 0;
spriteCenter = 0; //mask X
maskPosMod = 0; //mask Y
maskIndexMod = 0;

switch (objPlayerAdrian.weapon) {
	case "Pistol": sprite_index = sprAdrianKillPistol; sound = snd9mm; break;
	case "Silencer": sprite_index = sprAdrianKillSilencer; sound = sndSilencer; break;
	case "Skorpion": sprite_index = sprAdrianKillSkorpion; sound = sndSkorpion; break;
	case "MP5": sprite_index = sprAdrianKillMP5; sound = sndMP5; break;
	default: break;
}

var _sfx = function() {
	if objPlayer.silenced = false {
		global.gunshotHeard = true;
		with objEnemy{
			if (point_distance(x, y, other.x, other.y) <= hearingRange)
				{
					alarm[1] = 1;
					state = "chase";
				}
			}
	}
	audio_play_sound(sound, 10, false);
	var _shell = instance_create_layer(x + lengthdir_x(4, direction), y + lengthdir_y(4, direction), "body_layer", objShell);
	_shell.image_index = 2;
	_shell.speed = random_range(5, 9)
	_shell.direction = image_angle - 90;
}
call_later(40, time_source_units_frames, _sfx);
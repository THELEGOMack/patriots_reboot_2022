function scrPlayerPunch(){
	image_index = 0;
	image_speed = 1;
	attacking = 1;
	sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Walk", "Attack"));
	shootTimer = 25;
	audio_play_sound(choose(sndSwing1, sndSwing2), 10, false);
	alarm[1] = 10;
	exit
}
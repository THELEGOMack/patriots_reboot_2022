function ESwing(){
	stateTXT = "swing";
	if (attacking = 0)
	{
		direction = point_direction(x, y, objPlayer.x, objPlayer.y)
		attacking = 1;
		image_speed = 2;
		sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Walk", "Attack"));
		audio_play_sound(choose(sndSwing1, sndSwing2), 10, false)
		image_yscale *= -1;
	}
	
	if (attacking = 1)
	{
		if /*image_index = floor(random_range(4, 8)) and*/ (distance_to_object(objPlayer) <= 10)
		{
			objPlayer.hp = 0;
			objPlayer.direction = id.direction;
			audio_play_sound(choose(sndHit1, sndHit2, sndHit3), 10, false);
		}
	}
	
	if (global.playerDead = false)
	{
		state = 4;
	}
}
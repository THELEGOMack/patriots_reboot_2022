function scrEStateStatic(){
	speed = 0;
	aimDir = point_direction(x, y, objPlayer.x, objPlayer.y);
	legAngle = direction;
	legIndex = 0;
	
	if string_count("Walk", sprite_get_name(sprite_index)) > 0
		{
			image_speed = 0;
			image_index = 0;
		}
}
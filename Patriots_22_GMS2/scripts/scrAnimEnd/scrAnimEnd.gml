function scrAnimEnd(){
	sprite_index = asset_get_index(string_replace(sprite_get_name(sprite_index), "Attack", "Walk"));
	attacking = 0;
	image_speed = 0;
	image_index = 0;

	//melee weapons
	if (weapon = "unarmed") or (weapon = "Club"/*,etc.*/) {image_yscale *= -1}
	
	exit
}
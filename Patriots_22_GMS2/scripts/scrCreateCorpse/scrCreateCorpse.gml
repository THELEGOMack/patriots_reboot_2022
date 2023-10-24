//let this script apply to both player and enemy

function scrCreateCorpse(){
	//variables:
		//sprite defined up here?
		//blood amt (can be 0)?
			//see blood variables?
		//
	
	//roll to animate
	
	//create corpse (not animated)
	var _corpse = instance_create_layer(x, y, "body_layer", objEnemyDead);
	_corpse.image_angle = direction;
	_corpse.image_yscale = choose(1, -1);
	_corpse.image_index = irandom_range(0, image_number-1);
	
	if bulletCount = 1 
	{
		_corpse.sprite_index = sprDeadMachinegun;
		_corpse.speed = random_range(1, 3);
		scrBleed(0, 2, random(359));
	}
	else if bulletCount >= 2
	{
		_corpse.sprite_index = sprDeadShotgun;
		_corpse.speed = random_range(1, 3) * bulletCount/4;
		scrBleed(0, 3, random(359));
	}
	
	//etc.
}
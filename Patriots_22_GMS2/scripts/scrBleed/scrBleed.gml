function scrBleed(offset, amount, dir){
	
	for (var i = 0; i < amount*irandom_range(2, 6); ++i) {
	    var _smudge = instance_create_layer(x+lengthdir_x(offset, image_angle+(random_range(dir+25, dir-25))), y+lengthdir_y(offset, image_angle+(random_range(dir+25, dir-25))), "blood_layer", objBloodSmudge);
		_smudge.sprite_index = choose(sprSmudge1, sprSmudge2, sprSmudge3);
	}
	for (var i = 0; i < amount + random_range(0, 2); ++i) {
		var _bigblood = instance_create_layer(x+lengthdir_x(offset, image_angle+dir), y+lengthdir_y(offset, image_angle+dir), "blood_layer", objBigBlood);
		_bigblood.sprite_index = choose(sprBigBlood1, sprBigBlood2);
	}
	for (var i = 0; i < amount*irandom_range(2, 5); ++i) {
	    var _splat = instance_create_layer(x+lengthdir_x(offset, image_angle+(random_range(dir+25, dir-25))), y+lengthdir_y(offset, image_angle+(random_range(dir+25, dir-25))), "blood_layer", objBloodSplat);
		_splat.sprite_index = choose(sprSplat1, sprSplat2, sprSplat3, sprSplat4);
	}

}
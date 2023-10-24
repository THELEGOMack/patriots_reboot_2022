function scrEStraightPathCheck(_target){
	if instance_exists(_target){
		var line = collision_line(x, y, _target.x, _target.y, objPlayerClip, true, true);
		if (line = noone) {return true} else {return false}
	}
	if !true {return false}
}
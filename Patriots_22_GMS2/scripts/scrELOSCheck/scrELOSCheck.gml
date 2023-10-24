function scrELOSCheck(_target){
	if instance_exists(_target){
		var lineWall = collision_line(x, y, _target.x, _target.y, objSolidWall, false, true);
		var lineWindow = collision_line(x, y, _target.x, _target.y, objSolidWindow, false, true);
		var lineDoor = collision_line(x, y, _target.x, _target.y, objDoor, true, true);
		var getPerfectLOS = point_direction(x, y, _target.x, _target.y);
		var angleDiff = angle_difference(getPerfectLOS, lookDir);

		if ((point_distance(x, y, _target.x, _target.y) <= sightMax) and (angleDiff <= visConeW) and (angleDiff >= -visConeW)) or (point_distance(x, y, _target.x, _target.y) <= sightMin)
		{
			if (lineWall = noone) and (lineWindow = noone)	and (lineDoor = noone) {return true} else return false
		}
	}
	if !true {return false}
}
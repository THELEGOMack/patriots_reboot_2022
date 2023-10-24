var _floor = instance_create_depth(x + lengthdir_x(0, image_angle) + lengthdir_x(3, image_angle + 90), y + lengthdir_y(0, image_angle) + lengthdir_y(3, image_angle + 90), depth+10, objPickupFloor);
_floor.image_angle = image_angle;

var _bed = instance_create_depth(x + lengthdir_x(4, image_angle) + lengthdir_x(-3, image_angle + 90), y + lengthdir_y(4, image_angle) + lengthdir_y(-3, image_angle + 90), depth+20, objPickupBed);
_bed.image_angle = image_angle;

var _door = instance_create_depth(x + lengthdir_x(84, image_angle) + lengthdir_x(-1, image_angle + 90), y + lengthdir_y(84, image_angle) + lengthdir_y(-1, image_angle + 90), depth-10, objPickupDoor);
_door.image_angle = image_angle;

var _gate = instance_create_depth(x + lengthdir_x(4, image_angle) + lengthdir_x(-2, image_angle + 90), y + lengthdir_y(4, image_angle) + lengthdir_y(-2, image_angle + 90), depth-10, objPickupTailgate);
_gate.image_angle = image_angle;
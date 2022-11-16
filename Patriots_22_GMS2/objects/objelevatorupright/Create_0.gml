image_speed = 0;
image_index = -1;

state = 0; //open by default
var _floor = instance_create_layer(x, y, "furnitureFloor", objElevatorFloor);
_floor.image_index = floorElevator;
_floor.image_angle = image_angle;
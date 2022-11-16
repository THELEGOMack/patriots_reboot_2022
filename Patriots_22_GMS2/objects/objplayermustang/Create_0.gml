var _floor, _xPos, _yPos, _door;
image_speed = 0;
switch(image_angle)
{
case 0:
_xPos = x+58;
_yPos = y+3;
_doorRotInit = 0;
break;

case 90:
_xPos = x+3;
_yPos = y-58;
_doorRotInit = 90;
break;

case 180:
_xPos = x-58;
_yPos = y-3;
_doorRotInit = 180;
break;

case 270:
case -90:
_xPos = x-3;
_yPos = y+58;
_doorRotInit = 270;
break;
}

_floor = instance_create_layer(_xPos, _yPos, "furnitureFloor", objPlayerMustangFloor);
_floor.image_angle = image_angle;
_door = instance_create_layer(_xPos, _yPos, layer, objPlayerMustangDoor);
_door.image_angle = image_angle;
state = 0;
doorSpd = 3;
doorRadius = 90;

//door drawing init
_xPosL = 0;
_yPosL = 0;
_xPosR = 0;
_yPosR = 0;
doorRotL = 0;
doorRotR = 0;

switch(image_angle)
{
case 0:
_xPosL = x+10;
_yPosL = y-18;
_xPosR = x+10;
_yPosR = y+20;
break;

case 90:
_xPosL = x-18;
_yPosL = y-10;
_xPosR = x+20;
_yPosR = y-10;
break;

case 180:
case -180:
_xPosL = x-10;
_yPosL = y+18;
_xPosR = x-10;
_yPosR = y-20;
break;

case 270:
case -90:
_xPosL = x+18;
_yPosL = y+10;
_xPosR = x-20;
_yPosR = y+10;
break;
}

var _floor = instance_create_layer(x, y, "furnitureFloor", objMustangFloor);
_floor.image_angle = image_angle;

if active = false {mask_index = sprMustangMaskWhole} else{
	if leftSide = true {
			mask_index = sprMustangMaskL
		} else {
			mask_index = sprMustangMaskR
			}
}
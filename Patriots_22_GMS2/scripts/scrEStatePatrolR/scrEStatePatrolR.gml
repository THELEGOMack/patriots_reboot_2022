function scrEStatePatrolR(){
	speed = speedWalk;
	lookDir = direction;
	//if playerSpotted = false {lookDir = direction}
	aimDir = point_direction(x, y, objPlayer.x, objPlayer.y);
	legAngle = direction;
	legIndex += speed*0.1;
	image_speed = 0.5;
	
	//collision turning from HM1
	if (place_meeting(x+lengthdir_x(8, direction), y+lengthdir_y(8, direction), objSolidWall)) or (place_meeting(x+lengthdir_x(8, direction), y+lengthdir_y(8, direction), objFurniture)) or (place_meeting(x+lengthdir_x(8, direction), y+lengthdir_y(8, direction), objRailing)) or (place_meeting(x+lengthdir_x(8, direction), y+lengthdir_y(8, direction), objSolidWindow))
	    {direction-=10}
	else
	    {if abs(frac(direction*(1/90)))>0 direction-=10}
}
function scrEStateAiming(){
	lookDir = angle_rotate_lerp(lookDir, aimDir, turnSpeed);
	speed = 0;
	legAngle = direction;
	legIndex = 0;
	image_speed = 0;
}
if (hp <= 0) {state = 4;}

//key bindings
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

//collision
function move(move_x,move_y){
    if !collision_circle(move_x,move_y,col_radius,objPlayerClip,1,true) {
        x = move_x;
        y = move_y;
    }
    else {
    
        for ( var angle = 1; angle <= 89; angle += 2) {
            for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
                var angle_to_check = move_axis+angle*multiplier;
                var speed_multip=0.2+0.8*abs(dcos(angle_difference(angle_to_check,move_axis)))
                
                move_x = x+lengthdir_x(spd_interp*speed_multip, angle_to_check);
                move_y = y+lengthdir_y(spd_interp*speed_multip, angle_to_check);     
                if !collision_circle(move_x,move_y,col_radius,objPlayerClip,1,true) {
                    x = move_x;
                    y = move_y;  
                    exit;       
                }
            }
        }
    }
}

var dist=point_distance(0,0,axis.x,axis.y)
if axis.x!=0{axis.x/=dist}
if axis.y!=0{axis.y/=dist}
if axis.x!=0 or axis.y!=0{move_axis=point_direction(0,0,axis_interp.x,axis_interp.y)}
axis_interp.x=approach(axis_interp.x,axis.x,0.125*delta*60)
axis_interp.y=approach(axis_interp.y,axis.y,0.125*delta*60)
if axis.x!=0 or axis.y!=0{spd_interp=lerp(spd_interp,point_distance(0,0,axis_interp.x,axis_interp.y)*walkSpeed,0.35*delta*60)}
else{spd_interp=approach(spd_interp,0,0.35*delta*60)}
motion.x=lengthdir_x(spd_interp,move_axis)*delta*60
motion.y=lengthdir_y(spd_interp,move_axis)*delta*60

function input(){
    axis.y=keyDown-keyUp
    axis.x=keyRight-keyLeft}
input();

if canLook = true{lookDir = point_direction(x, y, objEffector.x, objEffector.y);}
else lookDir = image_angle;

if (keyboard_check_pressed(vk_escape)){game_restart();} //restart game from main menu
if (keyboard_check_pressed(ord("K"))){hp = 0} //suicide key for testing purposes
	
//movement
var moveX = (keyRight - keyLeft) * walkSpeed;
var moveY = (keyDown - keyUp) * walkSpeed;
if canMove != false
	{
	move(x+motion.x,y+motion.y);
	x = min(x,room_width-8);
	x = max(x, 8);
	y = min(y,room_height-8);
	y = max(y, 8);
	}

#region leg directions
var angleSwitchSpeed = 10
if keyLeft {legAngle = approach(legAngle, 180, angleSwitchSpeed)}
if keyRight {legAngle = approach(legAngle, 0, angleSwitchSpeed)}
if keyUp {legAngle = approach(legAngle, 90, angleSwitchSpeed)}
if keyDown {legAngle = approach(legAngle, 270, angleSwitchSpeed)}
if keyLeft and keyDown {legAngle = approach(legAngle, 225, angleSwitchSpeed)}
if keyLeft and keyUp {legAngle = approach(legAngle, 135, angleSwitchSpeed)}
if keyRight and keyDown {legAngle = approach(legAngle, 315, angleSwitchSpeed)}
if keyRight and keyUp {legAngle = approach(legAngle, 45, angleSwitchSpeed)}
if keyUp and keyDown {legIndex = 0}
if keyLeft and keyRight {legIndex = 0}
#endregion

#region player animation & leg drawing
if (moveX != 0) or (moveY != 0) and (canMove = true)
	{
	if (image_speed > 0.1)
		{legIndex += 0.3;}
	if attacking = 0
		{image_speed = accel*3;}
		else if attacking = 1 {image_speed = shootAnimSpeed}
	}
	else
	{
		legIndex = 0;
		if attacking = 0
			{image_speed = 0;}
			else if attacking = 1 {image_speed = shootAnimSpeed}
	}
#endregion

switch(state)
{
	case 0: PUnarmed(); break; //unarmed
	case 1: PFirearm(); break; //guns
	case 2: PMelee(); break; //melee
	case 3: break; //execution
	case 4: PDead(); break; //dead
	//etc.
	default: break;
}

//state machine (state dictated by sprite index)
switch (weapon)
{
	case noone: state = 0; break;
	//guns
	case "Silencer":
	case "Shotgun":
	case "M16":
	case "AK47":
	case "Magnum": state = 1; break;
	//melee
	case "Club": state = 2; break;
}
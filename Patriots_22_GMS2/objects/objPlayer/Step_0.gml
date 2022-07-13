scrWeaponThrow();
scrWeaponPickup();

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
 if axis.x!=0{
            axis.x/=dist
        }
        if axis.y!=0{
            axis.y/=dist
        }

        if axis.x!=0 or axis.y!=0{
            move_axis=point_direction(0,0,axis_interp.x,axis_interp.y)
        }
        
        axis_interp.x=approach(axis_interp.x,axis.x,0.125*delta*60)
        axis_interp.y=approach(axis_interp.y,axis.y,0.125*delta*60)
        
        if axis.x!=0 or axis.y!=0{
            spd_interp=lerp(spd_interp,point_distance(0,0,axis_interp.x,axis_interp.y)*spd,0.35*delta*60)
        }else{
            spd_interp=approach(spd_interp,0,0.35*delta*60)
        }
        
        motion.x=lengthdir_x(spd_interp,move_axis)*delta*60
        motion.y=lengthdir_y(spd_interp,move_axis)*delta*60

function input(){
    axis.y=keyboard_check(ord("S"))-keyboard_check(ord("W"))
    axis.x=keyboard_check(ord("D"))-keyboard_check(ord("A"))
    
}

input();
        
      

if canLook = true
{
	lookDir = point_direction(x, y, objCursor.x, objCursor.y);
}
else lookDir = image_angle;

if (keyboard_check_pressed(ord("R")))
    {
    game_restart();
    }
	
//movement
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));
var moveX = (keyRight - keyLeft) * walkSpeed;
var moveY = (keyDown - keyUp) * walkSpeed;

if canMove = true
	{
	hspd = approach(hspd, moveX, accel);
	vspd = approach(vspd, moveY, accel);
	move(x+motion.x,y+motion.y)
	x = min(x,room_width-8);
	x = max(x, 8);
	y = min(y,room_height-8);
	y = max(y, 8);
	}

//leg directions
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

//player animation & leg drawing
if (moveX != 0) or (moveY != 0) and (canMove = true)
	{
	if (image_speed > 0.1)
		{
		legIndex += 0.3;
		}
	if attacking = 0
		{
		image_speed = accel*3;
		}
		else if attacking = 1 {image_speed = shootAnimSpeed}
	}
	else
	{
		legIndex = 0;
		if attacking = 0
			{
			image_speed = 0;
			}
			else if attacking = 1 {image_speed = shootAnimSpeed}
	}

//current weapon
if canShoot = true
	{
	shellDir = direction;
	shootTimer--;
		if shootTimer < -200
			{
			shootTimer = -1
			}
	if (mouse_check_button(mb_left) and (ammoPlayer > 0))
	    {
		weaponValues();
	    if (shootTimer <= 0)
	        {
	        Shoot();
	        }
	    }
	}
else if canShoot = false
	{
	shootTimer = 1;
	}
	
if hp <= 0
{
	statePDead();
}
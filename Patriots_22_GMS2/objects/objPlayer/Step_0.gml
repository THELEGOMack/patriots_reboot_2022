if (hp <= 0) {state = 4;}

//camera following (hard-coding for now)
with objCamera {follow = objPlayerViewCenter}

//key bindings
keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyUp = keyboard_check(ord("W"));
keyDown = keyboard_check(ord("S"));

//in level boundaries check
if place_meeting(x, y, objFloorBoundingBox)
	{
		global.playerInBounds = true;
	} else global.playerInBounds = false;

//collision
function move(move_x,move_y){
    if !collision_circle(move_x,move_y,col_radius,objPlayerClip,1,true) {
        x = move_x;
		objEffector.pBlockX = 1; //NOT effective when running up against a level's boundary
        y = move_y;
		objEffector.pBlockY = 1;
    }
    else {
        for ( var angle = 1; angle <= 89; angle += 2) {
            for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
                var angle_to_check = move_axis+angle*multiplier;
                var speed_multip=0.2+0.8*abs(dcos(angle_difference(angle_to_check,move_axis)))
                
                move_x = x+lengthdir_x(spd_interp*speed_multip, angle_to_check);
				objEffector.pBlockX = 0;
                move_y = y+lengthdir_y(spd_interp*speed_multip, angle_to_check);
				objEffector.pBlockY = 0;
                if !collision_circle(move_x,move_y,col_radius,objPlayerClip,1,true) {
                    x = move_x;
					objEffector.pBlockX = 1;
                    y = move_y;
					objEffector.pBlockY = 1;
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

if (keyboard_check_pressed(ord("K"))){hp = 0} //suicide key for testing purposes
	
//movement
var moveX = (keyRight - keyLeft) * walkSpeed;
var moveY = (keyDown - keyUp) * walkSpeed;
if canMove != false
{
	move(x+motion.x,y+motion.y);
	if global.voidActive = false
	{
		x = min(x,room_width-8);
		x = max(x, 8);
		y = min(y,room_height-8);
		y = max(y, 8);
	} else {
		x = min(x,room_width + camera_get_view_width(view_camera[0])/2);
		x = max(x, -camera_get_view_width(view_camera[0])/2);
		y = min(y,room_height + camera_get_view_height(view_camera[0])/2);
		y = max(y, -camera_get_view_height(view_camera[0])/2);
	}
}

//Attacks and cooldown
shootTimer--;
if shootTimer < -120 {shootTimer = -120}

//execution
if (place_meeting(x, y, objEnemyKnockout)) and (keyboard_check_pressed(vk_space))
{
	lastX = x;
	lastY = y;
	state = 3;
}

#region player animation & leg drawing
if (moveX != 0) or (moveY != 0) and (canMove = true)
	{
	if (image_speed > 0.1)
		{legIndex += 0.3;}
	if attacking = 0
		{image_speed = accel*3;}
	}
	else
	{
		legIndex = 0;
		if attacking = 0
			{image_speed = 0;}
	}
#endregion

//mask alignment
if mask != noone{scrMaskAlignment();}

switch(state)
{
	case 0: PUnarmed(); break; //unarmed
	case 1: PFirearm(); break; //guns
	case 2: PMelee(); break; //melee
	case 3: PKill(); break; //execution
	case 4: PDead(); break; //dead
	//etc.
	default: break;
}

//state machine (state dictated by sprite index) (apply to enemies as well?)
switch (weapon)
{
	case "unarmed": state = 0; break;
	//guns
	case "Silencer":
	case "Pistol":
	case "Skorpion":
	case "Shotgun":
	case "Spas12":
	case "DoubleBarrel":
	case "M16":
	case "AK47":
	case "MP5":
	case "Magnum": state = 1; break;
	//melee
	case "Club": state = 2; break;
}
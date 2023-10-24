move_bounce_all(false);
speed *= 0.4;
audio_play_sound(sndDoorHit, 10, false)
other.direction = direction;

var _knockout = instance_create_layer(other.x, other.y, "body_layer", objEMafiaKnockout);
_knockout.image_angle = other.direction;
_knockout.speed = 2*objPlayer.playerStr;

with other
{
	if weapon != "unarmed" {scrDropWeapon(1, currentAmmo);}
	instance_destroy();
}
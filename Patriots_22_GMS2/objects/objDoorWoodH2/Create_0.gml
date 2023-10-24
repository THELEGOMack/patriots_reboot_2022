swingspeed=0
y+=5
swinger=0

event_inherited();

SaveState = function(buf)
{
	buffer_write(buf, buffer_f16, image_angle);
}

LoadState = function(buf)
{
	image_angle = buffer_read(buf, buffer_f16);
}
if instance_exists(objPlayer) {getTarget = objPlayer}

if _enabled = true
{
	x = getTarget.x - (image_xscale*0.5);
	y = getTarget.y - (image_yscale*0.5);
	xMovement = x - xprevious;
	yMovement = y - yprevious;
}
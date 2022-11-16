//mask menu locking
if instance_exists(self)
{
	with objPlayer
	{
		canLook = false;
		canMove = false;
		canShoot = false;
		image_index = 0;
	}
}

//destruction key (testing)
if (keyboard_check_pressed(ord("M")))
{
	instance_destroy();
}
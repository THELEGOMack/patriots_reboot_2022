//mask menu locking
if instance_exists(objPlayer)
{
	with objPlayer
	{
		canLook = false;
		canMove = false;
		canShoot = false;
		image_index = 0;
	}
}

if instance_exists(objEnemy)
{
	with objEnemy
	{
		aggroTimer = 0;
	}
}

//destruction key (testing)
if (keyboard_check_pressed(ord("M")))
{
	instance_destroy();
}
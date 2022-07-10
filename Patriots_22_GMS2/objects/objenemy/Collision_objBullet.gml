bullets += 1;
hp -= objPlayer.damage;
if objPlayer.piercing = false
	{
	instance_destroy(other);
	}
if hp <= 0
	{
	instance_destroy();
	}

//varying body angles
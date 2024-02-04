function PKill(){
	var _body = instance_nearest(x, y, objEnemyKnockout)
	_body.visible = false;
	
	//initialize & freeze player (MAKE SURE THEY CAN'T INTERACT WITH ITEMS)
	canMove = 0;
	canShoot = 0;
	canLook = 0;
	image_index = 0;
	visible = false;
	x = _body.x;
	y = _body.y;
	
	if ((weapon = "Silencer") or (weapon = "Skorpion") or (weapon = "MP5") or (weapon = "Pistol")) and (ammoPlayer <= 0)
	{
		scrDropWeapon(0, ammoPlayer);
		sprite_index = sprWalkUnarmed;
		weapon = "unarmed";
	}
	
	with objPlayerAdrian
	{
		if (weapon = "unarmed")
		{
			var _player = instance_create_depth(_body.x, _body.y, depth, objAdrianKillUnarmed);
			_player.image_angle = _body.image_angle;
			_player.image_speed = 1.5;
			
			var _kill = instance_create_depth(_body.x, _body.y, depth, objMafiaDieAdrian);
			_kill.image_angle = _body.image_angle;
			_kill.image_speed = 1.5;
		}
		if (weapon = "Shotgun") or (weapon = "Spas12") or (weapon = "M16") or (weapon = "DoubleBarrel") or (weapon = "AK47")
		{
			var _player = instance_create_depth(_body.x, _body.y, depth, objAdrianKillGunBash);
			_player.image_angle = _body.image_angle;
			_player.image_speed = 1.5;
			
			var _kill = instance_create_depth(_body.x, _body.y, depth, objMafiaDieGunBash);
			_kill.image_angle = _body.image_angle;
			_kill.image_speed = 0;
		}
		if ((weapon = "Silencer") or (weapon = "Skorpion") or (weapon = "MP5") or (weapon = "Pistol")) //and (ammoPlayer > 0)
		{
			var _player = instance_create_depth(_body.x, _body.y, depth, objAdrianKillHandgun);
			_player.image_angle = _body.image_angle;
			_player.image_speed = 2;
			ammoPlayer -= 1;
			
			var _kill = instance_create_depth(_body.x, _body.y, depth, objMafiaDiePistol);
			_kill.image_angle = _body.image_angle;
			_kill.image_speed = 0;
		}
	}
	
	with objPlayerViewCenter1
	{
		x = objPlayer.x;
		y = objPlayer.y;
	}
	
	with _body instance_destroy();
}
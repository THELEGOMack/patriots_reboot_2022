function PUnarmed(){
sprite_index = sprPlayerWalkUnarmed;
weapon = noone;
shootTimer = 0;
scrWeaponPickup();

if mouse_check_button_pressed(mb_left) and (attacking = false) and (canShoot = true)
{
	scrPlayerPunch();
	attacking = false;
}

//unarmed execution
//crosshair
}
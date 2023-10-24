function PUnarmed(){
scrWeaponPickup();
if canShoot = false {shootTimer = 99}

if mouse_check_button(mb_left) and (shootTimer <= 0)
{
	scrPlayerPunch();
}

//crosshair
}
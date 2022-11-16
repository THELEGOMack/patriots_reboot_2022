function PFirearm(){
scrWeaponThrow();
scrWeaponPickup();
weaponValues();
shootTimer--;
if shootTimer < -120 {shootTimer = -120}

if mouse_check_button(mb_left) and (shootTimer <= 0) and (ammoPlayer > 0)
{
	Shoot();
}

//weapon auto/semi functionality; distinction between mouse_check_button and mouse_check_button_pressed
}
function PFirearm(){
scrWeaponThrow();
scrWeaponPickup();

if auto = true
{
	if mouse_check_button(mb_left) and (shootTimer <= 0) and (ammoPlayer > 0)
	{
		scrPAttack();
		alarm[1] = shootTimer; //< is this the value I want to use for this?
	}
}
else if auto = false
{
	if mouse_check_button_pressed(mb_left) and (shootTimer <= 0) and (ammoPlayer > 0)
	{
		scrPAttack();
		alarm[1] = shootTimer;
	}
}

}
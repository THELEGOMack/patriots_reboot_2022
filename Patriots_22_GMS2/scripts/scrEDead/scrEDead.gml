function scrEDead(){
	scrCreateCorpse();
	if weapon != "unarmed" {scrDropWeapon(0.3, currentAmmo)}
	instance_destroy();
}
function scrEDead(){
	scrCreateCorpse();
	if weapon != "unarmed" {scrDropWeapon(random_range(0.3, 0.5), currentAmmo)}
	instance_destroy();
}
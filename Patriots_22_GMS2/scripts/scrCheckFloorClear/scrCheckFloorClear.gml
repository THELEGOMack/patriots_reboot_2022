function scrCheckFloorClear(){
if instance_exists(objPlayer){
	if objPlayer.state != 4{
		if instance_number(objEnemy) + instance_number(objEnemyKnockout) + instance_number(objEnemyKill) + instance_number(objEBullet) <= 0 {
			return true;
			} else {
				return false;
			}
		}
	exit;}
}
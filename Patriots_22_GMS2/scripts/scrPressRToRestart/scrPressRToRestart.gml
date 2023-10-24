function scrPressRToRestart(){

function respawn()
{
	if instance_exists(objPlayer){
		with objPlayer
		{
			global.tempLoad();
			image_index = 0;
			deathCount++;
		}
		with objEffector
		{
			fadeAlpha = 1;
			image_alpha = 1;
			alarm[0] = 5;
			x = objPlayer.x + lengthdir_x(12, objSpawnPoint.direction);
			y = objPlayer.y + lengthdir_y(12, objSpawnPoint.direction);
		}
		with objCamera
		{smooth = 1;
		alarm[0] = 5;}
	}
}

if instance_exists(objEnemyDead) {instance_destroy(objEnemyDead);}
if instance_exists(objBloodParent) {instance_destroy(objBloodParent);}
if instance_exists(objBloodPool) {instance_destroy(objBloodPool);}
if instance_exists(objShell) {instance_destroy(objShell);}
if instance_exists(objMaskDrop) {instance_destroy(objMaskDrop);}
if instance_exists(objPlayerDead) {instance_destroy(objPlayerDead);}
if instance_exists(objWeaponThrow) {instance_destroy(objWeaponThrow);}
if instance_exists(objItemDrop) {instance_destroy(objItemDrop);}
if instance_exists(objEnemyKnockout) {instance_destroy(objEnemyKnockout);}
if instance_exists(objEnemyKill) {instance_destroy(objEnemyKill);}
if instance_exists(objEBullet) {instance_destroy(objEBullet);}
if instance_exists(objBulletParent) {instance_destroy(objBulletParent);}


//these surfaces may or may not be cleared! Loop to ensure successful deletion?
surface_free(objBloodSurface.surface);
surface_free(objBodySurface.surface);

respawn();
with objEnemy {
	currentAmmo = startingAmmo;
	scrGetWeapon();
	}
if global.voidActive = false {scrVoidEnable()}
global.playerDead = false;
//global.gunshotHeard = false;
exit;
}
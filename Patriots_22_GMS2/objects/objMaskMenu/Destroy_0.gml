with objPlayer
{
	canLook = true;
	canMove = true;
	canShoot = true;
	shootTimer = 0; //or however long the player's loadup animation takes
	image_index = 0;
	//set mask BEFORE save (below)
	alarm[2] = 1;
}
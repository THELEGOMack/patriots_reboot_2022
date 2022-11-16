function scrPlayerCharacter(){
//player character values
switch (global.playerCharacter)
	{
	case 0: //Samuel
		sprite_index = sprSamWalkUnarmed;
		playerLegs = sprSamLegs
        playerStr = 1.0
		walkSpeed = 3
		hp = 2;
		#region sprites
		sprPlayerWalkUnarmed = sprSamWalkUnarmed;
		sprPlayerWalkAK47 = sprSamWalkAK47;
		sprPlayerWalkM16 = sprSamWalkM16;
		sprPlayerWalkShotgun = sprSamWalkShotgun;
		sprPlayerWalkSilencer = sprSamWalkSilencer;
		sprPlayerWalkMP5 = sprSamWalkMP5;
		sprPlayerWalkDoubleBarrel = sprSamWalkDoubleBarrel;
		sprPlayerWalkMagnum = sprSamWalkMagnum;
		#endregion
		break;
	case 1: //Adrian
		sprite_index = sprAdrianWalkUnarmed;
		playerLegs = sprAdrianLegs
        playerStr = 1.0
		walkSpeed = 3
		hp = 2;
		
		//unique weapon origin values
		switch(weapon)
			{
			case "Silencer":
				shellSource = 14;
				barrelLength = 28;
				break;
			default: break;
			}
		#region sprites
		sprPlayerWalkUnarmed = sprAdrianWalkUnarmed;
		sprPlayerAttackUnarmed = sprAdrianAttackUnarmed;
		
		sprPlayerWalkSilencer = sprAdrianWalkSilencer;
		sprPlayerWalkShotgun = sprAdrianWalkShotgun;
		sprPlayerWalkM16 = sprAdrianWalkM16;
		sprPlayerWalkAK47 = sprAdrianWalkAK47;
		sprPlayerWalkMagnum = sprAdrianWalkMagnum;
		
		sprPlayerWalkClub = sprAdrianWalkClub;
		#endregion
		break;
	case 3: //Valerie
		sprite_index = sprValWalkUnarmed;
		playerLegs = sprValLegs
        playerStr = 0.8
		walkSpeed = 3.5
		hp = 2;
		
		//unique weapon origin values
		#region sprites
		sprPlayerWalkUnarmed = sprValWalkUnarmed;
		sprPlayerWalkAK47 = sprValWalkAK47;
		sprPlayerWalkM16 = sprValWalkM16;
		sprPlayerWalkShotgun = sprValWalkShotgun;
		sprPlayerWalkSilencer = sprValWalkSilencer;
		//sprPlayerWalkMP5 = sprValWalkMP5;
		//sprPlayerWalkDoubleBarrel = sprValWalkDoubleBarrel;
		//sprPlayerWalkMagnum = sprValWalkMagnum;
		#endregion
		break;
	//additional characters
	default: break;
	}
}
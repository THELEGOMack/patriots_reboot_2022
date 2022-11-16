function ELookForWeapon(){
stateTXT = "look for weapon"
	//behavior
		//look for weapon in immediate vicinity
			//if found, check its sprite_index
				//if a mafia-compatible weapon, determine whether ammo is -1, 0, or more
					//if not 0, go to weapon
						//pick up weapon, update sprite, ammo count, etc.
	//transition trigger(s)
		//when weapon is picked up, return to "alert" state
}
function scrEAggro(){
	//weapon type check
	lineColor = c_red;
	
	switch (weaponType) {
	    case "gun": state = "aiming"; break;
	    default: break;
	}
}
function scrLoadLevel(level){
	switch (level) {
	    case "menuMain":
				global.cameraZoom = 0;
				//set drop shadow with script
				scrLocaleSet(0);
				audio_stop_all(); //music
				room_goto(rmTitle);
			break;
		case "penthouse":
				global.cameraZoom = 1;
				scrLocaleSet(0);
				scrPlayMusic(musVClub, 0);
				room_goto(rmAdrianPenthouse2);
			break;
		case "samGarage":
				global.cameraZoom = 0;
				scrLocaleSet(0);
				scrPlayMusic(musTerminal, 0);
				room_goto(rmSamGarage);
			break;
		case "samApartment":
				global.cameraZoom = 1;
				scrLocaleSet(0);
				scrPlayMusic(musTerminal, 0);
				room_goto(rmMania_int_F1);
			break;
		case "vetGarage":
				global.cameraZoom = 1;
				scrLocaleSet(2);
				audio_stop_all(); //music
				room_goto(rmVetGarage);
			break;
		case "vanguard":
				global.cameraZoom = 0;
				scrLocaleSet(0);
				scrPlayMusic(musTheWatch, 0);
				room_goto(rmLaundry);
			break;
		case "villa":
				global.cameraZoom = 0;
				scrLocaleSet(1);
				audio_stop_all(); //music
				room_goto(rmVillaGate);
			break;
		case "vegasMeth":
				global.cameraZoom = 0;
				scrLocaleSet(2);
				scrPlayMusic(musGarbageDay, 0)
				room_goto(rmVegasMeth1);
			break;
		case "enemyTest":
				global.cameraZoom = 0;
				scrLocaleSet(0);
				audio_stop_all(); //music
				room_goto(rmEnemyTesting);
			break;
		case "transitionTest":
				global.cameraZoom = 0;
				scrLocaleSet(0);
				scrPlayMusic(musTerminal, 0);
				room_goto(rmTRANSITIONTEST);
			break;
		case "bathHouse":
				global.cameraZoom = 0;
				scrLocaleSet(2);
				audio_stop_all(); //music
				room_goto(rmBathhouse1);
			break;
	    default:
	        break;
	}
}
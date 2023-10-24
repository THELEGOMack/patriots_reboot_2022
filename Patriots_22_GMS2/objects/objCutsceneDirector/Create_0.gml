//created when first spawning into room
switch (scene) {
    case "cts_demo_penthouse":
			music = musVClub;
			titleCard = true;
			pCanMove = true;
			pCanLook = true;
			pCanShoot = false;
			
			date = [5, 14, "PM", 25, "FEB", 1989]
			place = ["Miami", "Florida"]
        break;
    default:
        // code here
        break;
}




if titleCard = true
{
	var card = instance_create_depth(display_get_width()/2, display_get_height()/2, -10000, objTitleCard);
	card.hour = date[0];
	card.minute = date[1];
	card.ampm = date[2];
	card.day = date[3];
	card.month = date[4];
	card.year = date[5];
	card.city = place[0];
	card.state = place[1];


}

//start music
audio_play_sound(music, 1000, true);

//unfreeze player after title card
alarm[0] = 60;
//initial room startup
done = false;
fadeAlpha = 1;
fadeOut = 0; //boolean that controls which "direction" fadeOut goes in (i.e., either fading in or out)
//when both of the above values are 1, trigger "end" event

//strings
str = "";
print = "";

//check whether the player holds RMB for 1.5 seconds
holdRMB = 0;

//initialize
objCamera.smooth = 1;
objPlayer.x = 407;
objPlayer.y = 256;
//objPlayer.image_angle = 90;
//objPlayer.sprite_index = sprSamKnock;
//objPlayer.image_speed = 0;
objPlayer.canLook = false;
objPlayer.canMove = false;
objPlayer.visible = false;
objCursor.visible = false;
objCamera.follow.x = objPlayer.x;
objCamera.follow.y = objPlayer.y;
inst_6359ECAB.broken = 0;
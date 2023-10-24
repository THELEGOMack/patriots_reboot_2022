if abs(swingspeed)>0 {
image_angle+=swingspeed
if place_meeting(x,y,objFurniture) {
image_angle-=swingspeed
swingspeed*=-0.5
}
if place_meeting(x,y,objWallV) {
image_angle-=swingspeed
swingspeed*=-0.5
}
if place_meeting(x,y,objBrickWallV) {
image_angle-=swingspeed
swingspeed*=-0.5
}
if image_angle<-135 {image_angle=-135 swingspeed=abs(swingspeed)}
if image_angle>135 {image_angle=135 swingspeed=-abs(swingspeed)}
swingdir=sign(swingspeed)
if abs(swingspeed)<3.5 {
if image_angle>-6 and image_angle<6 {swingspeed=0 image_angle=0 audio_play_sound(sndDoorClose, 100, false) exit}
}

if swingspeed>0.25 swingspeed-=0.25 else {
if swingspeed<0 swingspeed+=0.25 else {swinger=0 swingspeed=0}
}
}
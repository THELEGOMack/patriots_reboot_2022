swinger=1
if abs(swingspeed)>3.5 exit
if abs(swingspeed)<2 audio_play_sound(sndDoorOpen, 100, false)
if y>other.y and other.x<x {swingspeed=-8 exit}
if y>other.y and other.x>x {swingspeed=8 exit}
if other.x<x+lengthdir_x(32,image_angle+270) swingspeed=-8 else swingspeed=8
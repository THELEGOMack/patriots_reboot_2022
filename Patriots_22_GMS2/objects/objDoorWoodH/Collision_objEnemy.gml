swinger=2
if abs(swingspeed)<2 audio_play_sound(sndDoorOpen, 100, false)
if x<other.x and other.y<y {swingspeed=-7 exit}
if x<other.x and other.y>y {swingspeed=7 exit}
if other.y<y+lengthdir_y(32,image_angle-180) swingspeed=-7 else swingspeed=7
function scrPlayerPunch(){
sprite_index = sprPlayerAttackUnarmed;
image_index = 0;
image_speed = 1;
audio_play_sound(choose(sndSwing1, sndSwing2), 10, false);
attacking = 1;
image_yscale *= -1;
//scrPlayerAnimEnd();
}
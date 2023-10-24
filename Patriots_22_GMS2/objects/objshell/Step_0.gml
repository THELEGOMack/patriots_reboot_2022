if (startSpeed = 0.1) and (speed > 0)
    {
    image_blend = merge_color(c_ltgray, c_white, speed*(1/startSpeed))
    image_angle += spin
    }

if friction < 2
    {
    friction =+ 0.5;
    }
	
if (speed = 0) and (bounce > 0) {sound = true}

if (sound = true)
    {
	 if (image_index = 2)
        {
        audio_play_sound(choose(sndShellPistol1, sndShellPistol2, sndShellPistol3), 5, false);
        sound = true;
        }
    if (image_index = 1)
        {
        audio_play_sound(choose(sndShellRifle1, sndShellRifle2, sndShellRifle3), 5, false);
        sound = true;
        }
    else if (image_index = 0)
        {
        audio_play_sound(choose(sndShellShotgun1, sndShellShotgun2, sndShellShotgun3), 5, false);
        sound = true;
        }
	sound = false;
	bounce =- 1;
    }

//if (bounce > 0) {}

if (speed = 0) and (bounce = 0)
    {
    spin = 0;
    done = true;
	alarm[0] = 5;
    }
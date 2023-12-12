//flicker
timeCol1 = merge_color(timeCol, c_white, random_range(0, 0.25))

//fade after timer
if fade = 1 {bgFade -= 0.01}
if textFadeOut = 1 {textFade -= 0.05;}

if bgFade <= 0 {alarm[1] = 1}
if textFade <= 0 {instance_destroy();} 
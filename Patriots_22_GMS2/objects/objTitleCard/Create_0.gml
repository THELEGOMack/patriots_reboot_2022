if _pm = true {_am_pm = "PM"} else {_am_pm = "AM"}
_drawX = display_get_width()/2;
_drawY = display_get_height()/2;
timeCol1 = c_white;
timeCol2 = merge_color(timeCol, c_black, 0.85)
bgFade = 1;
textFade = 1;
lineSep = 40;
borderW = 4;
fade = 0;
textFadeOut = 0;
alarm[0] = 180;

if (_day = 1) or (_day = 21) or (_day = 31) {_suf = string("st")}
else if (_day = 2) or (_day = 22) {_suf = string("nd")}
else if (_day = 3) or (_day = 23) {_suf = string("rd")}
else {_suf = string("th")}
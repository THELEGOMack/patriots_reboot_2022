event_inherited();
walkDir = 0;
dir = 0;
switch (arrowSprite) {
    case "Interact": _spr = sprArrow; break;
    case "Go": _spr = sprGoArrowRight; goFact = 8; break;
    case "Gray": _spr = sprArrowGray; break;
    case "GoRus": _spr = sprPlayerClip; break; //placeholder sprite
}
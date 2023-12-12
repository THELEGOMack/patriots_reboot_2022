event_inherited();
walkDir = 180;
switch (arrowSprite) {
    case "Interact": dir = 180; _spr = sprArrow; break;
    case "Go": dir = 0; _spr = sprGoArrowLeft; goFact = 8; break;
    case "Gray": dir = 180; _spr = sprArrowGray; break;
    case "GoRus": dir = 180; _spr = sprPlayerClip; break; //placeholder sprite
}
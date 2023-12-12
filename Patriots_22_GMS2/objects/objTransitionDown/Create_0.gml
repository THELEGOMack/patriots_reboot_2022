event_inherited();
walkDir = 270;
switch (arrowSprite) {
    case "Interact": dir = 270; _spr = sprArrow; break;
    case "Go": dir = 0; _spr = sprGoArrowDown; goFact = 8; break;
    case "Gray": dir = 270; _spr = sprArrowGray; break;
    case "GoRus": dir = 270; _spr = sprPlayerClip; break; //placeholder sprite
}
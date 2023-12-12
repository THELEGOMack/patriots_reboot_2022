event_inherited();
walkDir = 90;
switch (arrowSprite) {
    case "Interact": dir = 90; _spr = sprArrow; break;
    case "Go": dir = 0; _spr = sprGoArrowUp; goFact = 8; break;
    case "Gray": dir = 90; _spr = sprArrowGray; break;
    case "GoRus": dir = 90; _spr = sprPlayerClip; break; //placeholder sprite
}
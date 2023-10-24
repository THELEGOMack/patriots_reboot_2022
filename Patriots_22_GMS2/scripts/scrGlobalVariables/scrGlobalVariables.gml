// All global variables will be established here.
function scrGlobalVariables(){
global.debug = false;
global.version = string("DEMO 0.1.0.0")
//global.viewDistance = 180;
global.timescale = 1;
global.playerDead = false;
//global.gunshotHeard = 0;
global.voidDir = random(1000);
global.voidActive = false;

global.shadowHue = c_black;
global.shadowAlpha = 0.5;
global.shadowDirX = 1; //1 & 1 is down-right, etc.
global.shadowDirY = 1;

global.bloodColor = -1;
global.wpnSpriteMod = 0;
//global.comboFlash = 0;

global.levelClear = false;
global.playerInBounds = false; //whether the player is "inside" of a combat floor

scrTempSave();
scrTempLoad();
}
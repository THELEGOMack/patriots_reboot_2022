// All global variables will be defined here.
function scrGlobalVariables(){
global.debug = false;
global.version = string("DEMO 0.1.0.0")
global.timescale = 1;
global.musicVolume = 1.0;

//camera
global.cameraZoom = 0; //default zoom level

//global.viewDistance = 180;
global.playerDead = false;
//global.gunshotHeard = 0;
global.voidDir = random(1000);
global.voidActive = false;

//drop shadows
global.shadowHue = c_black;
global.shadowAlpha = 0.5;
global.shadowDirX = 1; //1 & 1 is down-right, etc.
global.shadowDirY = 1;

global.bloodColor = -1;
global.wpnSpriteMod = 0;
//global.comboFlash = 0;

//player checks
global.levelClear = false;
global.playerInBounds = false; //whether the player is "inside" of a combat floor

//establish save/load functions
scrTempSave();
scrTempLoad();
}
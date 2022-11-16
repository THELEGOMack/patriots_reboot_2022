function scrCutsceneAddAnim(){
/// @arg Cutscene
/// @arg Actor
/// @arg aType
/// @arg [data]

//args
var _cts = argument[0];
var _actor = argument[1];
var _aType = argument[2];
var _data = argument[3];

//array length
var length = array_length_2d(global.ctsAnims, _cts);

//add
global.ctsAnims[_cts, length] = [_actor, _aType, _data];
}
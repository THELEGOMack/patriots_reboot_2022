global.ctsPos = -1;
global.ctsType = -1;

global.ctsAnims = [];

//cutscenes
enum cts
{
	test
}

enum animType
{
	walkTo
}

//cutscene: test
scrCutsceneAddAnim(cts.test, objNPC, animType.walkTo, [64, 0]);
scrCutsceneAddAnim(cts.test, objNPC, animType.walkTo, [64, 90]);

//cutscene: start
scrCutsceneStart(cts.test);
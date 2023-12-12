//get input
var confirm =  mouse_check_button_pressed(confirmKey);

//type out text
textProgress = min(textProgress + textSpeed, textLength);

//finished typing?
if (textProgress == textLength){
	if (confirm){next();}
}
else if (confirm) {textProgress = textLength;}
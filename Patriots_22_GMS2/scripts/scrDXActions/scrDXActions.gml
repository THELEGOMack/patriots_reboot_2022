#macro TEXT new textAction

//template
function dialogueAction() constructor {
	act = function() { };
}

//define new text to type out
function textAction(_text) : dialogueAction() constructor {
	text = _text;
	
	act = function(textbox) {
		textbox.setText(text);
	}
}
//the one function that needs to be called manually -- creates a text box and starts a conversation
//@param topic - What topic the dialogue box should use
function startDialogue(topic) {
	if (instance_exists(objDXTextBox))
		return;
		
	var inst = instance_create_depth(x, y, -9999, objDXTextBox);
	inst.setTopic(topic);
}

function type(x, y, text, progress, width){
	var drawX = 0;
	var drawY = 0;
	
	for (var i = 1; i <= progress; i++) {
		var char = string_char_at(text, i);
		
		//handle normal line breaks
		if (char == "\n") {
			drawX = 0;
			drawY += string_height("A");
		}
		//if we're starting a new word, we can line break
		else if (char = " ") {
			drawX += string_width(char);
			
			var wordWidth = 0;
			for (var ii = i + 1; ii <= string_length(text); ii++) {
				var wordChar = string_char_at(text, ii);
				
				//if we reached the end of a word, stop checking
				if (wordChar == "\n" || wordChar == " ")
					break;
					
				//if the current word extends past the width boundary, then move it to the next line
				wordWidth += string_width(wordChar);
				if (drawX + wordWidth > width){
					drawX = 0;
					drawY += string_height("A");
					break;
				}
			}
		} else {
			//draw the letter
			draw_text(x + drawX, y + drawY, char);
			drawX += string_width(char);
		}
	}
}
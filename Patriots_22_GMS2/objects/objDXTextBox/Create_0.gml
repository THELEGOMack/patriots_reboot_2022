//source: https://www.youtube.com/watch?v=P79MXZ4SsIg
//part 2: https://www.youtube.com/watch?v=dZSXvX2aY_E
//part 3: https://www.youtube.com/watch?v=RejoI7oe4wE

//customizable variables
	//input
	confirmKey = mb_left;
	
	//position
	margin = 0;
	padding = 24;
	width = display_get_gui_width() - margin*2;
	height = sprite_height*12;
	x = (display_get_gui_width() - width) / 2;
	y = display_get_gui_height() - height - margin;
	
	//text
	textFont = fntDialogue;
	textColor = c_white;
	textSpeed = 0.6;
	textX = padding;
	textY = padding;
	textWidth = width - padding * 2;
	
//internal variables
	actions = [];
	currentAction = -1;
	text = "";
	textProgress = 0;
	textLength = 0;
	
//Methods
	//start a conversation
	setTopic = function(topic){
		actions = global.topics[$ topic];
		currentAction = -1;
		
		next();
	}
	
	//move to next action
	next = function(){
		currentAction++;
		if (currentAction >= array_length(actions)) {
			instance_destroy();
		} else {
			actions[currentAction].act(id);
		}
	}
	
	//set the text to be typed out
	setText = function(newText) {
		text = newText;
		textLength = string_length(newText);
		textProgress = 0;
	}
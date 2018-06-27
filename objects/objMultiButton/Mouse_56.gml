if (over) {
	PlayUISound(sndButtonClick);	
	objMap.tool = TOOL.NONE;
	clicked = !clicked;
} else {
	clicked = false;	
}
if (over) {
	PlayUISound(sndButtonClick);
	objMap.tool = objMap.tool == tool ? TOOL.NONE : tool;
	if (objMap.tool == tool) {
		event_user(0);	
	}
}
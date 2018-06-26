if (over) {
	PlayUISound(sndButtonClick);
	objMap.tool = objMap.tool == tool ? TOOL.NONE : tool;
}
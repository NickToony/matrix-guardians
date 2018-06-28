if (!gateway && !global.mouse_over_ui && objMap.tool == TOOL.NONE) {
	// pickup
	pickedup = true;
	ClearTasks();
	state = STATE.IDLE;
	task = TASK.IDLE;
}
if (global.mouse_over_ui) { return; }

switch (tool) {
	case TOOL.DIG: 
	case TOOL.STORAGE:
	case TOOL.REMOVE:
		selecting = true;
		selectionRefresh = 0;
		mx = objCamera.mouseTileX;
		my = objCamera.mouseTileY;
		break;

}
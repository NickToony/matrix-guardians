if (global.mouse_over_ui) { return; }

switch (tool) {
	case TOOL.DIG: 
	case TOOL.STORAGE:
	case TOOL.BUILD:
	case TOOL.CHARGE:
	case TOOL.CANCEL:
	case TOOL.REMOVE:
	case TOOL.ASSEMBLY:
	case TOOL.ARCHIVE:
		selecting = true;
		selectionRefresh = 0;
		mx = objCamera.mouseTileX;
		my = objCamera.mouseTileY;
		break;
		
	default:
		selection = noone;
		break;

}
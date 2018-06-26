if (selecting) {
	if (selectionRefresh <= 0) {
		RecalcSelection();
		selectionRefresh = SELECTION_RATE;
	}
	selectionRefresh -= 1;
	
	DrawSelection(selection, selectionValid ? c_green : c_red);
} else {
	
	switch (tool) {
		case TOOL.DIG:
		case TOOL.STORAGE:
		case TOOL.REMOVE:
			var xx = WorldX(objCamera.mouseTileX, objCamera.mouseTileY);
			var yy = WorldY(objCamera.mouseTileX, objCamera.mouseTileY);
			draw_sprite_ext(sprBlock, 0, xx, yy, 1, 1, 0, c_green, 0.3);
			break;
	}
	
}
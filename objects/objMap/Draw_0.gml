if (selecting) {
	if (selectionRefresh <= 0) {
		selection = CalculateRegion(mx, my, objCamera.mouseTileX, objCamera.mouseTileY, SELECTION_RANGE);
		selectionRefresh = SELECTION_RATE;
	}
	selectionRefresh -= 1;
	
	DrawSelection(selection, c_green);
} else {
	
	switch (tool) {
		case TOOL.DIG:
			var xx = WorldX(objCamera.mouseTileX, objCamera.mouseTileY);
			var yy = WorldY(objCamera.mouseTileX, objCamera.mouseTileY);
			draw_sprite_ext(sprBlock, 0, xx, yy, 1, 1, 0, c_green, 0.3);
			break;
	}
	
}
if (selecting) {
	if (selectionRefresh <= 0) {
		selection = CalculateRegion(mx, my, objCamera.mouseTileX, objCamera.mouseTileY, SELECTION_RANGE);
		selectionRefresh = SELECTION_RATE;
	}
	selectionRefresh -= 1;
	
	DrawSelection(selection, c_green);
}
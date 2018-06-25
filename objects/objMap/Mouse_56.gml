if (selecting) {
	selecting = false;
	// update selection
	selection = CalculateRegion(mx, my, objCamera.mouseTileX, objCamera.mouseTileY, SELECTION_RANGE);
	if (selection != noone) {
		var arr = RegionToArray(selection);
		for (var i = 0; i < array_length_1d(arr); i ++) {
			var tile = arr[i];
			var tileX = tile[0];
			var tileY = tile[1];
	
			AddDigTask(tileX, tileY);
		}
	}
}
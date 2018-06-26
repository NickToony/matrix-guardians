selection = CalculateRegion(mx, my, objCamera.mouseTileX, objCamera.mouseTileY, SELECTION_RANGE);

if (selection == noone) {
	selectionValid = false;
	return;
}
		
		
switch (tool) {
	case TOOL.STORAGE:
		selectionValid = true;
		var arr = RegionToArray(selection);
		for (var i = 0; i < array_length_1d(arr); i ++) {
			var tile = arr[i];
			var tileX = tile[0];
			var tileY = tile[1];
			tile = GetTile(tileX, tileY);
	
			if (tile == noone || tile.object_index != objFloorTile) {
				selectionValid = false;
			}
		}
	break;
		
	default:
		selectionValid = true;
		break;
}
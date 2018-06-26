if (!selecting) { return; };

selecting = false;

// update selection
RecalcSelection();
if (selection != noone && selectionValid) {
	var arr = RegionToArray(selection);
	
	switch (tool) {
		case TOOL.DIG:
			for (var i = 0; i < array_length_1d(arr); i ++) {
				var tile = arr[i];
				var tileX = tile[0];
				var tileY = tile[1];
	
				AddDigTask(tileX, tileY);
			}
			PlayUISound(sndPlaceRoom);	
			break;
			
		case TOOL.STORAGE:
			for (var i = 0; i < array_length_1d(arr); i ++) {
				var tile = arr[i];
				var tileX = tile[0];
				var tileY = tile[1];
	
				SetTileRoom(tileX, tileY, ROOM.STORAGE, sprFloorStorage);
			}
			PlayUISound(sndPlaceRoom);	
			break;
			
		case TOOL.REMOVE:
			for (var i = 0; i < array_length_1d(arr); i ++) {
				var tile = arr[i];
				var tileX = tile[0];
				var tileY = tile[1];
	
				SetTileRoom(tileX, tileY, ROOM.NONE, noone);
			}
			PlayUISound(sndFailed);	
			break;
	}
} else {
	PlayUISound(sndFailed);	
}
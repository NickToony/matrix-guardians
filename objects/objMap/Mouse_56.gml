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
		case TOOL.CHARGE:
			for (var i = 0; i < array_length_1d(arr); i ++) {
				var tile = arr[i];
				var tileX = tile[0];
				var tileY = tile[1];
	
				switch (tool) {
					case TOOL.STORAGE:
					SetTileRoom(tileX, tileY, ROOM.STORAGE, sprFloorStorage);
					break;
					
					case TOOL.CHARGE:
					SetTileRoom(tileX, tileY, ROOM.CHARGING, sprFloorCharging);
					break;
				}
				
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
			
		case TOOL.BUILD:
			for (var i = 0; i < array_length_1d(arr); i ++) {
				var tile = arr[i];
				var tileX = tile[0];
				var tileY = tile[1];
	
				AddBuildTask(tileX, tileY);
			}
			PlayUISound(sndPlaceRoom);	
			break;
			
		case TOOL.CANCEL: 
			for (var i = 0; i < array_length_1d(arr); i ++) {
				var tile = arr[i];
				var tileX = tile[0];
				var tileY = tile[1];
	
				CancelTasks(tileX, tileY);
			}
			PlayUISound(sndFailed);	
			break;
	}
} else {
	PlayUISound(sndFailed);	
}
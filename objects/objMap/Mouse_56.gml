if (!selecting) { return; };

selecting = false;

// update selection
RecalcSelection();
toolCost = GetToolCost(tool, selection);
if (toolCost > global.SPENDABLE_METALS) {
	selectionValid = false;
}
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
					SetTileRoom(tileX, tileY, ROOM.STORAGE);
					break;
					
					case TOOL.CHARGE:
					SetTileRoom(tileX, tileY, ROOM.CHARGING);
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
	
				SetTileRoom(tileX, tileY, ROOM.NONE);
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
	
	var cost = toolCost;
	global.STORED_METALS -= cost;
	global.METALS -= cost;
	global.SPENDABLE_METALS -= cost;
	with (objMetals) {
		if (stored && metals > 0 && cost > 0) {
			var diff = min(metals, cost);
			metals -= diff;
			cost -= diff;
		}
	}
	
} else {
	PlayUISound(sndFailed);	
}
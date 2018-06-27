if (selecting) {
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
			case TOOL.ARCHIVE:
			case TOOL.ASSEMBLY:
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
						
						case TOOL.ASSEMBLY:
						SetTileRoom(tileX, tileY, ROOM.ASSEMBLY);
						break;
						
						case TOOL.ARCHIVE:
						SetTileRoom(tileX, tileY, ROOM.ARCHIVE);
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
	
		SpendMetals(toolCost);
	
	} 
} else {
	var valid = true;
	toolCost = GetToolCost(tool, noone);
	if (toolCost > global.SPENDABLE_METALS) {
		valid = false;
	}
	
	if (valid) {
		switch (tool) {
			case TOOL.SPAWN:
				var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
				if (tile != noone && !tile.solid && tile.connected) {
					SpendMetals(toolCost);	
					CreateUnit(tile.gridX, tile.gridY, objRoomba);
				}
			break;
			
			case TOOL.OVERCLOCK:
				var instance = instance_nearest(mouse_x, mouse_y, objUnit);
				valid = false;
				if (instance && point_distance(mouse_x, mouse_y, objUnit.x, objUnit.y) < 64) {
					valid = true;
				}
				instance.overclocked += room_speed * 15;
				
			break;
		
			default:
			if (tool != TOOL.NONE) {
				PlayUISound(sndFailed);
			}
			break;
		}
	}
}
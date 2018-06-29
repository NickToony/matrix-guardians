if (selecting) {
	selecting = false;

	// update selection
	RecalcSelection();
	toolCost = GetToolCost(tool, selection);
	if (toolCost > global.SPENDABLE_METALS) {
		selectionValid = false;
		ShowTip("Not enough metals in storage!");
		PlayUISound(sndFailed);	
	} else if (!selectionValid) {
		ShowTip("Invalid selection - make sure to place on tiles you've claimed!");	
		PlayUISound(sndFailed);	
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
	
					CancelTasks(tileX, tileY, false);
				}
				PlayUISound(sndFailed);	
				break;
		}
	
		SpendMetals(toolCost);
	
	} 
} else if (!global.mouse_over_ui) {
	var valid = true;
	toolCost = GetToolCost(tool, noone);
	if (toolCost > global.SPENDABLE_METALS) {
		valid = false;
		ShowTip("Not enough metals in storage!");	
	}
	
	if (valid) {
		switch (tool) {
			case TOOL.SPAWN:
				var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
				valid = false;
				if (tile != noone && !tile.solid && tile.connected) {
					CreateUnit(tile.gridX, tile.gridY, objRoomba);
					valid = true;
				} else {
					ShowTip("Invalid spot - make sure to place on empty tiles you've claimed!");	
				}
			break;
			
			case TOOL.OVERCLOCK:
				var instance = instance_nearest(mouse_x, mouse_y, objFriendlyUnit);
				valid = false;
				if (instance && point_distance(mouse_x, mouse_y, instance.x, instance.y) < 128) {
					valid = true;
					instance.overclocked += room_speed * 15;
				} else {
					ShowTip("Invalid spot - try clicking near your own bots!");	
				}
			break;
			
			case TOOL.GENERATOR:
				var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
				valid = tile != noone && tile.object_index == objLavaTile && tile.connected;
				if (valid) {
					with (objGenerator) {
						if (gridX == tile.gridX && gridY == tile.gridY) {
							valid = false;	
						}
					}
				}
				if (valid) {
					CreateBuilding(tile.gridX, tile.gridY, objGenerator, false);
				} else {
					ShowTip("Invalid spot - make sure to place on lava, next to tiles you've claimed!");	
				}
			break;
			
			case TOOL.TRAP:
				var tile = GetTile(objCamera.mouseTileX, objCamera.mouseTileY);
				valid = tile != noone && tile.object_index == objFloorTile && tile.connected && tile.roomType == ROOM.NONE;
				if (valid) {
					SetTile(tile.gridX, tile.gridY, objTileTrap);
				} else {
					ShowTip("Invalid spot - place on empty claimed tile!");		
				}
			break;
		
			default:
			//if (tool != TOOL.NONE) || {
				return; // tool is not valid for single click.
			//}
			break;
		}
	}
	
	if (!valid) {
		if (tool != TOOL.NONE) {
			PlayUISound(sndFailed);
		}
	} else {
		SpendMetals(toolCost);	
	}
}
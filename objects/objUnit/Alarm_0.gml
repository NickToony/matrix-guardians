alarm[0] = 10;

if (state == STATE.IDLE && task == TASK.IDLE) {
	// Check for dig tasks
	if (task == TASK.IDLE && !ds_list_empty(objMap.digTasks)) {
		for (var i = 0;	i < ds_list_size(objMap.digTasks); i ++) {
			var digTask = ds_list_find_value(objMap.digTasks, i);
			var tile = GetTile(digTask[0], digTask[1]);
			// if it's simply not possible
			if (tile == noone || !tile.diggable) {
				if (tile != noone) {
					tile.taskDig = false;	
				}
				ds_list_delete(objMap.digTasks, i);
			} else if (tile.accessible) {
				side = TaskSide(tile);
				if (side != noone) {
					if (PathFind(path, side.gridX, side.gridY)) {
						task = TASK.DIG;
						taskX = digTask[0];
						taskY = digTask[1];
						state = STATE.MOVING;
						pathIndex = 0;
					
						// Remove task
						ds_list_delete(objMap.digTasks, i);
						break;
					} else {
						tile.accessible = false;	
					}
				}
			}
		}
	}
	
	// Check for floor tasks
	if (task == TASK.IDLE && !ds_list_empty(objMap.floorTasks)) {
		for (var i = 0;	i < ds_list_size(objMap.floorTasks); i ++) {
			var floorTask = ds_list_find_value(objMap.floorTasks, i);
			var tile = GetTile(floorTask[0], floorTask[1]);
			// if it's simply not possible
			if (tile == noone || !tile.floorable) {
				if (tile != noone) {
					tile.floorTask = false;	
				}
				ds_list_delete(objMap.floorTasks, i);
			} else if (tile.accessible) {
				taskX = floorTask[0];
				taskY = floorTask[1];
				if (PathFind(path, taskX, taskY)) {
					task = TASK.FLOOR;
					state = STATE.MOVING;
					pathIndex = 0;
					
					// Remove task
					ds_list_delete(objMap.floorTasks, i);
					break;
				} else {
					tile.accessible = false;	
				}
			}
		}
	}
	
	
	// If STILL idle
	if (task == TASK.IDLE) {
		// Find a open spot
		var okay = false;
		var cell = noone;
		while (!okay) {
			cell = 	GetTile(irandom(objMap.mapWidth), irandom(objMap.mapHeight));
			if (cell != noone && !cell.solid) {
				okay = true;
			}
		}
		if (PathFind(path, cell.gridX, cell.gridY)) {
			state = STATE.MOVING;
			pathIndex = 0;
		}
	}
}
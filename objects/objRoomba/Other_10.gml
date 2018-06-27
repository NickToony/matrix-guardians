var currentX = UnworldX(x, y);
var currentY = UnworldY(x, y);
	

for (var ti = 0; ti < ds_list_size(myTasks); ti ++) {
	var taskId = ds_list_find_value(myTasks, ti);
	
	// Check for dig tasks
	if (taskId == TASK.DIG && task == TASK.IDLE && !ds_list_empty(objMap.digTasks)) {
		
		var priority = ds_priority_create();
		
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
				ds_priority_add(priority, i, point_distance(currentX, currentY, tile.gridX, tile.gridY));
			}
		}
		
		var done = false;
		while (!done && !ds_priority_empty(priority)) {
			var i = ds_priority_delete_min(priority);
			var digTask = ds_list_find_value(objMap.digTasks, i);
			var tile = GetTile(digTask[0], digTask[1]);
			taskX = tile.gridX;
			taskY = tile.gridY;
			path = APathFind(currentX, currentY, taskX, taskY, true);
			if (path != noone) {
				task = TASK.DIG;
				state = STATE.MOVING;
				taskTime = tile.digTime;
					
				// Remove task
				ds_list_delete(objMap.digTasks, i);
				done = true;
			} else {
				tile.accessible = false;	
			}
		}
		ds_priority_destroy(priority);
	}
	
	// Check for floor tasks
	if (taskId == TASK.FLOOR && task == TASK.IDLE && !ds_list_empty(objMap.floorTasks)) {
		
		var priority = ds_priority_create();
		
		for (var i = 0;	i < ds_list_size(objMap.floorTasks); i ++) {
			var floorTask = ds_list_find_value(objMap.floorTasks, i);
			var tile = GetTile(floorTask[0], floorTask[1]);
			// if it's simply not possible
			if (tile == noone || !tile.floorable) {
				if (tile != noone) {
					tile.floorTask = false;	
				}
				ds_list_delete(objMap.floorTasks, i);
			} else if (tile.accessible && tile.connected) {
				ds_priority_add(priority, i, point_distance(currentX, currentY, tile.gridX, tile.gridY));
			}
		}
		
		var done = false;
		while (!done && !ds_priority_empty(priority)) {
			var i = ds_priority_delete_min(priority);
			var floorTask = ds_list_find_value(objMap.floorTasks, i);
			var tile = GetTile(floorTask[0], floorTask[1]);
			taskX = tile.gridX;
			taskY = tile.gridY;
			path = APathFind(currentX, currentY, taskX, taskY, false);
			if (path != noone) {
				task = TASK.FLOOR;
				state = STATE.MOVING;
				taskTime = tile.floorTime;
					
				// Remove task
				ds_list_delete(objMap.floorTasks, i);
				done = true;
			} else {
				tile.accessible = false;	
			}
		}
		ds_priority_destroy(priority);
	}

	// Check for pickup tasks
	if (taskId == TASK.PICKUP && task == TASK.IDLE && !ds_list_empty(global.ROOMS[ROOM.STORAGE])) {
		var priority = ds_priority_create();
	
		with (objMetals) {
			if ((!stored || metals > MAX_METALS) && bot == noone) {
				ds_priority_add(priority, id, point_distance(currentX, currentY, gridX, gridY));
			}
		}
	
		if (global.METALS <= ds_list_size(global.ROOMS[ROOM.STORAGE]) * MAX_METALS) {
			var done = false;
			while (!done && !ds_priority_empty(priority)) {
				var obj = ds_priority_delete_min(priority);
				taskX = obj.gridX;
				taskY = obj.gridY;
				taskObj = obj;
				path = APathFind(currentX, currentY, taskX, taskY, false);
				if (path != noone) {
					task = TASK.PICKUP;
					state = STATE.MOVING;
					obj.bot = id;
					break;
				}
			}
		}
		ds_priority_destroy(priority);
	}
}

// Check for wall tasks
if (task == TASK.IDLE && !ds_list_empty(objMap.wallTasks)) {
	var priority = ds_priority_create();
		
	for (var i = 0;	i < ds_list_size(objMap.wallTasks); i ++) {
		var wallTask = ds_list_find_value(objMap.wallTasks, i);
		var tile = GetTile(wallTask[0], wallTask[1]);
		// if it's simply not possible
		if (tile == noone || !tile.wallable || tile.taskDig) {
			if (tile != noone) {
				tile.wallTask = false;	
			}
			ds_list_delete(objMap.wallTasks, i);
		} else if (tile.accessible && tile.connected) {
			ds_priority_add(priority, i, point_distance(currentX, currentY, tile.gridX, tile.gridY));
		}
	}
		
	var done = false;
	while (!done && !ds_priority_empty(priority)) {
		var i = ds_priority_delete_min(priority);
		var wallTask = ds_list_find_value(objMap.wallTasks, i);
		var tile = GetTile(wallTask[0], wallTask[1]);
		taskX = tile.gridX;
		taskY = tile.gridY;
		path = APathFind(currentX, currentY, taskX, taskY, true);
		if (path != noone) {
			task = TASK.WALL;
			state = STATE.MOVING;
			taskTime = tile.wallTime;
					
			// Remove task
			ds_list_delete(objMap.wallTasks, i);
			break;
		} else {
			tile.accessible = false;	
		}
	}
	ds_priority_destroy(priority);
}
if (state == STATE.TASK) {
	alarm[0] = 10;
} else {
	alarm[0] = room_speed;	
}

if (gateway) return;

if (state == STATE.IDLE && task == TASK.IDLE) {
	var currentX = UnworldX(x, y);
	var currentY = UnworldY(x, y);
	
	if (energy <= 10 && !ds_list_empty(global.ROOMS[ROOM.CHARGING])) {
		var priority = ds_priority_create();
		
		for (var i = 0;	i < ds_list_size(global.ROOMS[ROOM.CHARGING]); i ++) {
			var pos = ds_list_find_value(global.ROOMS[ROOM.CHARGING], i);
			var tile = GetTile(pos[0], pos[1]);
			// if it's simply not possible
			if (tile == noone || tile.roomType != ROOM.CHARGING) {
				ds_list_delete(global.ROOMS[ROOM.CHARGING], i);
			} else if (tile.accessible) {
				ds_priority_add(priority, i, point_distance(currentX, currentY, tile.gridX, tile.gridY) + irandom(5));
			}
		}
		
		var done = false;
		while (!done && !ds_priority_empty(priority)) {
			var i = ds_priority_delete_min(priority);
			var pos = ds_list_find_value(global.ROOMS[ROOM.CHARGING], i);
			var tile = GetTile(pos[0], pos[1]);
			taskX = tile.gridX;
			taskY = tile.gridY;
			path = APathFind(currentX, currentY, taskX, taskY, false);
			if (path != noone) {
				task = TASK.CHARGE;
				state = STATE.MOVING;
				taskTime = chargeTime;
				done = true;
			} else {
				tile.accessible = false;	
			}
		}
		ds_priority_destroy(priority);
	}
	
// Check for dropoff tasks
if (task == TASK.IDLE && metals > 0 && !ds_list_empty(global.ROOMS[ROOM.STORAGE])) {
	var priority = ds_priority_create();
	
	for (var i = 0; i < ds_list_size(global.ROOMS[ROOM.STORAGE]); i ++) {
		var pos = ds_list_find_value(global.ROOMS[ROOM.STORAGE], i);
		ds_priority_add(priority, pos, point_distance(currentX, currentY, pos[0], pos[1]) + irandom(10));
	}
		
	var done = false;
	while (!done && !ds_priority_empty(priority)) {
		var pos =  ds_priority_delete_min(priority);
		taskX = pos[0];
		taskY = pos[1];
		path = APathFind(currentX, currentY, taskX, taskY, false);
		if (path != noone) {
			task = TASK.DROP;
			state = STATE.MOVING;
			break;
		}
	}
	ds_priority_destroy(priority);
}
	
	event_user(0);
	
	// If STILL idle
	if (task == TASK.IDLE) {
		// Find a open spot
		var okay = false;
		var cell = noone;
		var attempts = 0;
		while (!okay) {
			cell = 	GetTile(irandom(objMap.mapWidth), irandom(objMap.mapHeight));
			if (cell != noone && !cell.solid) {
				okay = true;
			}
			
			attempts += 1;
			if (attempts > 10) {
				break;	
			}
		}
		if (okay) {
			path = APathFind(currentX, currentY, cell.gridX, cell.gridY, false);
			if (path != noone) {
				state = STATE.MOVING;
			}
		}
	}
}
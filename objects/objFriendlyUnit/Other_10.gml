
if (energy <= 0) {
	TutorialTrigger("WARNING! WARNING! A ROBOT IS NOT FUNCTIONING AT PEAK EFFICIENCY! PLACE A CHARGING ROOM NEARBY!", TUTORIAL.LOW_CHARGE);	
}
	
if (energy <= 10 && !ds_list_empty(global.ROOMS[ROOM.CHARGING])) {
	var priority = ds_priority_create();
		
	for (var i = 0;	i < ds_list_size(global.ROOMS[ROOM.CHARGING]); i ++) {
		var pos = ds_list_find_value(global.ROOMS[ROOM.CHARGING], i);
		var tile = GetTile(pos[0], pos[1]);
		// if it's simply not possible
		if (tile == noone || tile.roomType != ROOM.CHARGING) {
			ds_list_delete(global.ROOMS[ROOM.CHARGING], i);
		} else if (tile.accessible) {
			//ds_priority_add(priority, i, point_distance(gridX, gridY, tile.gridX, tile.gridY) + irandom(5));
			ds_priority_add(priority, i, irandom(5));
		}
	}
		
	var done = false;
	while (!done && !ds_priority_empty(priority)) {
		var i = ds_priority_delete_min(priority);
		var pos = ds_list_find_value(global.ROOMS[ROOM.CHARGING], i);
		var tile = GetTile(pos[0], pos[1]);
		taskX = tile.gridX;
		taskY = tile.gridY;
		path = APathFind(gridX, gridY, taskX, taskY, false);
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
		ds_priority_add(priority, pos, point_distance(gridX, gridY, pos[0], pos[1]) + irandom(10));
	}
		
	var done = false;
	while (!done && !ds_priority_empty(priority)) {
		var pos =  ds_priority_delete_min(priority);
		taskX = pos[0];
		taskY = pos[1];
		path = APathFind(gridX, gridY, taskX, taskY, false);
		if (path != noone) {
			task = TASK.DROP;
			state = STATE.MOVING;
			break;
		}
	}
	ds_priority_destroy(priority);
}

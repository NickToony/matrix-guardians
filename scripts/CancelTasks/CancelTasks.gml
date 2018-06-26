var xx = argument0;
var yy = argument1;

var lists = [objMap.buildTasks, objMap.digTasks];
for (var i = 0; i < array_length_1d(lists); i ++) {
	var list = lists[i];
	
	var toDelete = ds_list_create();
	for (var ti = 0; ti < ds_list_size(list); ti ++) {
		var point = ds_list_find_value(list, ti);
		if (point[0] == xx && point[1] == yy) {
			ds_list_add(toDelete, ti);
			var tile = GetTile(xx, yy);
			if (tile != noone) {
				tile.taskDig = false;
			}
			RecalcNeighbours(tile);
		}
	}
	
	
	for (var ti = 0; ti < ds_list_size(toDelete); ti ++) {
		ds_list_delete(list, ds_list_find_value(toDelete, ti));
	}
	ds_list_destroy(toDelete);
}


with (objRoomba) {
	if (taskX == xx && taskY == yy) {
		if (task == TASK.DIG ) {
			task = TASK.IDLE;
			var tile = GetTile(xx, yy);
			if (tile != noone) {
				tile.taskDig = false;
			}
			RecalcNeighbours(tile);
		}
	}
}
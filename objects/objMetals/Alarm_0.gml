alarm[0] = room_speed * (10 + irandom(5));


if (stored) {
	stored = false;
	for (var i = 0; i < ds_list_size(global.ROOMS[ROOM.STORAGE]); i ++) {
		var pos = ds_list_find_value(global.ROOMS[ROOM.STORAGE], i);
		if (pos[0] == gridX && pos[1] == gridY) {
			stored = true;
			break;
		}
	}
	
	if (stored) {
		with (objMetals) {
			if (id != other.id && gridX == other.gridX && other.gridY == gridY) {
				other.metals += metals;
				instance_destroy();	
			}
		}
	}
}
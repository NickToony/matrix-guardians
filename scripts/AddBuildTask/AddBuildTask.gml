//var exists = false;
//for (var i = 0; i < objMap.digTasks; i ++) {
//	var xx = ds_list_find_value(objMap.digTasks, i)[0];	
//	var yy = ds_list_find_value(objMap.digTasks, i)[1];
	
//	if (xx == argument0 & yy = argument1) {
		
//	}
//}

var tile = GetTile(argument0, argument1);
if (tile != noone && tile.buildable && !tile.taskBuild && tile.roomType == ROOM.NONE) {
	tile.taskBuild = true;
	RecalcNeighbours(tile);
	ds_list_add(objMap.buildTasks, [argument0, argument1]);
}
//var exists = false;
//for (var i = 0; i < objMap.digTasks; i ++) {
//	var xx = ds_list_find_value(objMap.digTasks, i)[0];	
//	var yy = ds_list_find_value(objMap.digTasks, i)[1];
	
//	if (xx == argument0 & yy = argument1) {
		
//	}
//}

var tile = GetTile(argument0, argument1);
if (tile != noone && tile.diggable && !tile.taskDig) {
	tile.taskDig = true;
	RecalcNeighbours(tile);
	ds_list_add(objMap.digTasks, [argument0, argument1]);
}
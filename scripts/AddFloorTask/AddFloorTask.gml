var tile = GetTile(argument0, argument1);
if (tile != noone && tile.floorable && !tile.taskFloor) {
	tile.taskFloor = true;
	RecalcNeighbours(tile);
	ds_list_add(objMap.floorTasks, [argument0, argument1]);
}
var tile = GetTile(argument0, argument1);
if (tile != noone && tile.wallable && !tile.taskWall) {
	tile.taskWall = true;
	RecalcNeighbours(tile);
	ds_list_add(objMap.wallTasks, [argument0, argument1]);
}
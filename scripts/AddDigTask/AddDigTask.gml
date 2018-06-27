var tile = GetTile(argument0, argument1);
if (tile != noone && tile.diggable && !tile.taskDig) {
	tile.taskDig = true;
	RecalcNeighbours(tile);
	ds_list_add(objMap.digTasks, [argument0, argument1]);
}
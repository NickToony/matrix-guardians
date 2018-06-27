var tile = GetTile(argument0, argument1);
if (tile != noone && tile.wallable && !tile.taskWall) {
	//var path = APathFind(tile.gridX, tile.gridY, objGateway.gridX, objGateway.gridY, true);
	//if (path != noone) {
		tile.taskWall = true;
		RecalcNeighbours(tile);
		ds_list_add(objMap.wallTasks, [argument0, argument1]);
		//APathDestroy(path);
	//}
	
}
alarm[0] = 60;

if (!ds_stack_empty(spawnQueue)) {
	var unit = ds_stack_pop(spawnQueue);
	var x1 = GetNeighbourX(gridX, gridY, TOP_LEFT);
	var y1 = GetNeighbourY(gridX, gridY, TOP_LEFT);
	var x2 = GetNeighbourX(x1, y1, TOP_RIGHT);
	var y2 = GetNeighbourY(x1, y1, TOP_RIGHT);
	var instance = CreateUnit(x2, y2, unit);
	instance.gateway = true;
}
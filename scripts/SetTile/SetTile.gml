var xx = argument0;
var yy = argument1;
var obj = argument2;

if (argument0 < 0 || argument0 >= ds_grid_width(objMap.grid)
	|| argument1 < 0 || argument1 >= ds_grid_height(objMap.grid)) {
		return noone;
	}

var current = ds_grid_get(objMap.grid, argument0, argument1);
if (current != noone) {
	with (current) {
		instance_destroy();
	}
}

var offset = 0;
if (yy mod 2 != 0) {
	offset = objMap.tileWidth;	
}
var instance = instance_create_layer(argument0 * objMap.tileWidth*2 + offset, 
	argument1 * objMap.tileHeight, objControl.layerInstances, 
	argument2);
			
instance.gridX = argument0;
instance.gridY = argument1;
			
ds_grid_set(objMap.grid, argument0, argument1, instance);

// Trigger depth calc
objDraw.recalc = true;

// Recalc neighbours
with (instance) RecalcNeighbours();
with (instance.topLeft) RecalcNeighbours();
with (instance.topRight) RecalcNeighbours();
with (instance.bottomLeft) RecalcNeighbours();
with (instance.bottomRight) RecalcNeighbours();

return instance;
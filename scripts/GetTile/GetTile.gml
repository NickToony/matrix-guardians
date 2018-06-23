if (argument0 < 0 || argument0 >= ds_grid_width(objMap.grid)
	|| argument1 < 0 || argument1 >= ds_grid_height(objMap.grid)) {
		return noone;
	}

return ds_grid_get(objMap.grid, argument0, argument1);
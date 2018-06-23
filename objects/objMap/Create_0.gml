mapWidth = 32;
mapHeight = 32;
tileWidth = 181/2 - 0.5;
tileHeight = 137/2 - 5;

TOP_LEFT = 0;
TOP_RIGHT = 1;
BOTTOM_LEFT = 2;
BOTTOM_RIGHT = 3;

grid = ds_grid_create(mapWidth, mapHeight);
ds_grid_set_region(grid, 0, 0, mapWidth, mapHeight, noone);

for (var xx = 0; xx < mapWidth; xx ++) {
	for (var yy = 0; yy < mapHeight; yy ++) {
		SetTile(xx, yy, objBlockTile);
	}
}
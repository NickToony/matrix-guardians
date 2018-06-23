
#macro TOP_LEFT 0
#macro TOP_RIGHT 1
#macro BOTTOM_LEFT 2
#macro BOTTOM_RIGHT 3

mapWidth = 1;
mapHeight = mapWidth*2;
tileWidth = 181/2 - 0.5;
tileHeight = 137/2 - 5;

grid = ds_grid_create(mapWidth, mapHeight);
ds_grid_clear(grid, noone);

for (var xx = 0; xx < mapWidth; xx ++) {
	for (var yy = 0; yy < mapHeight; yy ++) {
		SetTile(xx, yy, objBlockTile);
	}
}
#macro TOP_LEFT 0
#macro TOP_RIGHT 1
#macro BOTTOM_LEFT 2
#macro BOTTOM_RIGHT 3

#macro SELECTION_RATE 5
#macro SELECTION_RANGE 16

enum TOOL {
	NONE,
	DIG,
	STORAGE,
	REMOVE,
	BUILD,
	CANCEL,
	CHARGE,
	SPAWN,
	ASSEMBLY,
	ARCHIVE,
	OVERCLOCK,
	GENERATOR,
	TRAP
}
tool = TOOL.NONE;
toolCost = 0;

InitRooms();
InitDifficulty();

mapWidth = 32;
mapHeight = mapWidth*2;
tileWidth = 181/2 - 0.5;
tileHeight = 137/2 - 5;
fogOfWar = true;

selecting = false;
selection = noone;
selectionRefresh = 0;
selectionValid = false;
mx = 0;
my = 0;

// Create tile grid
grid = ds_grid_create(mapWidth, mapHeight);
ds_grid_clear(grid, noone);

// Task lists
digTasks = ds_list_create();
floorTasks = ds_list_create();
wallTasks = ds_list_create();
buildTasks = ds_list_create();

// Create pathfinding grid
pathfinding = mp_grid_create(0, 0, mapWidth, mapHeight, 1, 1);

for (var xx = 0; xx < mapWidth; xx ++) {
	for (var yy = 0; yy < mapHeight; yy ++) {
		SetTile(xx, yy, objDirtBlock);
	}
}

while (instance_number(objLavaTile) < mapWidth) {
	SetTileVein(irandom(mapWidth), irandom(mapHeight), objLavaTile, 4 + irandom(4));	
}

while (instance_number(objMetalBlock) < mapHeight*3) {
	SetTileVein(irandom(mapWidth), irandom(mapHeight), objMetalBlock, 6 + irandom(6));	
}

SetTileRegion(mapWidth/2, mapHeight/2, objBlockTile, 4, 4);
SetTileRegion(mapWidth/2, mapHeight/2, objDirtFloor, 3, 3);
SetTileRegion(mapWidth/2, mapHeight/2, objFloorTile, 2, 2);

// Base
var xx = GetNeighbourX(mapWidth/2, mapHeight/2, BOTTOM_RIGHT);
var yy = GetNeighbourY(mapWidth/2, mapHeight/2, BOTTOM_RIGHT);
var mx = GetNeighbourX(xx, yy, BOTTOM_LEFT);
var my = GetNeighbourY(xx, yy, BOTTOM_LEFT);
CreateBuilding(mx, my, objGateway, true);

// Base units
repeat (5) {
	CreateUnitGateway(objRoomba);
}
	
xx = GetNeighbourX(mx, my, BOTTOM_LEFT);
yy = GetNeighbourY(mx, my, BOTTOM_LEFT);
CreateMetals(xx, yy, 300);
mx = GetNeighbourX(xx, yy, BOTTOM_RIGHT);
my = GetNeighbourY(xx, yy, BOTTOM_RIGHT);
CreateMetals(mx, my, 300);
xx = GetNeighbourX(mx, my, TOP_RIGHT);
yy = GetNeighbourY(mx, my, TOP_RIGHT);
CreateMetals(xx, yy, 300);

MoveCamera(WorldX(mapWidth/2, mapHeight/2), WorldY(mapWidth/2, mapHeight/2), true);

alarm[0] = global.WAVE_TIME;
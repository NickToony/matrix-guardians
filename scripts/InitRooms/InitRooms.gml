#macro TILES_PER_KILLBOT 6
#macro TILES_PER_DRONE 8

enum ROOM {
	NONE,
	STORAGE,
	CHARGING,
	ASSEMBLY,
	ARCHIVE
}


global.ROOMS = [];
global.ROOMS[ROOM.NONE] = ds_list_create();
global.ROOMS[ROOM.STORAGE] = ds_list_create();
global.ROOMS[ROOM.CHARGING] = ds_list_create();
global.ROOMS[ROOM.ASSEMBLY] = ds_list_create();
global.ROOMS[ROOM.ARCHIVE] = ds_list_create();
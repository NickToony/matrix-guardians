enum ROOM {
	NONE,
	STORAGE,
	CHARGING,
	ASSEMBLY
}


global.ROOMS = [];
global.ROOMS[ROOM.NONE] = ds_list_create();
global.ROOMS[ROOM.STORAGE] = ds_list_create();
global.ROOMS[ROOM.CHARGING] = ds_list_create();
global.ROOMS[ROOM.ASSEMBLY] = ds_list_create();
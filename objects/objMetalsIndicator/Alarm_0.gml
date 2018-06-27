alarm[0] = room_speed;
global.METALS = 0;
global.STORED_METALS = 0;
with (objMetals) {
	if (stored) {
		global.METALS += metals;
		global.STORED_METALS += metals;
	}
}
with (objUnit) {
	global.METALS += metals;	
}

var mx = ds_list_size(global.ROOMS[ROOM.STORAGE]) * MAX_METALS;
global.SPENDABLE_METALS = min(global.STORED_METALS, mx);


text = "Stored: " + string(global.SPENDABLE_METALS)
	+ "\nMax: " + string(mx);
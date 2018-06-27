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

draw_self();

var mx = ds_list_size(global.ROOMS[ROOM.STORAGE]) * MAX_METALS;
text = "Stored: " + string(min(global.STORED_METALS, mx))
	+ "\nMax: " + string(mx);
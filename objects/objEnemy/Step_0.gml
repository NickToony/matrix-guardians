/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var tile = GetTile(gridX, gridY);
if (tile.object_index == objTileTrap) {
	if (tile.charge < current_time - (1000 * 8)) {
		myHealth -= 150;
		tile.charge = current_time;
	}
}
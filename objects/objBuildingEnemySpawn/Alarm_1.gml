var tile = GetTile(gridX, gridY);
if (tile.connected) {
	instance_destroy();
}
alarm[1] = room_speed;
alarm[0] = room_speed * (time + irandom(5));

var total = amount + irandom(amount);
var side = TaskSide(GetTile(gridX, gridY));

if (side != noone) {
	CreateMetals(side.gridX, side.gridY, total);
}
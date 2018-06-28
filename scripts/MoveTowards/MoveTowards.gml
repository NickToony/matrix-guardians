var tx = argument0;
var ty = argument1;
var currentSpeed = argument2;

var angle = point_direction(x, y, tx, ty);
x += lengthdir_x(currentSpeed, angle);
y += lengthdir_y(currentSpeed, angle);
if (x < tx) {
	if (y > ty) {
		// top right
		image_index = 0;
	} else {
		// bottom right
		image_index = 2;
	}
} else {
	if (y > ty) {
		// top left
		image_index = 1;
				
	} else {
		// botom left
		image_index = 3;
	}
}
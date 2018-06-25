x = round(x + (xTo - x) / 4);
y = round(y + (yTo - y) / 4);
zoom = zoom + (zoomTo - zoom) / 2;

var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var zoomIn = keyboard_check(ord("E")) || mouse_wheel_up();
var zoomOut = keyboard_check(ord("Q")) || mouse_wheel_down();

if (left || right || down || up) {
	follow = noone;
	
	xTo += cameraSpeed * zoom * (-left + right);
	yTo += cameraSpeed * zoom * (-up + down);
}

zoomTo += zoomSpeed * (-zoomIn + zoomOut);
zoomTo = min(max(zoomTo, minZoom), maxZoom);

if (follow != noone) {
	xTo = follow.x;
	yTo = follow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0] * zoom, view_hport[0] * zoom, 1, 1000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

mouseTileY = ceil((mouse_y + objMap.tileHeight)/objMap.tileHeight);
if (mouseTileY mod 2 == 0) {
	mouseTileX = round((mouse_x)/objMap.tileWidth/2);
} else {
	mouseTileX = round((mouse_x-objMap.tileWidth/2)/objMap.tileWidth/2);
}
//mouseTileX = UnworldX(mouse_x, mouse_y);
//mouseTileY = UnworldY(mouse_x, mouse_y);
	
w = view_wport[0]* zoom;
h = view_hport[0]* zoom;
bx = objMap.tileWidth*ba * zoom;
by = objMap.tileHeight*ba * zoom;
x1 = x - w/2;
y1 = y - h/2;
x2 = x + w/2;
y2 = y + h/2;
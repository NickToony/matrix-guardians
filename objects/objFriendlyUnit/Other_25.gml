/// @description Draw here!

if (flee) {
	draw_sprite_ext(sprWarning, 0, x, y - objMap.tileHeight*2, 0.5, 0.5, 0, c_white, 0.5);
} else if (overclocked) {
	draw_sprite_ext(sprWarning, 0, x, y - objMap.tileHeight*2, 0.5, 0.5, 0, c_blue, 0.5);
} else if (energy <= 0) {
	draw_sprite_ext(sprWarning, 0, x, y - objMap.tileHeight*2, 0.5, 0.5, 0, c_red, 0.5);
} else if (energy <= 10) {
	draw_sprite_ext(sprWarning, 0, x, y - objMap.tileHeight*2, 0.5, 0.5, 0, c_yellow, 0.5);
}
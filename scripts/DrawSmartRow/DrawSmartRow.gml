#macro SURFACE_HEIGHT 256

if (ds_list_empty(tiles))
	return;
	

if (!surface_exists(surface) || redraw) { 
	if (!surface_exists(surface)) {
		var width = (objMap.tileWidth+1) * objMap.mapWidth * 2;
		var xx = 512;
		while (xx < width) {
			xx *= 2;	
		}
		width = xx;
		surface = surface_create(width, SURFACE_HEIGHT); 
	}
	surface_set_target(surface); 
	draw_clear_alpha( c_black, 0);
   
	for (var i = 0; i < ds_list_size(tiles); i ++) {
		var tile = ds_list_find_value(tiles, i);
	   
		if (!objMap.fogOfWar || tile.isVisible > 0) {
			if (tile.roomType != ROOM.NONE && tile.roomSprite != noone) {
				var index = irandom(sprite_get_number(tile.roomSprite));
				draw_sprite(tile.roomSprite, index, tile.x + objMap.tileWidth, SURFACE_HEIGHT);
			} else {
				var index = irandom(sprite_get_number(tile.sprite_index));
				draw_sprite(tile.sprite_index, index, tile.x + objMap.tileWidth, SURFACE_HEIGHT);
			}
			if (tile.taskDig || tile.taskBuild) {
				var col = tile.accessible ? c_teal : c_red;
				draw_sprite_ext(tile.taskDig ? tile.sprite_index : sprBlock, 0, tile.x + objMap.tileWidth, SURFACE_HEIGHT, 1, 1, 0, col, tile.taskDig ? 0.3 : 0.6);
			}
		}
	   
		DrawWalls(tile);
	}
  
   
	surface_reset_target();
  
	redraw = false;
} 

draw_surface(surface, -objMap.tileWidth, y - SURFACE_HEIGHT);
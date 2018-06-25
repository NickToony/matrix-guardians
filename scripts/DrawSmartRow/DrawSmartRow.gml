#macro SURFACE_HEIGHT 256

if (ds_list_empty(tiles))
	return;
	

if (!surface_exists(surface) || redraw) { 
	if (!surface_exists(surface)) {
		surface = surface_create((objMap.tileWidth+1) * objMap.mapWidth * 2, SURFACE_HEIGHT); 
	}
	surface_set_target(surface); 
	draw_clear_alpha( c_black, 0);
   
	for (var i = 0; i < ds_list_size(tiles); i ++) {
		var tile = ds_list_find_value(tiles, i);
	   
		if (!objMap.fogOfWar || tile.visible) {
			draw_sprite(tile.sprite_index, 0, tile.x + objMap.tileWidth, SURFACE_HEIGHT);
			if (tile.taskDig) {
				var col = tile.accessible ? c_teal : c_red;
				draw_sprite_ext(tile.sprite_index, 0, tile.x + objMap.tileWidth, SURFACE_HEIGHT, 1, 1, 0, col, 0.3);
			}
		}
	   
		DrawWalls(tile);
	}
  
   
	surface_reset_target();
  
	redraw = false;
} 

draw_surface(surface, -objMap.tileWidth, y - SURFACE_HEIGHT);
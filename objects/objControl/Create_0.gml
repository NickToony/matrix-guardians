// FPS
room_speed = 60;
display_reset(0, true)

layerInstances = layer_get_id("Instances");
layerDepth = layer_get_id("Depth");
layerBuildings = layer_get_id("Buildings");
layerUnits = layer_get_id("Units");
layerControl = layer_get_id("Control");

instance_create_layer(0, 0, layerControl, objCamera);
instance_create_layer(0, 0, layerInstances, objDraw);
instance_create_layer(0, 0, layerControl, objMap);

show_debug_overlay(true);

// Fix sprites for units
sprite_set_offset(sprVoidling, sprite_get_xoffset(sprVoidling),sprite_get_yoffset(sprVoidling) + objMap.tileHeight*3);
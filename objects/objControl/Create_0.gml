// FPS
room_speed = 60;
display_reset(0, true)

layerInstances = layer_get_id("Instances");
layerDepth = layer_get_id("Depth");
layerBuildings = layer_get_id("Buildings");
layerUnits = layer_get_id("Units");
layerControl = layer_get_id("Control");
layerUI = layer_get_id("UI");

instance_create_layer(0, 0, layerControl, objCamera);
instance_create_layer(0, 0, layerInstances, objDraw);
instance_create_layer(0, 0, layerControl, objMap);

//show_debug_overlay(true);

// Fix sprites for units
sprite_set_offset(sprRoomba, sprite_get_xoffset(sprRoomba),sprite_get_yoffset(sprRoomba) + objMap.tileHeight*3);
sprite_set_offset(sprMetals, sprite_get_xoffset(sprMetals),sprite_get_yoffset(sprMetals) + objMap.tileHeight*0.5);

global.mouse_over_ui = false;
global.METALS = 0;
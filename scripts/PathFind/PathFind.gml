
var stuck = mp_grid_path(objMap.pathfinding, argument0, UnworldX(x, y), UnworldY(x, y), argument1, argument2, true);
if (stuck) show_debug_message("STUCK??");
return stuck;
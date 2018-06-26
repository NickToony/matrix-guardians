var gridX = WorldX(argument0, argument1);
var gridY = WorldY(argument0, argument1);

var instance = instance_create_layer(gridX, gridY, objControl.layerUnits, objMetals);
instance.metals = argument2;
instance.gridX = gridX;
instance.gridY = gridY;
return instance;
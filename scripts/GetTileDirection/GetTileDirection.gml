
// argument1 xx
// argument2 yy
// dir

if (argument1 mod 2 == 0) { // EVEN Y
	switch (argument2) {
		case objMap.TOP_LEFT:
			return GetTile(argument0 - 1, argument1 - 1);
		
		case objMap.TOP_RIGHT:
			return GetTile(argument0, argument1 - 1);
			
		case objMap.BOTTOM_RIGHT:
			return GetTile(argument0, argument1 + 1);
			
		case objMap.BOTTOM_LEFT:
			return GetTile(argument0 - 1, argument1 + 1);
	}
} else {
	switch (argument2) {
		case objMap.TOP_LEFT:
			return GetTile(argument0, argument1 - 1);
		
		case objMap.TOP_RIGHT:
			return GetTile(argument0 + 1, argument1 - 1);
			
		case objMap.BOTTOM_RIGHT:
			return GetTile(argument0 + 1, argument1 + 1);
			
		case objMap.BOTTOM_LEFT:
			return GetTile(argument0, argument1 + 1);
	}
}
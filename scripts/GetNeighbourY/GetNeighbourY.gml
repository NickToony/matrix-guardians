
// argument1 xx
// argument2 yy
// dir
var xx = argument0;

if (argument1 mod 2 == 0) { // EVEN Y
	switch (argument2) {
		case TOP_LEFT:
			return argument1 - 1;
		
		case TOP_RIGHT:
			return argument1 - 1;
			
		case BOTTOM_RIGHT:
			return argument1 + 1;
			
		case BOTTOM_LEFT:
			return argument1 + 1;
	}
} else {
	switch (argument2) {
		case TOP_LEFT:
			return argument1 - 1;
		
		case TOP_RIGHT:
			return argument1 - 1;
			
		case BOTTOM_RIGHT:
			return  argument1 + 1;
			
		case BOTTOM_LEFT:
			return argument1 + 1;
	}
}
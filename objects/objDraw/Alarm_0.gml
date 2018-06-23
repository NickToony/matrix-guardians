if (os_browser == browser_not_a_browser) {
	alarm[0] = refreshRate;
	instance_deactivate_object(objBaseTile);
	instance_activate_region(objCamera.x1 - objCamera.bx, 
		objCamera.y1  - objCamera.by, 
		objCamera.w + objCamera.bx*2, 
		objCamera.h + objCamera.by*2, 
		true);
}
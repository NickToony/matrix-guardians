if (message == noone && ds_queue_size(messages)) {
	message = ds_queue_dequeue(messages);
}

var xx = view_wview[0]/2;
var yy = view_hview[0]/2;

if (message != noone) {
	
	global.PAUSED = true;
	
	messageActive = true;
	
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_font(fntMessage);
	
	var textWidth = max(150, min(string_width(message), messageWidth, view_wview[0]));
	var textHeight = string_height_ext(message, 24, textWidth);

	var width = textWidth + 64;
	var height = textHeight + 128;
	
	draw_sprite_rectangle_ext(sprBlueBox,0,
	xx - width/2,yy - height/2, xx + width/2, yy + height/2,
	10, 10, 10, 10, c_white, 1);
	draw_text_ext(xx, yy, message, 24, textWidth);
	
	
	draw_set_color(c_black);
	draw_set_font(fntUITitle);
	draw_set_valign(fa_bottom);
	draw_text(xx, yy + height/2 - 8, "Right Click to Close");
	
} else {
	messageActive = false;	
}

if (tip != noone) {
	draw_set_alpha(tipAlpha);
	draw_set_color(c_white);
	draw_set_font(fntUI);
	draw_set_halign(fa_center);
	draw_text(xx, yy - 200, tip); 
	draw_set_alpha(1);
	
	tipAlpha -= 0.005;
	if (tipAlpha <= 0) {
		tip = noone;	
	}
}
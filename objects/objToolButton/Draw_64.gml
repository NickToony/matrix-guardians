/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var xx = myX;
var yy = myY;

draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_sprite(icon, 0, xx, yy-10);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(fntIcon);
draw_text(xx, yy + 18, text);
	
if (over && tooltip != noone) {
	draw_set_halign(fa_left);
	draw_set_font(fntTooltip);
	var width = min(tooltipWidth, string_width(tooltip));
	var height = string_height_ext(tooltip, 24, tooltipWidth);
	draw_set_color(c_dkgray);
	draw_rectangle(mouseX + tooltipMargin - tooltipPadding,
		mouseY - tooltipPadding,
		mouseX + tooltipMargin + tooltipPadding + width,
		mouseY + tooltipPadding + height, false);
	draw_set_color(c_white);
	draw_text_ext(mouseX + tooltipMargin, mouseY, tooltip, 24, width);
}
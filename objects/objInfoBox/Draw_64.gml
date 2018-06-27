var xx = myX;
var yy = myY;

draw_sprite_ext(sprite_index, image_index, xx, yy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_set_font(fntUITitle);
draw_text(xx, yy - 32, title);
draw_set_color(c_black);
draw_set_font(fntUI);
draw_text(xx, yy+12, text);
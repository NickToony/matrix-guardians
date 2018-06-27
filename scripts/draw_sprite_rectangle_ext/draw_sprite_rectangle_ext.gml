/// draw_sprite_rectangle_ext(sprite,subimg,x1,y1,x2,y2,left,top,right,bottom, colour, alpha)
//
//  Draws a rectangle using a sprite sliced into 9 sections.
//  The 3x3 sections are used to draw the four corners, the
//  four edges, and the center of the rectangle. The center
//  and edge sections are stretched to fill the respective
//  areas of the rectangle.
//
//      sprite  sprite index
//      subimg  sprite subimage
//      x1,y1   top-left corner of rectangle
//      x2,y2   bottom-right corner of rectangle
//      left    left edge width in pixels
//      top     top edge width in pixels
//      right   right edge width in pixels
//      bottom  bottom edge width in pixels
//      colour  The colour of the sprite (normally c_white)
//      alpha   The opacity/alpha of the sprite (normally 1)
//
//  Adapted version by: Ciberman (Javier H. Mora)
//        - Added support for cases when the rectangle to draw 
//          is smaller than the source sprite. Also added support
//          for colour and alpha arguments
//
//  Original script from: GMLscripts.com
/// GMLscripts.com/license
{
    var spr = argument0,
        img = argument1,
        x1  = argument2,
        y1  = argument3,
        x2  = argument4,
        y2  = argument5,
        l   = argument6,
        t   = argument7,
        r   = argument8,
        b   = argument9,
        col = argument10,
        al  = argument11;

    var sprw = sprite_get_width(spr),
        sprh = sprite_get_height(spr),
        c = sprw - l - r,
        m = sprh - b - t;
    
    if ( x2-x1-l-r < 0 ) {
        var x3 = x1+(l/(r+l))*(x2-x1);
        var x4 = x3;
    } else {
        var x3 = x1 + l;
        var x4 = x2 - r + 1;
    }
    if ( y2-y1-b-t < 0 ) {
        var y3 = y1+(t/(t+b))*(y2-y1);
        var y4 = y3;
    } else {
        var y3 = y1 + t;
        var y4 = y2 - b + 1;
    }

    var spr_x4 = sprw - r;
    var spr_y4 = sprh - b;
    var sc = max(0,x4 - x3) / c;
    var sm = max(0,y4 - y3) / m;
    var sl = clamp( (x3-x1)/l, 0,1);
    var sr = clamp( (x2-x4)/r, 0,1);
    var st = clamp( (y3-y1)/t, 0,1);
    var sb = clamp( (y2-y4)/b, 0,1);
    
    // Left / Top
    draw_sprite_part_ext(spr, img, 0,0, l, t, x1, y1, sl, st, col, al);
    // Center / Top
    draw_sprite_part_ext(spr, img, l,0, c, t, x3, y1, sc,  st,col, al);
    // Right / Top
    draw_sprite_part_ext(spr, img, spr_x4,0, r, t, x4, y1, sr, st, col, al);
    
    // Left / Middle
    draw_sprite_part_ext(spr, img, 0, t, l, m, x1, y3, sl, sm, col, al);
    // Center / Middle
    draw_sprite_part_ext(spr, img, l, t, c, m, x3, y3, sc,  sm, col, al);
    // Right / Middle
    draw_sprite_part_ext(spr, img, spr_x4, t, r, m,x4, y3, sr, sm,col, al);
    
    // Left / Bottom
    draw_sprite_part_ext(spr, img, 0, spr_y4, l, b, x1, y4, sl, sb, col, al);
    // Center / Bottom
    draw_sprite_part_ext(spr, img, l, spr_y4, c, b, x3, y4, sc,  sb, col, al);
    // Right / Bottom
    draw_sprite_part_ext(spr, img, spr_x4, spr_y4, r, b, x4, y4, sr, sb, col, al);;
    
    return 0;
}
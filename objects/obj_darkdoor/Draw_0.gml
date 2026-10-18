draw_self()
if (open == 1)
{
    xsin += 0.01
    if (xsin > 1)
        xsin = 1
    siner += 1
    image_index = 1 
var amt = (sin((siner / 16)) * 0.1)
    draw_background_ext(bg_darkdoor_open, 0, 0, 1, 1, 0, c_white, (xsin + amt))
    for (var i = 1; i < 6; i += 1)
        draw_sprite_ext(sprite_index, 2, x, (y + sprite_height), 1, ((3 / i) + amt), 0, c_white, (xsin * (amt + 0.2)))
    var ht = ((amt * sprite_height) * 3)
    var wt = ((amt * sprite_width) * 3)
    draw_sprite_ext(sprite_index, 2, (x - (wt / 2)), (y - ht), (1 + (amt * 3)), (1 + (amt * 3)), 0, c_white, (xsin * (amt + 0.2)))
    ht = ((amt * sprite_height) * 2)
    wt = ((amt * sprite_width) * 2)
    draw_sprite_ext(sprite_index, 2, (x - (wt / 2)), (y - ht), (1 + (amt * 2)), (1 + (amt * 2)), 0, c_white, (xsin * (amt + 0.2)))
}
if global.fake == true
{
  draw_text(camera_get_view_x(view_camera[0]) + 10,camera_get_view_y(view_camera[0]) + 20,"X is = " + string(obj_mainchara.x))	
   draw_text(camera_get_view_x(view_camera[0]) + 10,camera_get_view_y(view_camera[0]) +40,"y is = " + string(obj_mainchara.y))	
}


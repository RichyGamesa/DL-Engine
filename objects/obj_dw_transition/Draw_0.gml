draw_self()

var xa = camera_get_view_x(view_camera[0])
var ya = camera_get_view_y(view_camera[0])

draw_set_color(c_red)
if instance_exists(obj_darkdoor)
{
draw_text(xa+10,ya+20,"con is = " + string(obj_darkdoor.con))
draw_text(xa+10,ya+40,"alarm is = " + string(obj_darkdoor.alarm[4]))
draw_text(xa+10,ya+60,"image index is = " + string(obj_fake_kris.image_index))
}
//draw_text(xa+10,ya+40,"Susie depth is = " + string(obj_suzy.depth))
//draw_text(xa+10,ya+60,"depth is = " + string(depth))

draw_set_color(c_white)
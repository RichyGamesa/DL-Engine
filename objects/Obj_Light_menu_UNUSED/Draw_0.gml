draw_self()

if instance_exists(Obj_Light_menu_UNUSED) = true {

var t_x = camera_get_view_x(view_camera[0]);
var t_y = camera_get_view_y(view_camera[0]);
    draw_set_font(fnt_undertale_small);
	draw_text_transformed(t_x+34,t_y+67,global.L_money,0.75,0.75,0)

if Obj_Light_menu_UNUSED.image_index = 6
{
 t_x = camera_get_view_x(view_camera[0]);
 t_y = camera_get_view_y(view_camera[0]);
    draw_set_font(fnt_dt_mono);
	draw_text(t_x+146,t_y+175,global.L_money)
	
	t_x = camera_get_view_x(view_camera[0]);
 t_y = camera_get_view_y(view_camera[0]);
    draw_set_font(fnt_dt_mono);
	draw_text(t_x+152,t_y+136,global.L_weapon)
	
		t_x = camera_get_view_x(view_camera[0]);
 t_y = camera_get_view_y(view_camera[0]);
    draw_set_font(fnt_dt_mono);
	draw_text(t_x+148,t_y+151,global.L_armor)
	
	
}
	
}

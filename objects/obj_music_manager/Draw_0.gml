// Draw Event

var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]) + 40;

if (global.fake == 1) {
    draw_set_font(fnt_dt_mono);
 // draw_text_ext_color(_x, _y, "current song = " + string(current_song), 500, 999, c_red, c_red, c_red, c_red, 1);
 // draw_text_ext_color(_x, _y + 40, "song playing = " + string(song_playing), 500, 999, c_red, c_red, c_red, c_red, 1);
    draw_set_color(c_green)
	draw_text(_x + 60, _y - 35, room_get_name(room));
	draw_set_color(c_white);
	draw_text(_x,_y,"The current song is =" + string(current_song))
	draw_text(_x,_y+29,"The current persistance is =" + string(current_persistent_song))
}

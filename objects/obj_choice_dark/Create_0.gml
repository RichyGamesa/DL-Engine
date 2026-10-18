//obj_choice create event

audio_play_sound(snd_select,1,false)

setup = false;

depth = -999;
textbox_width = 485;
textbox_height = 145;
border = 10;
line_sep = 30;
line_width = 237;
txtb_sprite = sTextbox_dark;
txtb_image = 0;
txtb_image_spd = 0;
txtb_sprite = sTextbox_dark;
txtb_image = 0;
txtb_image_spd = 0;
global.dialogue = true;
global.selected_choice = 0;

 textbox_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - textbox_width) / 2;
 textbox_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - textbox_height - border;


choice_number = 2;
choice_1 = "Save me Susie."
choice_2 = "Kill me Susie."
choice_3 = "Maybe"
choice_4 = "Nope"
selected_choice = 0;

font = fnt_dt_mono;
mainchara = obj_mainchara;

textbox_image_index = 0;
going_up = true;
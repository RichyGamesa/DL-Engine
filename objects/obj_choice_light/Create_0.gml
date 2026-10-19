//obj_choice create event

play_sound(snd_select)

setup = false;

depth = -300;
textbox_width = 260;
textbox_height = 87;
border = 10;
line_sep = 13;
line_width = 237;
txtb_sprite = sTextbox;
txtb_image = 0;
txtb_image_spd = 0;


 textbox_x = obj_Overworld_Camera.x + 13;
 textbox_y = obj_Overworld_Camera.y + 165;

border_color = #fa3943;


textbox_only_up = false
textbox_only_down = false

choice_number = 3;
choice_1 = "Can you make me escape?"
choice_2 = "Kill me."
choice_3 = "Who are you? And why do you look like me?"
choice_4 = "Am i dead? Why am i underground?"
selected_choice = 0;

font = fnt_dt_mono;
color = #f78b90;

mainchara = obj_mainchara
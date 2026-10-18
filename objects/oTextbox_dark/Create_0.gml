 //oTextox_dark create event

textbox_width = 485;
textbox_height = 145;
border = 10;
line_sep = 30;
line_width = 237;
txtb_sprite = sTextbox_dark;
txtb_image = 0;
txtb_image_spd = 0;
txtb_sound[0] = snd_text;
more_sounds = false; //If there are more than one person speaking
txtb_sounds = snd_text;

// The text
page = 0;
page_number = 0;
text[0] = " ";
text_length[0] = string_length(text[0]);
text_segments[0] = parse_colored_text(text[0])
draw_char = 0;
old_draw_char = 0;
text_speed = 1;
text_speed_skip = 3;
color = c_white;
font = fnt_dt_mono_BIG

setup = false;
speaker_text()
speaker_sprite[0] = noone;

image_speed = 1;
textbox_image_index = 0;
going_up = true;

skippable = true;
audio_stop = noone;

depth = -9999
global.dialogue = true;

mainchara = obj_mainchara
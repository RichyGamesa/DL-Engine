//oTextox_shop create event

textbox_width = 485;
textbox_height = 145;
border = 10;
line_sep = 15;
line_width = 237;
txtb_sprite = sTextbox_dark;
txtb_image = 0;
txtb_image_spd = 0;
txtb_sound[0] = snd_text;
more_sounds = false; //If there are more than one person speaking

// The text
page = 0;
txtb_sounds = txtb_sound[page];
page_number = 0;
text[0] = " ";
text_length[0] = string_length(text[0]);
text_segments[0] = parse_colored_text(text[0])
draw_char = 0;
old_draw_char = 0;
text_speed = 1;
color = c_white;
font = fnt_dt_mono;

setup = false;
speaker_text()
speaker_sprite[0] = noone;

image_speed = 1;

skippable = true;
audio_stop = noone;

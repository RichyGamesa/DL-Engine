//oTextbox Create event
textbox_width = 260;
textbox_height = 87;
border = 3;
line_sep = 13;
line_width = 237;
txtb_sprite = sTextbox_light;
txtb_image = 0;
txtb_image_spd = 0;
txtb_sound[0] = snd_text;
default_sound = txtb_sound;
more_sounds = false; //If there are more than one person speaking
txtb_sounds = snd_text;

border_theme = "Normal"
border_color = c_white;
color = c_white
portrait_color = border_color
textbox_only_up = false
textbox_only_down = false

// The text
page = 0;
page_number = 0;
text[0] = "Is that a cut on your face, or a part of your eye?";
text_length[0] = string_length(text[0]);
text_segments[0] = parse_colored_text(text[0])
draw_char = 0;
old_draw_char = 0;
text_speed = 1;
text_speed_skip = 3.5
change_audio_speed = false

font = fnt_dt_mono;

setup = false;

speaker_sprite[0] = noone;
speaker_text()

image_speed = 1;

skippable = true;
audio_stop = noone;

depth = -9999
global.dialogue = true;

mainchara = obj_mainchara


can_move_after = true
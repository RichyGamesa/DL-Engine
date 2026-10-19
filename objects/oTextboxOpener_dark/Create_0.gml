// create event (oTextboxOpener_dark)

textbox_width = 485;
textbox_height = 145;
border = 10;
line_sep = 30;
line_width = 237;

txtb_sprite = sTextbox_dark;
txtb_image = 0;
txtb_image_spd = 0;

txtb_sounds = snd_text;
default_sound = snd_text;
txtb_sound = array_create(500, snd_text);
more_sounds = false;

border_theme = array_create(500, "Normal");
border_color = array_create(500, c_white);

color = c_white;
portrait_color = c_white;
textbox_only_up = false;
textbox_only_down = false;

page = 0;
page_number = 0;

text[0] = "Is that a cut on your face, or a part of your eye?";
text_length[0] = string_length(text[0]);
text_segments[0] = parse_colored_text(text[0]);

draw_char = 0;
old_draw_char = 0;
text_speed = 1;
text_speed_skip = 3.5;

comma_pause = 15;
sentence_pause = 30;
break_pause = 5;
punctuation_timer = 0;

pitches = 1;
pitch = array_create(500, 1);

font = fnt_dt_mono;
setup = false;

speaker_sprite = array_create(500, noone);
speaker_mini = array_create(500, false);

speaker_text();

image_speed = 1;
skippable = true;
audio_stop = noone;

depth = -9999;
global.dialogue = true;

can_move_after = true;

needed_sprite = "everysprite";
mainchara = instance_find(obj_mainchara, 0);

start = false;
_instantiated = noone;

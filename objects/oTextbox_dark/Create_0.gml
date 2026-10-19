 //oTextox_dark create event
textbox_width = 490;
textbox_height = 120;
border = 10;
line_sep = 30;
line_width = 237;

txtb_sprite = sTextbox_dark;
textbox_image_index = 0;
txtb_image_spd = 0;

going_up = true;
going_down = false;

txtb_sounds = snd_text;
txtb_sound = array_create(500,txtb_sounds);


more_sounds = false; //If there are more than one person speaking


border_theme = array_create(500, "Normal");
border_color = array_create(500, c_white);

color = c_white;
portrait_color = c_white;
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
text_speed_skip = 3.5;

// Punctuation pauses (in steps/frames)
comma_pause = 15;
sentence_pause = 30;
break_pause = 5;

punctuation_timer = 0;

//Voice pitch
pitches = 1
pitch = array_create(500, 1);

font = fnt_dt_mono;

setup = false;

speaker_sprite = array_create(500,noone);
speaker_mini = array_create(500, false);


image_speed = 1;

skippable = true;
audio_stop = noone;

depth = -9999
global.dialogue = true;

mainchara = obj_mainchara


can_move_after = true

global.dialogue = true;

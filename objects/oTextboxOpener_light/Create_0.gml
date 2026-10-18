// create event (oTextboxOpener)
page = 0;
speaker_sprite[0] = noone;
txtb_sound = snd_text;
txtb_sounds = snd_text;
more_sounds = false;
audio_stop = noone;

textbox_only_up = false;
textbox_only_down = false;

text_speed = 1;
text_speed_skip = 3.5

change_audio_speed = false

color = c_white;

border_theme = "Normal"
border_color = c_white;
portrait_color = border_color
font = fnt_dt_mono;

can_move_after = true

speaker_text();

needed_sprite = "everysprite"

mainchara = obj_mainchara

start = false;
_instantiated = noone
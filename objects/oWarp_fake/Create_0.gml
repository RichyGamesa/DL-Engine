//Create event oWarp_fake
page = 0;
speaker_sprite[0] = noone;
txtb_sound = snd_text;
txtb_sounds = snd_text;
global.dialogue = true;
obj_mainchara.dialogue = true;
more_sounds = false;
audio_stop = noone;
text = "the pain itself is the reason why."
speaker_text();

if !global.darkworld
textbox = oTextbox_light
else
textbox = oTextbox_dark

mainchara = obj_mainchara;
triggered = false;

manual = true //if it decides where to go by itself, you can set it off in the creation code and put the cordinates yourself


	 _x = mainchara.pos_x[5];
	 _y = mainchara.pos_y[5];



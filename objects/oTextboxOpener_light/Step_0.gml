// step event



if (place_meeting(x, y, mainchara) and mainchara.can_move and ( needed_sprite == "everysprite" or  mainchara.sprite_index == needed_sprite)) or start
{
	if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)) or start
	{
 if _instantiated == noone or !instance_exists(oTextbox_light)
     _instantiated = instance_create_depth(0, 0, -9998, oTextbox_light);
    _instantiated.text = text;
    _instantiated.speaker_sprite = speaker_sprite;
    _instantiated.txtb_sound = txtb_sound;
	_instantiated.txtb_sounds = txtb_sounds;
	_instantiated.audio_stop = audio_stop //The audio that stops the skippable of the textbox
	_instantiated.more_sounds = more_sounds  //If there are more than one person speaking
	_instantiated.textbox_only_up = textbox_only_up;
    _instantiated.textbox_only_down = textbox_only_down;
	_instantiated.text_speed = text_speed;
	_instantiated.text_speed_skip = text_speed_skip;
	_instantiated.change_audio_speed = change_audio_speed;
	_instantiated.color = color;
	_instantiated.font = font;
	_instantiated.border_theme = border_theme
    _instantiated.border_color = border_color;
    _instantiated.portrait_color = portrait_color
	_instantiated.can_move_after = can_move_after
    _instantiated.mainchara = mainchara

	mainchara.can_move = false
	global.dialogue = true;
	}
}

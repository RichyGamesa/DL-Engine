if place_meeting(x,y, obj_mainchara) and !instance_exists(textbox)
{
	if !triggered and manual
	{
	 _x = mainchara.pos_x[5];
	 _y = mainchara.pos_y[5];
	triggered = true;
	}
	var box_of_text = instance_create_depth(0, 0, -9999, textbox);
    box_of_text.text = text;
    box_of_text.speaker_sprite = speaker_sprite;
    box_of_text.txtb_sound = txtb_sound;
	box_of_text.txtb_sounds = txtb_sounds;
	box_of_text.audio_stop = audio_stop //The audio that stops the skippable of the textbox
	box_of_text.more_sounds = more_sounds  //If there are more than one person speaking
	global.dialogue = true;
	
	//Send the player some steps back to not trigger it again
    mainchara.x = _x
    mainchara.y = _y

}

//Make sure the text won't start again after it ends.
if instance_exists(textbox)
{
if mainchara.pos_x[5] = x or place_meeting(x,y,mainchara)
mainchara.x = mainchara.pos_x[8]
if mainchara.pos_y[5] = y or place_meeting(x,y,mainchara)
mainchara.y = mainchara.pos_y[8]
}
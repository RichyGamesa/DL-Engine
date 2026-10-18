function shop_talk(argument0)
{
	keyboard_clear(ord("Z"))
	keyboard_clear(vk_enter)

var txt = instance_create_depth(0,0,-100,oTextbox_shop)

if argument0 == "How are you?"
{
txt.speaker_sprite[0] = spr_seam_talk;
txt.speaker_sprite[1] = spr_seam_talk;
txt.text[0] = "Does it truly matter when whatever we do will bring us to our death?"
txt.text[1] = "No, no it doesn't";
talk_choices[selected_button] = "Nihilism" //this replaces the talk option
talk_new[selected_button] = true //this makes it yellow
global.flag[2] = true //this makes it permanent
}

if argument0 == "Nihilism"
{
txt.speaker_sprite[0] = spr_seam_talk;
txt.speaker_sprite[1] = spr_seam_impatient;
txt.text[0] = "Jevil...view wasn't that wrong, there is no point in all of this"
txt.text[1] = "So i'll just wait, because i can't do anything else.";
talk_new[selected_button] = false;
}

if argument0 == "What do you sell?"
{
	txt.speaker_sprite[0] = spr_seam_talk;
	txt.text[0] = "Why don't you check it out yourself?"
}

if argument0 == "Determination?"
{
txt.speaker_sprite[0] = spr_seam_talk;
txt.speaker_sprite[1] = spr_seam_laught;
txt.speaker_sprite[2] = spr_seam_talk;
txt.text[0] = "Determination? Say how have you gotten familiar with that term?"
txt.text[1] = "The Queen?! My my, i didn't expect her to know so much";
txt.text[2] = "Anyway the only thing i know is that it's supposedly helps change fate"
}

if argument0 == "What should i ask you about?"
{
txt.speaker_sprite[0] =	spr_seam_impatient;
txt.text[0] = "You are talking to yourself creator";
}

if argument0 == "Inspection" //the thing of not choosing, you could make it so it changes dialogue
{
txt.text[0] = "* You try to see if there could be anyone here..."
txt.text[1] = "* But nobody came"
}


}
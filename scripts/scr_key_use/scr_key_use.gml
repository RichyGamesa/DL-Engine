function scr_key_use(argument0)
{

if argument0 == "Cell Phone"
{
  audio_play_sound(snd_smile,8,false)
  instance_destroy(obj_soul)
  instance_destroy(obj_menu_dark)
  draw_set_color(c_white)
  instance_create_depth(0,0,-999999,oTextbox_dark)
  oTextbox_dark.text[0] = "* You tried calling on your cellphone.";
  oTextbox_dark.text[1] = "* Nothing but garbage noise."
  oTextbox_dark.audio_stop = snd_smile; //again the audio that makes the textbox unskippable

}
if argument0 == "Star Walker"
{
   scr_sound_play(snd_cantselect)
}
if argument0 == "Lancer"
{
 scr_sound_play(snd_splat)
}
if argument0 == "Roulxs Kaard"
{
   scr_sound_play(snd_cantselect)
}
if argument0 == "object"
{
	scr_sound_play(snd_doorclose)
	//the sound could be anything you want
}

//this are the various things that happen when you press Z or ENTER on the object
}
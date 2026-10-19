if event = 0
{
	layer_set_visible("asset_cutscene",true)
	event = 1
}
if event = 1 and instance_exists(oTextbox_light) != true 
{
  instance_create_depth(0,70,-999,oTextbox_light)
  oTextbox_light.txtb_sounds = snd_txtsus;
  oTextbox_light.text[0] = "* KRIS!";
  oTextbox_light.text[1] = "* Finally!&Geez you sleep like a rock."
  oTextbox_light.speaker_sprite[0] = spr_face_s_what;
  oTextbox_light.speaker_sprite[1] = spr_face_s_angy;
  event = 2;
}
if event = 2 and !instance_exists(oTextbox_light) 
    {
	if instance_exists(obj_mainchara)
	{
	instance_destroy(obj_mainchara)
	}
	event = 3
}
if event = 3 
{
	instance_create_depth(486.5,146.5,0,obj_mainchara)
	event = 4
}
if event = 4 
{
	global.in_cutscene = false;
	global.flag[0] = true
	layer_set_visible("asset_cutscene",false)
	instance_destroy()
}

if (place_meeting(x, y, mainchara) and mainchara.can_move and ( needed_sprite == "everysprite" or  mainchara.sprite_index == needed_sprite)) or start
{
	if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)) or start
	{
		if q == 0
		{
		if !instance_exists(oTextbox_light)
		{
		instance_create_depth(x,y,-500,oTextbox_light)
		oTextbox_light.textbox_only_down = true;
		oTextbox_light.text = ["*You are forgetting something", "*There was ... something in between", "*There was a room in between", "*You open your eyes."]
		q = 1
		}
		}
	}
	
}

if q == 1
{
	instance_create_depth(0,0,-300,obj_BLACK)
	audio_stop_all()
	q = 2
}

if q == 2
{
if !instance_exists(oTextbox_light)
{
instance_create_depth(mainchara.x,mainchara.y,0,oWarp)
oWarp.target_room = rm_hospital_room1_3
oWarp.mainchara_image = KrisU
}
}
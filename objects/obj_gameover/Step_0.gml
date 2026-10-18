//Step event
if room != rm_death {instance_destroy()}
if image_alpha != 1 {image_alpha += 0.1}

if audio_exists(AUDIO_FAILURE) == false	 {audio_play_sound(AUDIO_FAILURE,10,false)}

if image_alpha == 1 
{
event = 1;


}

if event == 1 {
	
	if instance_exists(oTextbox_none) == false
	{instance_create_depth(0,80,-999,oTextbox_none)}
	event = 2
		
}
if event == 2 {
if speak <= 1.49 {
	
	oTextbox_none.text[0] = "IS THAT ALL YOU GOT?!"; 
	oTextbox_none.text[1] = "KRIS, WAKE UP!"; 
	oTextbox_none.txtb_sound = snd_txtsus;
	event = 3
	
}
	
	if speak >= 1.50{
	
	oTextbox_none.text[0] = "This is not your FATE"; 
	oTextbox_none.text[1] = "KRIS, WAKE UP!"; 
	oTextbox_none.txtb_sound = snd_txtral;
	event = 3
	
}
	
	
	
}
	
	show_debug_message(speak)
	
	if event == 3 { 
		
		if !audio_is_playing(AUDIO_FAILURE) {audio_play_sound(AUDIO_FAILURE,2,true)}
		
		if choice == 0 {image_index = 1}
		if keyboard_check_pressed(global.left){image_index = 2; choice = 1; audio_play_sound(snd_menumove,7,false)}
		if keyboard_check_pressed(global.right){image_index = 3; choice = 2; audio_play_sound(snd_menumove,7,false)}
		
		
		
		
		if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)
		{
			audio_stop_sound(AUDIO_FAILURE)
			audio_play_sound(snd_select,7,false);
			if choice = 1 
			{     
				scr_load_checkpoint()
				if global.member[1]  == true {instance_create_depth(obj_mainchara.x,obj_mainchara.y,obj_mainchara.depth,obj_follower_suzy)}
				if global.member[2] == true {instance_create_depth(obj_mainchara.x,obj_mainchara.y,obj_mainchara.depth,obj_follower_ralsei)}
			/*
			      if file_exists("Checkpoint") {game_load("Checkpoint")}
				  else
				  if file_exists("Save_"+string(global.filechoiche)) {game_load("Save_"+string(global.filechoiche))}
				  else
				  game_end()*/
			}
			if choice = 2 {room = rm_giveup}
		}
		
		}
			
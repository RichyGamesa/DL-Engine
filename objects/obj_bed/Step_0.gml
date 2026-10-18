// NPC step event
/*
if event = 0 {
if (place_meeting(x, y, obj_mainchara) && (keyboard_check(ord("Z")) || keyboard_check(vk_enter))) {
    keyboard_clear(vk_enter);
    keyboard_clear(ord("Z"));
    global.show_choice_prompt = true;
    global.selected_choice = 0;
    instance_create_depth(obj_mainchara.x, obj_mainchara.y, 0, oWall_cutscene);
    scr_display_choice_prompt("Are you sure you want to sleep?", "YES", "NO");
    event = 1;
    global.dialogue = true;
}
}

if event == 1
{
 if !instance_exists(oTextbox_light)
 {
	var txt = instance_create_depth(x,y,-500,oTextbox_light)
	 txt.text[0] = "Are you sure you want to go to sleep?";
	 event = 2
 }
}

if event == 2 {
    //scr_display_choice_prompt("Are you sure you want to sleep?","YES", "NO");
	if !instance_exists(obj_choice_light)
	{
	var choice = instance_create_depth(x,y,-1,obj_choice_light)
	choice.choice_number = 2
	choice.choice_1 = "Yes"
	choice.choice_2 = "No"
	event = 3;
	}
}

    if (global.selected_choice == 1) {
        instance_create_depth(0, 0, -99, oTextbox_light);
        oTextbox_light.text[0] = "*You decided to go to sleep.";
        obj_mainchara.can_move = false;
        instance_destroy(oWall_cutscene);
        instance_create_depth(0, 0, -55, oTransition_room);
		
		
		
			
			oTextbox_light.text[1] = "*But when you opened your eyes"; 
			oTransition_room.target_x = 349.5;
			oTransition_room.target_y = 209;
			oTransition_room.target_room = rm_castle_kris;
			audio_stop_all();
		global.cutscene = false;
		global.in_cutscene = false;
		instance_destroy(oWall_cutscene);
		global.member[1] = true;
	
		
		
		
    } else if (global.selected_choice == 2) {
        instance_create_depth(0, 0, -99, oTextbox_light);
        oTextbox_light.text[0] = "*You slept enough.";
        obj_mainchara.can_move = true;
        instance_destroy(oWall_cutscene);
        global.dialogue = false;
    }


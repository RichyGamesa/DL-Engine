// Step event of NPC object
/*
if (place_meeting(x, y, obj_mainchara) && keyboard_check_pressed(global.confirm)) {
	keyboard_clear(ord("Z"))
    global.choice = 0;
    
    if (event != 1) {
        instance_create_depth(obj_mainchara.x, obj_mainchara.y, 0, oWall_cutscene);
        scr_display_choice_prompt("IS HE HAPPY?","YES", "NO");
        global.cutscene = true;
		event = 1;
    }

if global.selected_choice == 1 {instance_create_depth(obj_mainchara.x,obj_mainchara.y,3,obj_follower_Toriel_dark);}

else if global.selected_choice == 2 {instance_destroy()}
}

if place_meeting(x, y, obj_mainchara) and obj_mainchara.can_move
{
    if !instance_exists(obj_ExampleCutscene)
    {
        // instance_create_depth(0, 0, 0, obj_ExampleCutscene)
    }

    if point == 0
    {
        point = 1;
        if !instance_exists(oTextbox_light)
        {
            instance_create_depth(x, y, depth, oTextbox_light);    
            oTextbox_light.text[0] = "* Are you okay Kris?";
            oTextbox_light.speaker_sprite[0] = spr_face_s_careful;
            oTextbox_light.txtb_sounds = snd_txtsus;
        }
    }
     if point == 1
    {
        if !instance_exists(oTextbox_light)
        {
            point = 2;
            if !instance_exists(obj_choice_light)
            {
                instance_create_depth(x, y, depth, obj_choice_light);    
            }
        }
    }
}
if place_meeting(x,y,obj_mainchara)
{
     if point == 3
    {
        if !instance_exists(oTextbox_light)
        {
            instance_create_depth(x, y, depth, oTextbox_light);    
            oTextbox_light.text[0] = "* ok";
            oTextbox_light.speaker_sprite[0] = spr_face_s_what;
            oTextbox_light.txtb_sounds = snd_txtsus;
        }    
        point = 4;
    }
	 if point == 4
	{
    if !instance_exists(oTextbox_light)
        {
	obj_mainchara.can_move = true;
	global.dialogue = false;	
		}
    global.flag[1] = true 
	instance_destroy()
	}
     if point == 5
    {
             room_goto(rm_death); 
    }
    
}
	
	  
	      if global.selected_choice == 1
        {
           
            point = 3;  // This should trigger when choice 1 is selected
			selected_a_choice = true;
			
        }
          if global.selected_choice == 2
        {
            
            point = 5;  // This should trigger when choice 2 is selected
			selected_a_choice = true;
			
        }
		

// Debug messages to confirm `point` and `global.selected_choice` states.



if obj_mainchara.flag[3] == true or global.flag[1] == true 
{
    instance_destroy();
}

show_debug_message("Debug: Point = " + string(point));
show_debug_message("Debug: Choice = " + string(global.selected_choice));

//oTransition_room step event
var menu = 0;

if global.darkworld
    menu = obj_menu_dark;
else
    menu = obj_Light_menu;

if instance_exists(menu)
{
    if instance_exists(obj_soul)
        instance_destroy(obj_soul);

    if instance_exists(obj_heart)
        instance_destroy(obj_heart);

    if instance_exists(mainchara)
        mainchara.can_move = true;

    instance_destroy(menu);
}


// TRANSITION STATES

switch (transition_state)
{
    // FADE IN
    case 0:

        if !transparent
        {
            image_alpha = min(image_alpha + transition_number, 1);
        }

        if image_alpha >= 1 || transparent
        {
            transition_state = 1;
        }

    break;


    // CHANGE ROOM AND WAIT FOR SOUND
	case 1:

	    if wait_sound // WAIT FOR SOUND
	    {
	        // Wait until the sound finishes
	        if sound_instance != -1 && audio_is_playing(sound_instance)
	        {
	            break; //exit, if wait sound was false it never entered
	        }
	    }

	    // CHANGE ROOM
	    if !room_change_started
	    {
	        room_change_started = true;

	        if room != target_room
	        {
	            if instance_exists(mainchara)
	            {
	                mainchara.x = target_x;
	                mainchara.y = target_y;
	                mainchara.sprite_index = mainchara_image;
	            }

	            room_goto(target_room);
	        }

	        transition_state = 2;
	    }

	break;


    // FADE OUT
    case 2:

        if does_fade
        {
            image_alpha = max(image_alpha - transition_number, 0);

            if image_alpha <= 0
            {
                transition_state = 3;
				
				 if can_move_after
					mainchara.can_move = true;
				
            }
        }
        else
        {
			if room = target_room
			{
				transition_state = 3;
			}
        }
		
		if !freed_mainchara
		{
			if can_move_after
						mainchara.can_move = true;
						
			freed_mainchara = true;
		}

    break;


    // DESTROY
    case 3:

            instance_destroy();

    break;
}
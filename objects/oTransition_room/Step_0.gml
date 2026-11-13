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

        image_alpha = min(image_alpha + transition_number, 1); //make the image alpha at most be 1

        if image_alpha >= 1
        {
            transition_state = 1;
			snd_play_no_repeat(sound) //play the sound if there's one
        }

    break;


    // CHANGE ROOM
    case 1:

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

    break;


    // FADE OUT
    case 2:
        
        image_alpha = max(image_alpha - transition_number, 0);

        if image_alpha <= 0
        {
            transition_state = 3;
        }

    break;


    // DESTROY
    case 3:

        if destroy_when_visible
        {
            instance_destroy();
        }

    break;
}
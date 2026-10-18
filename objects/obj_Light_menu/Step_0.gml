// Step Event
if active == true 
{
obj_mainchara.can_move = false;
obj_mainchara.move_spd = 0;

var t_x = camera_get_view_x(view_camera[0]);
var t_y = camera_get_view_y(view_camera[0]);


//Handle the start
if (image_index == 0) 
{
    // Menu Navigation
    if (instance_exists(obj_heart) == false) 
	{
        instance_create_depth(t_x + 15, t_y + 98, -9999909, obj_heart);
    }

    if (keyboard_check_pressed(global.up))
	{
        if (selected_button != 0) {
            selected_button -= 1;
            obj_heart.y -= 20;
        }
        audio_play_sound(snd_menumove, 10, false);
    }
	else if (keyboard_check_pressed(global.down)) 
	{
        if (selected_button != 2) {
            selected_button += 1;
            obj_heart.y += 20;
        }
        audio_play_sound(snd_menumove, 10, false);
    }

    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm)) 
	{
        audio_play_sound(snd_select, 10, false);
        keyboard_clear(vk_enter);
        keyboard_clear(ord("Z"));
        switch (selected_button) 
		{
            case 0: // Item
                image_index = 1;
                instance_destroy(obj_heart);
                break;
            case 1: // Stats
                image_index = 2;
                instance_destroy(obj_heart);
                break;
            case 2: // Cell
                image_index = 3;
                instance_destroy(obj_heart);
                audio_play_sound(snd_select, 10, false);
                break;
        }
    }

    if (keyboard_check_pressed(global.cancel) || keyboard_check_pressed(vk_shift)) 
	{
        audio_play_sound(snd_menumove, 1, false);
        instance_destroy(obj_heart);
        obj_mainchara.can_move = true;
        instance_destroy();
    }
}

// Handle Item Selection
if (image_index == 1) 
{
    if (did == 0) 
	{
        if (instance_exists(obj_heart) == false) 
		{
            instance_create_depth(t_x + 102, t_y + 45, -9999909, obj_heart);

        }

        if (keyboard_check_pressed(global.up)) 
		{
            if (selected_item != 0)
			{
                selected_item -= 1;
                obj_heart.y -= 17;
            }
            audio_play_sound(snd_menumove, 10, false);
        } else if (keyboard_check_pressed(global.down)) 
		{
            if (selected_item != item_button_max - 1)
			{
                selected_item += 1;
                obj_heart.y += 17;
            }
            audio_play_sound(snd_menumove, 10, false);
        }

        if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm)) 
		{
            audio_play_sound(snd_select, 10, false);
            keyboard_clear(vk_enter);
            keyboard_clear(ord("Z"));
            _x = obj_heart.x;
            _ys = obj_heart.y;
            instance_destroy(obj_heart);
            if (instance_exists(obj_heart) == false)
			{
                instance_create_depth(t_x + 96, t_y + 185, -9999909, obj_heart);
				
            }
            did = 1;
        }
    }
	 if (did == 1)
	{
		   if (keyboard_check_pressed(global.left)) 
		   {
        if (selected_button != 0)
		{
            selected_button -= 1;
            obj_heart.x -= 50;
        }
        audio_play_sound(snd_menumove, 10, false);
    } 
	else if (keyboard_check_pressed(global.right)) 
	{
        if (selected_button != 2)
		{
            selected_button += 1;
            obj_heart.x += 50;
        }
        audio_play_sound(snd_menumove, 10, false);
    }
		
  
 if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm))
 {
        audio_play_sound(snd_select, 10, false);
        keyboard_clear(vk_enter);
        keyboard_clear(ord("Z"))
		scr_itemL(global.light_items[selected_item])
		show_debug_message("Selected = " + string(selected_item))
        switch (selected_button)
		{
            case 0: // USE
                instance_destroy(obj_heart);
				if instance_exists(oTextbox_light) == false {instance_create_depth(0,0,-99999,oTextbox_light)}
				oTextbox_light.text[0] = global.Litem_usage
				show_debug_message(global.Litem_usage)
				if global.use_and_delete
				{
				array_delete(global.light_items,selected_item,1)
				}
				instance_destroy()
                break;
            case 1: // INFO
                instance_destroy(obj_heart);
				if instance_exists(oTextbox_light) == false {instance_create_depth(0,0,-99999,oTextbox_light)}
				oTextbox_light.text[0] = global.Litem_description
				show_debug_message(global.Litem_description)
				instance_destroy()
                break;
            case 2: // DROP
               instance_destroy(obj_heart);
				if instance_exists(oTextbox_light) == false {instance_create_depth(0,0,-99999,oTextbox_light)}
				oTextbox_light.text[0] = global.Litem_drop
				show_debug_message("Droppable = " + string(global.droppable))
				if global.droppable = true
				{array_delete(global.light_items,selected_item,1)}
				
				instance_destroy()
                break;
        }
 }
}
   
  if (keyboard_check_pressed(global.cancel) || keyboard_check_pressed(vk_shift))
  {
        if (did == 0)
		{
            audio_play_sound(snd_menumove, 1, false);
			instance_destroy(obj_heart)
            image_index = 0;
            if (instance_exists(obj_heart) == false) 
			{
				instance_create_depth(t_x + 15, t_y + 98, -9999909, obj_heart);
                selected_button = 0;
				selected_item = 0;
            }
        } 
		else if (did == 1) 
		{
            instance_destroy(obj_heart);
            instance_create_depth(_x, _ys, -999999, obj_heart)
			selected_button = 0;
			did = 0;
        }
    }
}

// Handle Info Menu                   look at draw event
if (image_index == 2)
{
    if (keyboard_check_pressed(global.cancel) || keyboard_check_pressed(vk_shift)) 
	{
        audio_play_sound(snd_menumove, 1, false);
        image_index = 0;
        if !instance_exists(obj_heart) 
		{
            instance_create_depth(t_x + 15, t_y + 118, -9999909, obj_heart);
            selected_button = 1;
        }
    }
}

// Handle Cell Menu
if (image_index == 3)
{
	
	if !instance_exists(obj_heart) 
	    {
            instance_create_depth(t_x + 107, t_y + 43, -9999909, obj_heart);

        }

        if (keyboard_check_pressed(global.up)) 
		{
            if (selected_cell != 0) 
			{
                selected_cell -= 1;
                obj_heart.y -= 17;
            }
            audio_play_sound(snd_menumove, 10, false);
        } 
		else if (keyboard_check_pressed(global.down)) 
		{
            if (selected_cell != numbers_call_max - 1) 
			{
                selected_cell += 1;
                obj_heart.y += 17;
				
            }
            audio_play_sound(snd_menumove, 10, false);
		}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm)) 
	{
        audio_play_sound(snd_select, 10, false);
        keyboard_clear(vk_enter);
        keyboard_clear(ord("Z"));
                instance_destroy(obj_heart);
				if instance_exists(oTextbox_light) == false {instance_create_depth(0,0,-99999,oTextbox_light)}
				oTextbox_light.skippable = false;
				oTextbox_light.text[0] = "* Ring....Ring";
				audio_play_sound(snd_phone,2,false)
				visible = false;
                show_debug_message("visible is " + string(visible))
                active = false;
				alarm[0] = 30;
				
                

 }
    if (keyboard_check_pressed(global.cancel) || keyboard_check_pressed(vk_shift)) 
	{
        audio_play_sound(snd_menumove, 1, false);
        image_index = 0;
        if !instance_exists(obj_heart) 
		{
            instance_create_depth(t_x + 15, t_y + 138, -9999909, obj_heart);
            selected_button = 2;
        }
		obj_heart.x = t_x + 15;
		obj_heart.y = t_y + 138;
		selected_button = 2
		
    }
}
}

if instance_exists(obj_heart)
{
obj_heart.image_xscale = 0.5;
obj_heart.image_yscale = 0.5;
}
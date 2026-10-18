// Step Event

// This part ensures that obj_soul is created if it doesn't exist and sets its scale if image_index is less than 1.
if image_index < 1 and !sell_mode and !talk
{
    if !instance_exists(obj_soul) 
	{
        instance_create_depth(t_x + 233, t_y + 133, -2, obj_soul);
        obj_soul.image_xscale = 0.5;
        obj_soul.image_yscale = 0.5;
    }
    else if obj_soul.x < 233 
	{
        instance_destroy(obj_soul);
        instance_create_depth(t_x + 233, t_y + 133, -2, obj_soul);
        obj_soul.image_xscale = 0.5;
        obj_soul.image_yscale = 0.5;
    }
}

// This part moves obj_soul to a specific position when image_index is between 0 and 2.
if buying_mode 
{

	if !confirm_buy
    if obj_soul.x > 27  
{
        instance_destroy(obj_soul);
        instance_create_depth(15, 142, -2, obj_soul);
        obj_soul.image_xscale = 0.5;
        obj_soul.image_yscale = 0.5;
    }
}


// This part handles keyboard input for navigation .
if !confirm_buy and !sell_mode and !soul_buy 
{
if keyboard_check_pressed(global.up) 
{
    if selected_button != 0 {
        selected_button = (selected_button - 1 + button_count) % button_count;
        obj_soul.y -= 20;
    }
    audio_play_sound(snd_menumove, 10, false);
    
} 
else if (keyboard_check_pressed(global.down)) 
{
    if selected_button != 3 {
        selected_button = (selected_button + 1) % button_count;
        obj_soul.y += 20;
    }
    audio_play_sound(snd_menumove, 10, false);
    
}
}

// This part handles keyboard input for selecting menu options.
if image_index < 1 
{
	
    if keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm) 
	{
		if  !sell_mode and !talk and !soul_buy
		{
        audio_play_sound(snd_select, 10, false);
		keyboard_clear(vk_enter)
		keyboard_clear(ord("Z"))
		displayed_current_index = 0;
        switch (selected_button) 
		{
            case 0: // Shop
			    buying_mode = true
                image_index = 1;
				current_text = buy_message;
                break;
            case 1: // Sell
                sell_mode = true
				current_text = sell_message;
				obj_soul.x = t_x + 25;
				obj_soul.y = t_y + 138;
                break;
            case 2: // Talk
                keyboard_clear(ord("Z"));
                keyboard_clear(vk_enter);
                audio_play_sound(snd_select, 10, false);
                Last_pos = obj_soul.y
				talk = true
				if choose_talk
				{
				obj_soul.x = t_x + 20;
				obj_soul.y = t_y + 144;
				last_y = t_y + 144;
				selected_button = 0;
				current_text = talk_message;
                displayed_current_index = 0;	
				confirm_buy = false;
				}
				else
				{
				image_index = 2;
				if instance_exists(obj_soul) {instance_destroy(obj_soul)}
				shop_talk(dialogue)
				}
                break;
            case 3: // Exit
			current_text = leave_message;
            alarm[1] = 30
			
                break;
		 }
        }
    }
}

// This part handles input for selecting items in the shop menu.
if buying_mode
{
	
if menu_shop_pos != 0
	{
	menu_shop_pos += 5;	
	}
if shop_keeper_x != (room_width/2) - 120
{
shop_keeper_x += -1	
}
	
if !confirm_buy
{	
  if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm) 
  {   

	  Last_pos = obj_soul.y;
	  obj_soul.x = t_x + 230;
	  obj_soul.y = t_y + 188;
	  confirm_buy = true
	 keyboard_clear(vk_enter)
     keyboard_clear(ord("Z"))
	  

}
  if keyboard_check(vk_shift) or keyboard_check(global.cancel)
{
    obj_soul.x = t_x + 233;
    obj_soul.y = t_y + 133;
    image_index = 0;
	displayed_current_index = 0;
    current_text = welcome_message
    buying_mode = false;
	selected_button = 0;
    keyboard_clear(vk_shift)
    keyboard_clear(ord("X"))
	if shop_keeper_x != (room_width/2) - 80
{
shop_keeper_x -= -1	
}
	menu_shop_pos = -90

}
}

if confirm_buy
{
if keyboard_check(global.up)
{
if soul_buy != 0 
{
	soul_buy = 0;
	obj_soul.y -= 15;
	
}
scr_sound_play(snd_menumove)
keyboard_clear(global.up)
}
if keyboard_check(global.down)
{
if soul_buy != 1
{
soul_buy = 1
obj_soul.y += 15
}

scr_sound_play(snd_menumove)
keyboard_clear(global.down)
}

if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
{
	keyboard_clear(vk_enter)
    keyboard_clear(ord("Z"))
if soul_buy = 0
{

    if global.gold > shop_prices[selected_button] 
		  {
		  audio_play_sound(snd_heavyswing,2,false)
		  global.gold -= shop_prices[selected_button]
		  show_debug_message("Selected = " + string(shop_items[selected_button]))
		  show_debug_message("Type = " + string(shop_desc_type[selected_button]))

	  
	  if shop_desc_type[selected_button] == "Item"
	  {
		  show_debug_message("Bought an ITEM!")
         add_items_dark(shop_items[selected_button])   
	  }
		  
	  if shop_desc_type[selected_button] == "Weapon"
	  {
		  show_debug_message("Bought a weapon!")
		  add_weapon(shop_items[selected_button])
	  }
	  
	  	  if shop_desc_type[selected_button] == "Armor"
	  {
		  show_debug_message("Bought an armor!")
		  add_armor(shop_items[selected_button])
	  }
		  
		  current_text = buy_confirm
}
	if global.gold < shop_prices[selected_button]
		  {
			current_text = buy_0_dollars  
		  }
		  
	obj_soul.x = 15;
    obj_soul.y = Last_pos;
    confirm_buy = false;
    soul_buy = 0;
	
audio_play_sound(snd_select,1,false)
}

if soul_buy = 1
{
	current_text = buy_refuse
	displayed_current_index = 0;
    obj_soul.x = 15;
    obj_soul.y = Last_pos;
    confirm_buy = false;
    soul_buy = 0;
	scr_sound_play(snd_heavyswing)
}

}
if keyboard_check(vk_shift) or keyboard_check(global.cancel)
{
obj_soul.x = 15;
obj_soul.y = Last_pos;
confirm_buy = false;	
current_text = buy_refuse;
displayed_current_index = 0;
soul_buy = 0;
audio_play_sound(snd_heavyswing,1,false)
keyboard_clear(vk_shift)
keyboard_clear(ord("X"))
}
}
}


if shop_keeper_x != (room_width/2) - 80 and !buying_mode
{
shop_keeper_x -= -1	
}	



if (sell_mode) 
{
    if (!selected_an_option_sell) 
	{
        if (keyboard_check_pressed(global.up)) 
		{
            if (selected_option_sell != 0) 
			{
                selected_option_sell -= 1;
                obj_soul.y -= 20;
            }
            audio_play_sound(snd_menumove, 10, false);
        } 
		else
		if (keyboard_check_pressed(global.down)) 
		{
            if (selected_option_sell != 4)
			{
                selected_option_sell += 1;
                obj_soul.y += 20;
            }
            audio_play_sound(snd_menumove, 10, false);
        }

        if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm))
		{
            keyboard_clear(vk_enter);
            keyboard_clear(ord("Z"));
            last_y = obj_soul.y;
            switch (selected_option_sell)
			{
                case 0:
                    array_sell = global.items_dark;
                    array_lenght = count_non_empty_elements(array_sell);
                    current_text = sell_item;
                    selected_an_option_sell = true;
                    obj_soul.x = t_x + 25;
                    obj_soul.y = t_y + 145;
                    break;
                case 1:
                    array_sell = global.weapons;
                    array_lenght = count_non_empty_elements(array_sell);
                    current_text = sell_weapon;
                    selected_an_option_sell = true;
                    obj_soul.x = t_x + 25;
                    obj_soul.y = t_y + 145;
                    break;
                case 2:
                    array_sell = global.armors;
                    array_lenght = count_non_empty_elements(array_sell);
                    current_text = sell_armor;
                    selected_an_option_sell = true;
                    obj_soul.x = t_x + 25;
                    obj_soul.y = t_y + 145;
                    break;
                case 3:
                    array_sell = global.items_dark_save;
                    array_lenght = count_non_empty_elements(array_sell);
                    current_text = sell_item;
                    selected_an_option_sell = true;
                    obj_soul.x = t_x + 25;
                    obj_soul.y = t_y + 145;
                    break;
                case 4:
                    sell_mode = false;
                    obj_soul.x = t_x + 233;
                    obj_soul.y = t_y + 153;
                    selected_button = 1;
                    selected_option_sell = 0;
                    selected_an_option_sell = false;
                    displayed_current_index = 0;
                    current_text = welcome_message;
                    break;
            }
            scr_sound_play(snd_select);
        }
        if (keyboard_check(vk_shift) or keyboard_check(global.cancel)) 
		{
            sell_mode = false;
            obj_soul.x = t_x + 233;
            obj_soul.y = t_y + 153;
            selected_option_sell = 0;
            selected_button = 1;
            displayed_current_index = 0;
            current_text = welcome_message;
            keyboard_clear(vk_shift);
            keyboard_clear(ord("X"));
        }
    }
    
	if (selected_an_option_sell) 
	{
        if (array_lenght <= 0 && selected_option_sell != 4) 
		{
            selected_an_option_sell = false;
            displayed_current_index = 0;
            current_text = sell_empty;
        }

        if (!confirm_buy) 
		{
            if (keyboard_check_pressed(global.up)) 
			{
                if (selected_sell != 0) {
                    selected_sell -= 1;
                    scroll_y -= item_height;
                }
                audio_play_sound(snd_menumove, 10, false);
            } 
			else if (keyboard_check_pressed(global.down)) 
			{
                if (selected_sell != array_lenght - 1) 
				{
                    selected_sell += 1;
                    scroll_y += item_height;
                }
                audio_play_sound(snd_menumove, 10, false);
            }

            if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)) 
			{
                keyboard_clear(vk_enter);
                keyboard_clear(ord("Z"));
				Last_pos = obj_soul.y;
                obj_soul.x = t_x + 230;
                obj_soul.y = t_y + 188;
                confirm_buy = true;
                scr_sound_play(snd_select);
                keyboard_clear(vk_enter);
                keyboard_clear(ord("Z"));
            }
            if (keyboard_check(vk_shift) or keyboard_check(global.cancel)) 
			{
                selected_an_option_sell = false;
                selected_sell = 0;
                scroll_y = 0;				
                obj_soul.y = last_y;
				current_text = sell_message;
				displayed_current_index = 0;
                keyboard_clear(vk_shift);
                keyboard_clear(ord("X"));
            }
        }
        if (confirm_buy) 
		{
            if (keyboard_check(global.up)) 
			{
                if (soul_buy != 0) {
                    soul_buy = 0;
                    obj_soul.y -= 15;
                }
                scr_sound_play(snd_menumove);
                keyboard_clear(global.up);
            }
            if (keyboard_check(global.down))
			{
                if (soul_buy != 1) {
                    soul_buy = 1;
                    obj_soul.y += 15;
                }
                scr_sound_play(snd_menumove);
                keyboard_clear(global.down);
            }

            if (keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm)) {
                keyboard_clear(vk_enter);
                keyboard_clear(ord("Z"));

                if (soul_buy == 0) {
                    obj_soul.x = t_x + 25;
                    obj_soul.y = t_y + 145;
                    global.gold += value;
                    array_delete(array_sell, selected_sell, 1);
                    array_lenght -= 1;  // Update the length of the array
                    current_text = sell_yes;
                    confirm_buy = false;
                    soul_buy = 0;
					if array_lenght = 0
					{
					 obj_soul.y = last_y;	
					}
                    scr_sound_play(snd_swing);
                    audio_sound_pitch(snd_swing, 0.5);
                }

                if (soul_buy == 1) {
                    obj_soul.x = t_x + 25;
                    obj_soul.y = Last_pos;
                    confirm_buy = false;
                    displayed_current_index = 0;
                    current_text = sell_no;
                    confirm_buy = false;
                    soul_buy = 0;
                    scr_sound_play(snd_swing);
                }
            }

            if (keyboard_check(vk_shift) or keyboard_check(global.cancel)) 
			{
                keyboard_clear(vk_shift);
                keyboard_clear(ord("X"));
                obj_soul.x = t_x + 25;
                obj_soul.y = Last_pos;
                confirm_buy = false;
                displayed_current_index = 0;
                current_text = sell_no;
                confirm_buy = false;
                soul_buy = 0;
                scr_sound_play(snd_swing);
            }
        }
    }
}


if talk = true
{
if !choose_talk
{
    if !instance_exists(oTextbox_shop)
	{
	image_index = 0;
	if !instance_exists(obj_soul)
	{
		instance_create_depth(t_x + 20 ,Last_pos, -2,obj_soul)
		obj_soul.image_xscale = 0.5;
        obj_soul.image_yscale = 0.5;
	}
	talk = false;
	}
}
else
{
if soul_buy == false
{
image_index = 0;
if !instance_exists(obj_soul)
	{
		instance_create_depth(t_x + 20 ,last_y, -2,obj_soul)
		obj_soul.image_xscale = 0.5;
        obj_soul.image_yscale = 0.5;
	}
if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
{
	keyboard_clear(ord("Z"))
	keyboard_clear(vk_enter)
	shop_talk(talk_choices[selected_button])
	soul_buy = true;
	last_y = obj_soul.y


}
if keyboard_check(vk_shift) or keyboard_check(global.cancel)
{
    obj_soul.x = t_x + 233;
    obj_soul.y = Last_pos;
    image_index = 0;
	displayed_current_index = 0;
    current_text = welcome_message
    confirm_buy = false;
	selected_button = 2;
	talk = false;
    keyboard_clear(vk_shift)
    keyboard_clear(ord("X"))
}
}
if soul_buy
{
image_index = 2;
if instance_exists(obj_soul)
instance_destroy(obj_soul)
}

}
}


if (displayed_current_index < string_length(current_text)) 
{
    displayed_current_index += display_speed; // Increase index based on display speed
    displayed_current = string_copy(current_text, 1, displayed_current_index); // Extract text up to current index
    shop_keeper_current_sprite = shop_keeper_talk;
	
}
else
{
displayed_current = current_text
if !soul_buy 
shop_keeper_current_sprite = shop_keeper_idle;

}
if !soul_buy 
{
shop_keeper_image_index += 0.25
}
empty_longness = 12 - count_non_empty_elements(global.items_dark)
empty_longness_save = 45 - count_non_empty_elements(global.items_dark_save)
empty_longness_weapon = 48 - count_non_empty_elements(global.weapons)
empty_longness_armor = 48 - count_non_empty_elements(global.armors)
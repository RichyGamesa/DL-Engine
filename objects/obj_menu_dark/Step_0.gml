// Step event

//Show the sprite of the menu
if image_alpha != 1
{
 	image_alpha += 0.05
}

// Variable initialization
isUneven = (key_selected % 2);
isUneven_item = (item_selected % 2);
obj_mainchara.can_move = false;

x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

// Check if active
if active == true 
{
    // Handle button selection
    if (keyboard_check_pressed(global.left))
	{
        if selected_button != 0
		{
            selected_button = (selected_button - 1 + button_count) % button_count;
        }
        audio_play_sound(snd_menumove,10,false);
        if image_index != 0 
		{
            image_index = image_index - 1;
        }
    } else if (keyboard_check_pressed(global.right)) 
	{
        if selected_button != 3
		{
            selected_button = (selected_button + 1) % button_count;
        }
        audio_play_sound(snd_menumove,10,false);
        if image_index != 3
		{
            image_index = image_index + 1;
        }
    }
}

// Check if not active
if active == false 
{
    // Handle sub-menu navigation
	if item_menu_active == true
	{
    if key_menu == false and item_menu == false and toss == false 
	{
        if (keyboard_check_pressed(global.left))
		{
            if selected_other != 0
			{
				if selected_other == 1
				{
                selected_other -= 1;
                obj_soul.x -= 90;
				}
				else
				{
				selected_other -= 1;	
				obj_soul.x -= 110;
				}
            }
            audio_play_sound(snd_menumove,10,false);
        }
		else if (keyboard_check_pressed(global.right))
		{
            if selected_other != 3
			{
				if selected_other == 0
				{
                selected_other += 1;
                obj_soul.x += 90;
				}
				else
				{
				selected_other += 1;	
				obj_soul.x += 110;
				}
            }
            audio_play_sound(snd_menumove,10,false);
        }
    }

    // Handle key menu navigation
    if key_menu == true
	{
        // Handle left movement
        if (keyboard_check_pressed(global.left))
		{
            if key_selected > 0 
			{
                key_selected -= 1;
                if isUneven != 0
				{
                    obj_soul.x -= 242;
                }
            }
            if key_selected > 0
			{
                if isUneven == 0 
				{
                    obj_soul.x = 352;
                    obj_soul.y -= 33;
                }
            }
            audio_play_sound(snd_menumove,10,false);
        } else if (keyboard_check_pressed(global.right))
		{
            if (key_selected + 1) != lenght_key
			{
                key_selected += 1;
                obj_soul.x += 242;
            }
            if (key_selected + 2) <= lenght_key and key_selected != lenght_key
			{
                if key_selected == 2 or key_selected == 4 or key_selected == 6 or key_selected == 8
				{
                    obj_soul.x = x + 110;
                    obj_soul.y += 33;
                }
            }
            audio_play_sound(snd_menumove,10,false);
        }
        // Handle down movement
        if keyboard_check_pressed(global.down)
		{
            if key_selected + 2 < lenght_key 
			{
                key_selected += 2;
                obj_soul.y += 33;
            }
            audio_play_sound(snd_menumove,10,false);
        }
        // Handle up movement
        if keyboard_check_pressed(global.up) 
		{
            if key_selected - 2 >= 0
			{
                key_selected -= 2;
                obj_soul.y -= 33;
            }
            audio_play_sound(snd_menumove,10,false);
        }
    }
    
    // Handle item menu navigation
    if item_menu == true or toss == true 
	{
if (selecting_item == true) 
{
    // Handle left movement
    if (keyboard_check_pressed(global.left)) 
	{
        if (item_selected % max_items_per_row != 0)
		{
            item_selected -= 1;
            obj_soul.x -= (item_width + item_spacing) - 5;
        }
        audio_play_sound(snd_menumove, 10, false);
    } 
	else if (keyboard_check_pressed(global.right)) 
	{
        if (item_selected % max_items_per_row != max_items_per_row - 1 && item_selected != longness - 1)
		{
            item_selected += 1;
            obj_soul.x += (item_width + item_spacing) - 5;
        }
        audio_play_sound(snd_menumove, 10, false);
    }
    // Handle up movement
    if (keyboard_check_pressed(global.up)) 
	{
        if (item_selected - max_items_per_row >= 0)
		{
            item_selected -= max_items_per_row;
            obj_soul.y -= item_height + item_spacing;
        }
        audio_play_sound(snd_menumove, 10, false);
    }
    // Handle down movement
    if (keyboard_check_pressed(global.down)) 
	{
        if (item_selected + max_items_per_row < longness)
		{
            item_selected += max_items_per_row;
            obj_soul.y += item_height + item_spacing;
        }
        audio_play_sound(snd_menumove, 10, false);
    }
}

    }
	}
	
	
}
	



// Handle X key press
if active == true 
{
    if keyboard_check_pressed(global.cancel) or keyboard_check_pressed(vk_shift)
	{
        obj_mainchara.can_move = true;
        active = false;
        instance_destroy();
    }
} 
else 
if active == false 
{
    // Handle X key press when sub-menu is active
if keyboard_check(vk_shift) or keyboard_check(global.cancel)
{

    //item sub-menu
    if item_menu_active == true 
	{
        if key_menu == false and item_menu == false and toss == false {
            
                selected_other = 0;
                key_menu = false;
                item_menu = false;
                active = true;
                item_menu_active = false;
                equip_menu_active = false;
                power_menu_active = false;
                options_menu_active = false;
                instance_destroy(obj_soul);
				keyboard_clear(ord("X"))
		        keyboard_clear(vk_shift)
        
        } else {
			if key_menu == true or toss == true or item_menu == 1 and selecting_item == true
			{
            
                image_index = 0;
                key_selected = 0;
                item_selected = 0;
                key_menu = false;
                item_menu = false;
                toss = false;
                item_menu_active = true;
                obj_soul.x = last_x;
                obj_soul.y = y + 133;
				keyboard_clear(ord("X"))
		        keyboard_clear(vk_shift)
            
	}
        }
    }
	
	//Info sub-menu
	if power_menu_active == true
	{
		if selecting_magic == false
		{
	 
	    power_menu_active = false;
		active = true;
		if instance_exists(obj_soul)
		{
		  instance_destroy(obj_soul)	
		}
		 keyboard_clear(ord("X"))
		 keyboard_clear(vk_shift)
	  }
		
		if selecting_magic == true
		{
	
		if instance_exists(obj_soul)
		{
		 obj_soul.x = last_x;
		 obj_soul.y = y + 150;
		}
		 image_index = 2;
		 selected_power = -999; 
		 selecting_magic = false;
		 keyboard_clear(ord("X"))
		 keyboard_clear(vk_shift)
	  
	}
}	
	
	//Equip sub-menu
	if equip_menu_active == true
	{ 
		if selecting_person == true
		{
		selected_member_equip = 0;
        selecting_person = false;
        equip_menu_active = false;
		active = true;
		if instance_exists(obj_soul)
		{
		  instance_destroy(obj_soul)	
		}
		}
		else
		if (selecting_bars)
		{
		 	if instance_exists(obj_soul)
		{
		 obj_soul.x = last_x;
		 obj_soul.y = y + 150;
		}
		 image_index = 1;
		 selected_bar = 0; 
		 selecting_bars = false;
		 selecting_person = true;
		 keyboard_clear(ord("X"))
		 keyboard_clear(vk_shift)
		}
		else
		if (selecting_weapon) or (selecting_armor)
		{

		  obj_soul.x = x + 326;
		  obj_soul.y = last_y	
		  selecting_weapon = false;
		  selecting_armor = false;
		  selecting_bars = true;
		  keyboard_clear(ord("X"))
		  keyboard_clear(vk_shift)
		}
	}
	
	//Option sub-menu
	if options_menu_active == true
	{
		if selected_volume
		{
			selected_volume = false
		    keyboard_clear(ord("X"))
		    keyboard_clear(vk_shift)
		}
		else
		if !controls
		{
	  	options_menu_active = false
		active = true
		option_selected = 0;
		if instance_exists(obj_soul)
		{
		  instance_destroy(obj_soul)	
		}
		keyboard_clear(ord("X"))
		keyboard_clear(vk_shift)
		}
	}

}
}


// Main menu button selection handling
if active == true 
{
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm)) 
	{
        if (selected_button < 4) 
		{
			scr_sound_play(snd_swing)
            switch (selected_button)
			{
                case 0: // Items
                    active = false;
                    item_menu_active = true;
                    item_menu = false;
                    toss = false;
                    key_menu = false;
					keyboard_clear(ord("Z"))
		            keyboard_clear(vk_enter)
                    break;
                case 1: // Equip
                    active = false;
                    equip_menu_active = true;
					selected_member_equip = 0;
                    selecting_person = true;
					selecting_weapon = false
                    selecting_armor = false;
					keyboard_clear(ord("Z"))
		            keyboard_clear(vk_enter)
                    break;
                case 2: // Power
                    active = false;
                    power_menu_active = true;
					selected_info = 0;
					selecting_magic = false
					dog = random_range(1,10)
					keyboard_clear(ord("Z"))
		            keyboard_clear(vk_enter)
                    break;
                case 3: // Options
                    active = false;
                    options_menu_active = true;
					keyboard_clear(ord("Z"));
                    keyboard_clear(vk_enter);
                    break;
            }
        }
    }
}

// Check item menu activation
if item_menu_active == true 
{
    if instance_exists(obj_soul) == false
	{
        instance_create_depth(x + 160, y + 133, -99991, obj_soul);
    }
    if selected_other > 2 
	{
        selected_other = 2;
        obj_soul.x = 350;
    }
    if selected_other > 1 
	{
        if key_menu == false 
		{
            if keyboard_check_pressed(vk_enter) or keyboard_check_pressed(global.confirm) {
                keyboard_clear(ord("Z"));
                keyboard_clear(vk_enter);
                last_x = obj_soul.x;
                key_menu = true;
                obj_soul.x = x + 110;
                obj_soul.y = y + 165;
                image_index = 4;
            }
        }
    }

    if selected_other <= 2 and selected_other >= 0
	{
    if item_menu == false and toss == false
	{
        if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
		{
            if selected_other == 0
			{
                if longness > 0
				{
                    keyboard_clear(ord("Z"));
                    keyboard_clear(vk_enter);
                    item_menu = true;
                    last_x = obj_soul.x;
                    obj_soul.x = x + 110;
                    obj_soul.y = y + 165;
                    image_index = 4;
                }
            }
            if selected_other == 1
			{
                if longness > 0
				{
                    keyboard_clear(ord("Z"));
                    keyboard_clear(vk_enter);
                    toss = true;
                    last_x = obj_soul.x;
                    obj_soul.x = x + 110;
                    obj_soul.y = y + 165;
                    image_index = 4;
                }
            }
        selecting_item = true;
		}
    }
}

// Check key menu activation
if key_menu == true 
{
    if key_selected >= 0 && key_selected < array_length(global.items_key)
	{
        scr_key_info(global.items_key[key_selected]);
        if array_contains(global.items_key, "Lancer")
		{
            if instance_exists(obj_pocket_lancer) == false 
			{
                instance_create_depth(x + 300, y + 279, -10000, obj_pocket_lancer);
            }
        }
    }
    if keyboard_check(global.confirm) or keyboard_check(vk_enter) 
	{
        keyboard_clear(ord("Z"));
        keyboard_clear(vk_enter);
        scr_key_use(global.items_key[key_selected]);
    }
}

// If the ITEM sub menu is active
if (item_menu == true)
{
    // Check if the player presses the Z key
    if (selecting_item == true) {
        if (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter))  {
            // Check if there is a selected item
            if (item_selected != -1) {
                // Now the player has selected an item, so we need to handle the next step
                selecting_item = false;
                selecting_member = true;
				selected_party_member = 0;
                obj_soul.image_alpha = 0;
                keyboard_clear(ord("Z"));
                keyboard_clear(vk_enter);
				show_debug_message("ITEM CONFIRMED");
				show_debug_message("itemtarget = " + string(global.itemtarget));
				show_debug_message("usable = " + string(global.usable));
				show_debug_message("hp amount = " + string(hp));
				show_debug_message("selected member index = " + string(selected_party_member));
				//show_debug_message(global.hp_S)
            }
        }
    }
    // Go back to selecting the item 
    if (keyboard_check_pressed(global.cancel) || keyboard_check_pressed(vk_shift)) {
        obj_soul.image_alpha = 1;
        selecting_member = false;
        selecting_item = true;
		keyboard_clear(ord("X"))
		keyboard_clear(vk_shift)
    }

   /// Constants
enum ItemTarget {
    MEMBER = 1,
    ALL = 2
}

/// Check if the player is selecting a party member
if (selecting_member) 
{
    scr_iteminfo(global.items_dark[item_selected]);
	
 
    // Handle left and right movement
    if (keyboard_check_pressed(global.left)) {
        // Move to the previous party member
       if selected_party_member != 0
	   {selected_party_member -= 1;}
		else
		{selected_party_member = global.num_active_members - 1}
        audio_play_sound(snd_menumove, 2, false);
    }
    if (keyboard_check_pressed(global.right)) {
        // Move to the next party member
		if selected_party_member < global.num_active_members
        selected_party_member += 1
		if selected_party_member >= global.num_active_members or selected_party_member > 2
		{
		 selected_party_member = 0;	
		}
        audio_play_sound(snd_menumove, 2, false);

    }
    // Check if the player confirms their choice by pressing Z or Enter
    if (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter)
	) {
        
        
        // Confirming item use
        var _item_name = global.items_dark[item_selected];
        var _member_name = global.party_order[selected_party_member];

        // Recalculate the item's properties for the actual target.
        // This is important for character-specific teas and food.
        eaten = true;
        scr_iteminfo(_item_name);

        var _target_mode = global.itemtarget;
        var _can_use = global.usable;
        var _used = false;
        var _revive_item = (
            _item_name == stringsetloc("ReviveMint")
            || _item_name == stringsetloc("ReviveDust")
            || _item_name == stringsetloc("ReviveBrite")
        );

        if (_can_use && _target_mode != 0)
        {
            // One-character revival
            if (_item_name == stringsetloc("ReviveMint"))
            {
                var _member = scr_get_member_data(_member_name);

                if (!is_undefined(_member))
                {
                    var _current_hp = variable_global_get(_member.hpVar);
                    var _max_hp = variable_global_get(_member.maxHpVar);

                    if (_current_hp <= 0)
                    {
                        Scr_healtarget(
                            _member_name,
                            _max_hp,
                            true
                        );
                        _used = true;
                    }
                }
            }
            // Team revival items
            else if (
                _item_name == stringsetloc("ReviveDust")
                || _item_name == stringsetloc("ReviveBrite")
            )
            {
                var _revived_anyone = false;

                for (var i = 0; i < array_length(global.party_order); i++)
                {
                    var _party_name = global.party_order[i];
                    var _member = scr_get_member_data(_party_name);

                    if (is_undefined(_member))
                        continue;

                    var _current_hp = variable_global_get(_member.hpVar);
                    var _max_hp = variable_global_get(_member.maxHpVar);

                    // Only revive fallen members.
                    if (_current_hp <= 0)
                    {
                        var _revive_hp = _max_hp;

                        if (_item_name == stringsetloc("ReviveDust"))
                            _revive_hp = ceil(_max_hp * 0.25);

                        Scr_healtarget(_party_name, _revive_hp, true);
                        _revived_anyone = true;
                    }
                }

                _used = _revived_anyone;
            }
            // Ordinary single-target healing
            else if (_target_mode == 1)
            {
                Scr_healtarget(_member_name, hp, false);
                _used = true;
            }
            // Ordinary team healing
            else if (_target_mode == 2)
            {
                for (var i = 0; i < array_length(global.party_order); i++)
                {
                    Scr_healtarget(global.party_order[i], hp, false);
                }

                _used = true;
            }
        }
        show_debug_message("=== ITEM USE RESULT ===");
show_debug_message("Item: " + string(_item_name));
show_debug_message("Used: " + string(_used));
show_debug_message("Target mode: " + string(_target_mode));
show_debug_message("HP amount: " + string(hp));
show_debug_message("Target: " + string(_member_name));

var _debug_member = scr_get_member_data(_member_name);
show_debug_message("Member HP variable name: " + string(_debug_member.hpVar));
show_debug_message("Global HP directly: " + string(global.hp_S));
show_debug_message("Global max HP directly: " + string(global.maxhp_S));
        if (_used)
        {
            // Preserve the ClubsSandwich bonus.
            if (
                _item_name == stringsetloc("ClubsSandwich")
                && global.member[3] == true
            )
            {
                Scr_healtarget("Kris", 70, false);
            }

            // Consume the selected item, unless it transforms into another.
            if (_item_name == stringsetloc("DD-Burger"))
            {
                array_delete(global.items_dark, item_selected, 1);
                array_insert(global.items_dark, item_selected, "Darkburger");
            }
            else if (!replaceable)
            {
                array_delete(global.items_dark, item_selected, 1);
            }

            audio_play_sound(snd_power, 2, false);

            acomment = true;
            lastamessage2temp = amessage2temp;
            lastamessage3temp = amessage3temp;
            lastamessage5temp = amessage5temp;
            old_selected_member = selected_party_member;
            old_reactions = more_reactions;

            amessagetemp_alpha = 1;
            previous_hp = hp;
            draw_hp = true;
            move_hp = 0;
            hp_alpha = 1;
        }
        else
        {
            // Don't consume a revival item if nobody could be revived.
            eaten = false;
            scr_iteminfo(_item_name);
        }

        // Reset selection state
        selecting_member = false;
        image_index = 0;
        key_selected = 0;
        item_selected = 0;
        item_menu = false;

        if (instance_exists(obj_soul))
        {
            obj_soul.x = last_x;
            obj_soul.y = y + 133;
            obj_soul.image_alpha = 1;
        }

        selected_party_member = 999;
        alarm[0] = 10;
        alarm[1] = 180;

        keyboard_clear(ord("Z"));
        keyboard_clear(vk_enter);

     }
  }
}

// Handle tossing items
if toss == true 
{
    if keyboard_check(global.confirm) or keyboard_check(vk_enter) {
        keyboard_clear(ord("Z"));
        keyboard_clear(vk_enter);
        array_delete(global.items_dark, item_selected, 1);
        show_debug_message(string(global.items_dark));
        audio_play_sound(snd_heavyswing,2,false);
        image_index = 0;
        key_selected = 0;
        item_selected = 0;
        obj_soul.x = last_x;
        obj_soul.y = y + 133;
        toss = false;
        show_debug_message("Tossed item");
    }
}
}

lenght_key = array_length(global.items_key);
longness = array_length(global.items_dark);


// Equip weapon or armor
if (equip_menu_active) 
{
    var soul_x = x + 270 - 150;
    var soul_y = y + 276 - 5 - 102;
    
    scr_find_equipment(global.party_order[selected_member_equip]);
    
    if (!instance_exists(obj_soul)) {
        if (global.num_active_members == 1) {
            instance_create_depth(soul_x + 53, y + 150, -999999, obj_soul);
        } else if (global.num_active_members == 2) {
            distance_soul = 55;    
            instance_create_depth(soul_x, soul_y - 20, -999999, obj_soul);
        } else if (global.num_active_members == 3) {
            distance_soul = 45;    
            instance_create_depth(soul_x, soul_y - 20, -999999, obj_soul);
        }
    }
    
    if (global.num_active_members == 1) {
        selected_member_equip = 0; // There is only one member so it has to be 0
    }
    
    if (selecting_person) 
	{
        if (keyboard_check(global.left)) 
		{
            keyboard_clear(global.left);    
            if (selected_member_equip != 0) 
			{
                selected_member_equip -= 1;
                obj_soul.x -= distance_soul;
				
            }
			scr_sound_play(snd_menumove)
        }
        if (keyboard_check(global.right)) 
		{
            keyboard_clear(global.right);
            if (selected_member_equip != global.num_active_members - 1)
			{
                selected_member_equip += 1;
                obj_soul.x += distance_soul;
            }
            scr_sound_play(snd_menumove)
        }
        if (keyboard_check(ord("Z")) || keyboard_check(vk_enter)) 
		{
            scr_findmember(global.party_order[selected_member_equip]);
            selecting_person = false;
            selecting_bars = true;
            last_x = obj_soul.x;
            obj_soul.x = x + 326;
            obj_soul.y = y + 276 - 138;
            image_index = 4;	
            keyboard_clear(ord("Z"));
            keyboard_clear(vk_enter);
        }
    } 
    else if (selecting_bars) {
        if (selected_bar == 0) { line_1 = true; } if (line_1) { line_2 = false; line_3 = false; }
        if (selected_bar == 1) { line_2 = true; } if (line_2) { line_1 = false; line_3 = false; }
        if (selected_bar == 2) { line_3 = true; } if (line_3) { line_1 = false; line_2 = false; }
		 
        if (keyboard_check(global.up)) {
            keyboard_clear(global.up);    
            if (selected_bar != 0) {
                selected_bar -= 1;
                obj_soul.y -= 25;
            }
            scr_sound_play(snd_menumove)
        }
        
        if (keyboard_check(global.down)) {
            keyboard_clear(global.down);    
            if (selected_bar != 2) {
                selected_bar += 1;
                obj_soul.y += 25;
            }				
            scr_sound_play(snd_menumove)
        }
        
        if (keyboard_check(ord("Z")) || keyboard_check(vk_enter)) {
            last_y = obj_soul.y;
            selecting_bars = false;
            if (line_1) {
                scroll_y = 0;
                weapon_selected = 0;
                selecting_weapon = true;
            } else {
                scroll_y = 0;
                armor_selected = 0;
                selecting_armor = true;
            }
            obj_soul.x = x + 332;
            obj_soul.y = y + 233;
            keyboard_clear(ord("Z"));
            keyboard_clear(vk_enter);
        }
    }
    else if (selecting_weapon) {
        var max_scroll_y = max(0, array_length(global.weapons) * item_height - view_height);
        show_debug_message("Selected weapon = " + string(global.weapons[weapon_selected]));
        scr_weaponinfo(global.weapons[weapon_selected]);

        if (keyboard_check(global.up)) {
            if (weapon_selected > 0) {
                weapon_selected -= 1;
                scroll_y = max(scroll_y - item_height, 0);
                keyboard_clear(global.up);
				scr_sound_play(snd_menumove)
            }
        } 
        else if (keyboard_check(global.down)) {
            if (weapon_selected < array_length(global.weapons) - 1) {
                weapon_selected += 1;
                scroll_y = min(scroll_y + item_height, max_scroll_y);
                keyboard_clear(global.down);
				scr_sound_play(snd_menumove)
            }
        }
        
        if (keyboard_check(ord("Z")) || keyboard_check(vk_enter)) {
			amessagetemp_alpha = 1 //Make sure that the message will appear even if another one is fading
            if (equipping_kris) {
                if (weaponchar1temp) {
                    global.weapons[weapon_selected] = global.weapon[0]; 
                    global.weapon[0] = weaponnametemp;
                    scr_equip_weapon();
                    weapon_selected = 0;
                    selecting_weapon = false;
                    selecting_bars = true;
                    obj_soul.x = x + 326; 
                    obj_soul.y = last_y;
                    if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
                } else {
                    if (!audio_is_playing(snd_cantselect)) { audio_play_sound(snd_cantselect, 2, false); }
                }
            }
            if (equipping_susie) {
                if (weaponchar2temp) {
                    global.weapons[weapon_selected] = global.weapon[1]; 
                    global.weapon[1] = weaponnametemp;
                    scr_equip_weapon();
                    weapon_selected = 0;
                    selecting_weapon = false;
                    selecting_bars = true;
                    obj_soul.x = x + 326; 
                    obj_soul.y = last_y;
                    if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
                }
				else
				{
                    if (!audio_is_playing(snd_cantselect)) { audio_play_sound(snd_cantselect, 2, false); }
                }
					acomment = true;
					lastamessage2temp = amessage2temp
            }
            if (equipping_ralsei) {
                if (weaponchar3temp) {
                    global.weapons[weapon_selected] = global.weapon[2]; 
                    global.weapon[2] = weaponnametemp;
                    scr_equip_weapon();
                    weapon_selected = 0;
                    selecting_weapon = false;
                    selecting_bars = true;
                    obj_soul.x = x + 326; 
                    obj_soul.y = last_y;
                    if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
                } 
				else 
				{
                    if (!audio_is_playing(snd_cantselect)) { audio_play_sound(snd_cantselect, 2, false); }
                }
					acomment = true;
					lastamessage3temp = amessage3temp
            }
            if (equipping_toriel) {
                if (weaponchar5temp) {
                    global.weapons[weapon_selected] = global.weapon[3]; 
                    global.weapon[3] = weaponnametemp;
                    scr_equip_weapon();
                    weapon_selected = 0;
                    selecting_weapon = false;
                    selecting_bars = true;
                    obj_soul.x = x + 326; 
                    obj_soul.y = last_y;
                    if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
                } 
				else
				{
                    if (!audio_is_playing(snd_cantselect)) { audio_play_sound(snd_cantselect, 2, false); }
                }
				    acomment = true;
					lastamessage5temp = amessage5temp
            }
            keyboard_clear(ord("Z"));
            keyboard_clear(vk_enter);
        }
    }
    else if (selecting_armor) {
        var max_scroll_y = max(0, array_length(global.armors) * item_height - view_height);
        scr_armorinfo(global.armors[armor_selected]);

        if (keyboard_check(global.up)) {
            if (armor_selected > 0) {
                armor_selected -= 1;
                scroll_y = max(scroll_y - item_height, 0);
                keyboard_clear(global.up);
            }
        } 
        else if (keyboard_check(global.down)) {
            if (armor_selected < array_length(global.armors) - 1) {
                armor_selected += 1;
                scroll_y = min(scroll_y + item_height, max_scroll_y);
                keyboard_clear(global.down);
            }
        }
        
  if (keyboard_check(ord("Z")) || keyboard_check(vk_enter)) {
	  amessagetemp_alpha = 1 //Make sure that the message will appear even if another one is fading
    if (equipping_kris)
	{
        if (armorchar1temp) {
            if (line_2) {
                global.armors[armor_selected] = global.armor_1[0]; 
                global.armor_1[0] = armornametemp;
                equipping_armor_slot = 1;
            }
            if (line_3) {
                global.armors[armor_selected] = global.armor_2[0]; 
                global.armor_2[0] = armornametemp;
                equipping_armor_slot = 2;
            }
            scr_equip_armor();
            armor_selected = 0;
            selecting_armor = false;
            selecting_bars = true;
            obj_soul.x = x + 326; 
            obj_soul.y = last_y;
            if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
        } else {
           scr_sound_play(snd_cantselect)
        }		
    }
    if (equipping_susie) {
        if (armorchar2temp) {
            if (line_2) {
                global.armors[armor_selected] = global.armor_1[1]; 
                global.armor_1[1] = armornametemp;
                equipping_armor_slot = 1;
            }
            if (line_3) {
                global.armors[armor_selected] = global.armor_2[1]; 
                global.armor_2[1] = armornametemp;
                equipping_armor_slot = 2;
            }
            scr_equip_armor();
            armor_selected = 0;
            selecting_armor = false;
            selecting_bars = true;
            obj_soul.x = x + 326; 
            obj_soul.y = last_y;
            if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
        } else {
           scr_sound_play(snd_cantselect)
        }
					acomment = true;
					lastamessage2temp = amessage2temp
    }
    if (equipping_ralsei) {
        if (armorchar3temp) {
            if (line_2) {
                global.armors[armor_selected] = global.armor_1[2]; 
                global.armor_1[2] = armornametemp;
                equipping_armor_slot = 1;
            }
            if (line_3) {
                global.armors[armor_selected] = global.armor_2[2]; 
                global.armor_2[2] = armornametemp;
                equipping_armor_slot = 2;
            }
            scr_equip_armor();
            armor_selected = 0;
            selecting_armor = false;
            selecting_bars = true;
            obj_soul.x = x + 326; 
            obj_soul.y = last_y;
            if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
        } else {
            if (!audio_is_playing(snd_cantselect)) { audio_play_sound(snd_cantselect, 2, false); }
        }
					acomment = true;
					lastamessage3temp = amessage3temp
    }
    if (equipping_toriel) {
        if (armorchar5temp) {
            if (line_2) {
                global.armors[armor_selected] = global.armor_1[3]; 
                global.armor_1[3] = armornametemp;
                equipping_armor_slot = 1;
            }
            if (line_3) {
                global.armors[armor_selected] = global.armor_2[3]; 
                global.armor_2[3] = armornametemp;
                equipping_armor_slot = 2;
            }
            scr_equip_armor();
            armor_selected = 0;
            selecting_armor = false;
            selecting_bars = true;
            obj_soul.x = x + 326; 
            obj_soul.y = last_y;
            if (!audio_is_playing(snd_heavyswing)) { audio_play_sound(snd_heavyswing, 2, false); }
        } else {
            if (!audio_is_playing(snd_cantselect)) { audio_play_sound(snd_cantselect, 2, false); }
        }
					acomment = true;
					lastamessage5temp = amessage5temp
    }
    keyboard_clear(ord("Z"));
    keyboard_clear(vk_enter);
}

    }
}



//Info screen
if power_menu_active == true
{   
	
	name_selected = global.party_order[selected_info] //find the name of the selected party member
	var array = scr_get_spells(name_selected) //find the array of the spells with the name
	array_spell = array_length(array); //find the lenght of the array
	if global.num_active_members == 1
	{
	  array_spell = 1	
	}
	var soul_x = x + 270 - 150;
	var soul_y = y + 276 - 5 - 102;

	if !instance_exists(obj_soul)
	{
		if global.num_active_members == 1
		{
		instance_create_depth(soul_x + 53, y + 150,-999999,obj_soul)	
		}
		else
		if global.num_active_members == 2
		{
		distance_soul = 55;	
		instance_create_depth(soul_x,soul_y - 20,-999999,obj_soul)
		}
		else
		if global.num_active_members == 3
		{
		distance_soul = 45;	
		instance_create_depth(soul_x,soul_y - 20,-999999,obj_soul)
		}
	}
	if global.num_active_members == 1  //extra stuff for when there is only one party member
	    {
		
	      selected_info = 0 // there is only one member so it has to be 0
		}
			show_debug_message("X SOUL = " + string(obj_soul.x)) //find out where the SOUL is
	//movement
	if selecting_magic == false
	{
	if keyboard_check(global.left)
	{
	  keyboard_clear(global.left)	
	  if selected_info != 0 {selected_info -= 1; obj_soul.x -= distance_soul}
	  audio_play_sound(snd_menumove,2,false)
	}
	if keyboard_check(global.right)
	{
	  keyboard_clear(global.right)
	  if selected_info != global.num_active_members-1 {selected_info += 1; obj_soul.x += distance_soul;dog = random_range(1,10)}
	  audio_play_sound(snd_menumove,2,false)
	}
	
	  //passing to check spells
		if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
	{
		
          last_x = obj_soul.x;
	      obj_soul.x = x + 306; 
	      obj_soul.y = y + 245;
		  
		

	      selecting_magic = true
	      selected_power = 0;	
	      image_index = 4	
	}
	}
       
		
	   if selecting_magic == true
	{
	  
	  if keyboard_check(global.up)
	  {
		  keyboard_clear(global.up)	
	  if selected_power != 0 {selected_power -= 1; obj_soul.y -= 25}
	  audio_play_sound(snd_menumove,2,false)
	  }
	
	  if keyboard_check(global.down)
	  {
		  keyboard_clear(global.down)	
	  if selected_power != (array_spell-1) {selected_power += 1; obj_soul.y += 25}
	  audio_play_sound(snd_menumove,2,false)
	  }
	  
	  
	}
}





//Option menu
if options_menu_active
{
 
 if !instance_exists(obj_soul)
 {instance_create_depth(x + 140,y + 160,-999999999,obj_soul)}
 
 //Movement
 if !selected_volume and !controls
 {
 if keyboard_check(global.up)
 {
  if option_selected != 0 
  {
	  option_selected -= 1; obj_soul.y -= 30;scr_sound_play(snd_menumove)
  }
  keyboard_clear(global.up)

 }
 if keyboard_check(global.down)
 {
  if option_selected != 6 
  {
	  option_selected += 1;obj_soul.y += 30;scr_sound_play(snd_menumove)
  }
  keyboard_clear(global.down)
  
 }
 }
 
if controls and !selected_a_control
 {
 if keyboard_check(global.up)
 {
  if option_selected != 0
  {
	  option_selected -= 1; obj_soul.y -= 25;scr_sound_play(snd_menumove)
  }
  keyboard_clear(global.up)

 }
 if keyboard_check(global.down)
 {
  if option_selected != 8
  {
	  option_selected += 1;obj_soul.y += 25;scr_sound_play(snd_menumove)
  }
  keyboard_clear(global.down)
  
 }
 }
 
 
 //various options
 if !controls
 {
 if option_selected == 0 //Volume
 {
   if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
   {if selected_volume == true {selected_volume = false}
    else
	{selected_volume = true}
   		keyboard_clear(ord("Z"))
		keyboard_clear(vk_enter)
		scr_sound_play(snd_select)
   }
   if selected_volume
   {
	   if keyboard_check(global.left)
 {
  if global.volume != 0 {global.volume -= 1;}
 }
       if keyboard_check(global.right)
 {
  if global.volume != 100 {global.volume += 1}
 } 
	  
	   
   }
 }
 
 if option_selected == 1 //Controls
 {
if keyboard_check(global.confirm) or keyboard_check(vk_enter)
{
keyboard_clear(ord("Z"))
keyboard_clear(vk_enter)
controls = true	
option_selected = 0;
obj_soul.x = 98;
obj_soul.y = 155;
}
 }
 
 if option_selected == 2 //VFX 
 {
   if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
   {
	    if val == "No"
		{val = "Yes"}
			else
	    {val = "No"}	
		keyboard_clear(ord("Z"))
		keyboard_clear(vk_enter)
		scr_sound_play(snd_select)
   }
 }
 
 if option_selected == 3 //Fullscreen
 {

   if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
   {
	      global.fullscreen = !global.fullscreen;
          window_set_fullscreen(global.fullscreen);
		
		   		keyboard_clear(ord("Z"))
		        keyboard_clear(vk_enter)
				scr_sound_play(snd_select)
		
   }
 }

 if option_selected == 4 //Run
 {

   if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
   {
         if obj_mainchara.autorun == false
		 {obj_mainchara.autorun = true}
		 else
		 {obj_mainchara.autorun = false}
		
		   		keyboard_clear(ord("Z"))
		        keyboard_clear(vk_enter)
				scr_sound_play(snd_select)
		
   }
 }
 
 if option_selected == 6 //Quit
	{
		if keyboard_check(vk_enter) or keyboard_check(ord("Z"))
		{
	  	options_menu_active = false
		active = true
		option_selected = 0;
		if instance_exists(obj_soul)
		{
		  instance_destroy(obj_soul)	
		}
		 keyboard_clear(ord("Z"))
		 keyboard_clear(vk_enter)
		 scr_sound_play(snd_select)
		}
	}
 }
 else
 {
if keyboard_check(vk_shift) or !selected_a_control
{
  keyboard_clear(ord(global.cancel))
  keyboard_clear(vk_shift)
selected_color = c_aqua;
selected_a_control = false;
}
if keyboard_check(vk_enter) or keyboard_check(global.confirm)
{
if !selected_a_control
{
  selected_a_control = true  
  selected_color = c_red;	
  
  keyboard_clear(vk_enter)
  keyboard_clear(global.confirm)
  io_clear()
}

if option_selected == 7 
{
scr_sound_play(snd_save)
selected_a_control = false;
selected_color = c_yellow;
reset_defaults()
}
  
if option_selected == 8 
  {
save_key_config()
selected_a_control = false;
option_selected = 1;
controls = false;
obj_soul.x = x + 140;
obj_soul.y = y + 190
  } 
 
}

if selected_a_control
{
  if !instance_exists(obj_remapkey)
  instance_create_depth(x,y,depth,obj_remapkey)

if keyboard_check(vk_anykey)
{
if option_selected == 0
{
global.down = obj_remapkey.key
conflicting_keys("down")
}

if option_selected == 1
{
global.right = obj_remapkey.key
conflicting_keys("right")
}

if option_selected == 2
{
global.up = obj_remapkey.key
conflicting_keys("up")
}

if option_selected == 3
{
global.left = obj_remapkey.key
conflicting_keys("left")
}

if option_selected == 4
{
global.confirm = obj_remapkey.key
conflicting_keys("confirm")
}

if option_selected == 5
{
global.cancel = obj_remapkey.key
conflicting_keys("cancel")
}

if option_selected == 6
{
global.menu = obj_remapkey.key
conflicting_keys("menu")
}


}
 }
}


  
}

   if obj_mainchara.autorun == false {run = "OFF"}
   if obj_mainchara.autorun == true {run = "ON"}
 	if global.fullscreen == false {fullscreen = "No"} 
	if global.fullscreen == true {fullscreen = "Yes"} 
	
	
//Make the message appear and fade away
if acomment == true
{

if amessagetemp_alpha != 0
{
	amessagetemp_alpha -= 0.01
	move_hp += 0.5;
	hp_alpha -= 0.03;
}
else
{
	amessagetemp_alpha = 1
	acomment = false
	

}
}

/*
show_debug_message("Move hp = " + string(move_hp))
show_debug_message("draw hp = " + string(draw_hp))
show_debug_message("previous hp = " + string(previous_hp))

//obj_battle step event
depth = -200
if global.tp > 100
{global.tp = 100}
if x < t_x
{
x += 3
}


if !enemy_turn
{
if active
{
if keyboard_check(global.left)
{
	if selected_button != 0
	{
	selected_button -= 1
	}
	else
	if selected_button = 0
	{selected_button = 4}
	keyboard_clear(global.left)
}
if keyboard_check(global.right)
{
	if selected_button != 4
	{
	selected_button += 1
	}
	else
	if selected_button = 4
	{selected_button = 0}
	keyboard_clear(global.right)
}

 if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.confirm)) 
 {
   keyboard_clear(ord("Z"))
   keyboard_clear(vk_enter)

   
        if (selected_button < 5) 
		{
            switch (selected_button) 
			{
                case 0: // FIGHT
			    var _actor = noone;

			    switch (turn)
			    {
			        case 0: _actor = member_0; break;
			        case 1: _actor = member_1; break;
			        case 2: _actor = member_2; break;
			    }

			    if (instance_exists(_actor))
			    {
			        _actor.sprite_index = _actor.fight_sprite;
			        _actor.image_speed = 0;
			        selected_member = _actor;

			        switch (turn)
			        {
			            case 0: last_selected_button_1 = 0; break;
			            case 1: last_selected_button_2 = 0; break;
			            case 2: last_selected_button_3 = 0; break;
			        }

			        turn += 1;
			        active = false;
			        fight_selecting = true;
			    }
			    break;
                case 1: // Acts/Magic
			    active = false;
				act_menu_active = true;
                    break;
                case 2: // Items
                  itemlist = true;
				  list_1 = true;
				  active = false;
                    break;
                case 3: // Spare
                active = false;
                    break;
			    case 4: // Defend
			    var _actor = noone;

			    switch (turn)
			    {
			        case 0: _actor = member_0; break;
			        case 1: _actor = member_1; break;
			        case 2: _actor = member_2; break;
			    }

			    if (instance_exists(_actor))
			    {
			        global.tp = min(global.tp + 16, 100);

			        _actor.sprite_index = _actor.defend_sprite;
			        selected_member = _actor;

			        switch (turn)
			        {
			            case 0: last_selected_button_1 = 4; break;
			            case 1: last_selected_button_2 = 4; break;
			            case 2: last_selected_button_3 = 4; break;
			        }

			        alarm[1] = 27;
			        turn += 1;
			    }
			    break;
		      }
		    }
          }
         }
}

if turn >= max_turns
{
if fighting
{
	
	if instance_number(obj_battle_bar) < global.num_active_members
	instance_create_depth(x,y+365,depth-1,obj_battle_bar)
	if instance_exists(obj_battle_bar) 
	{
		if obj_battle_bar.speed == 0
		{
	 attack = obj_battle_bar.attack_power*global.atk_K
	 obj_enemy_overworld.hp -= attack;
	 fighting = false;
	 instance_destroy(obj_battle_bar)
	 //alarm[0] = 40
		}
	}
}
}

if fight_selecting
{
if !instance_exists(obj_soul)
{
    instance_create_depth(t_x+65,t_y+380,-400,obj_soul)
}

if keyboard_check(global.up)
{
	if enemy_selected != 0
	{
		enemy_selected -= 1
		obj_soul.y -= 27;
	}
	keyboard_clear(global.up)
	audio_play_sound(snd_menumove, 10, false);
}
if keyboard_check(global.down)
{
 	if enemy_selected != enemy_number
	{
	 enemy_selected += 1	
	 obj_soul.y += 27;
	}
	keyboard_clear(global.down)
	audio_play_sound(snd_menumove, 10, false);
}
}

if itemlist
{
	if !instance_exists(obj_soul)
	{instance_create_depth(t_x + 40,t_y + 372,-400,obj_soul)}
	scr_iteminfo(global.items_dark[item_selected]);
	
	if !selecting_person_item
	{
	    // Handle left movement
    if (keyboard_check_pressed(global.left)) 
	{
        if (item_selected % max_items_per_row != 0) {
            item_selected -= 1;
            obj_soul.x -= item_width
        }
        audio_play_sound(snd_menumove, 10, false);
    } 
	else if (keyboard_check_pressed(global.right)) 
	{
        if (item_selected % max_items_per_row != max_items_per_row - 1 && item_selected != longness - 1) {
            item_selected += 1;
            obj_soul.x += item_width
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
		if list_2
		if item_selected <= 8 
		{
		 list_1 = true;
		 list_2 = false;
		 obj_soul.x = t_x + 320;
		 obj_soul.y = t_y + 442;
		 item_selected = 8
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
		if list_1
		if item_selected >= 9 and longness > 8
		{
		 list_1 = false;
		 list_2 = true;
		 obj_soul.x = t_x + 40;
		 obj_soul.y = t_y + 372;
		 item_selected = 9
		}
		
        audio_play_sound(snd_menumove, 10, false);
    }
}
    else
{

if keyboard_check(global.up)
{
	if selected_person_item != 0
	{
		selected_person_item -= 1
		obj_soul.y -= 27;
	}
	keyboard_clear(global.up)
	audio_play_sound(snd_menumove, 10, false);
}
if keyboard_check(global.down)
{
 	if selected_person_item != global.num_active_members - 1
	{
	 selected_person_item += 1	
	 obj_soul.y += 27;
	}
	keyboard_clear(global.down)
	audio_play_sound(snd_menumove, 10, false);
}
	
}

	if keyboard_check_pressed(global.cancel) or keyboard_check_pressed(vk_shift)
	{
	  if instance_exists(obj_soul)
	  {instance_destroy(obj_soul)}
	  itemlist = false;
	  active = true;
	  if !selecting_person_item
	  {
	  list_1 = false
	  list_2 = false
	  }
	  else
	  {
		  list_1 = false
	      list_2 = false
		  selecting_person_item = false;
	  }
	  	itemlist = false;
		active = true;
	  item_selected = 0;
	}
	
	if list_1 or list_2 and !selecting_person_item
	{
		if keyboard_check(global.confirm) or keyboard_check(vk_enter)
		{
		   if global.itemtarget != 2
		   {
		   selecting_person_item = true
		   }
		   else
		   {
			selecting_person_item = false;
			turn += 1;
            max_turns -= 1;
			itemlist = false;
		    active = true;
		    selected_button = 0;
			item_selected = 0;
			if instance_exists(obj_soul)
		   {
			instance_destroy(obj_soul)
		   }
		   }
		   list_1 = false;
		   list_2 = false;
		   obj_soul.x = t_x + 65;
		   obj_soul.y = t_y + 380;
		   keyboard_clear(ord("Z"))
           keyboard_clear(vk_enter)
		}
		
}
	
	if selecting_person_item
	if keyboard_check(global.confirm) or keyboard_check(vk_enter)
		{
		
		var selected_name = global.party_order[selected_person_item]
		turn += 1;
        max_turns -= 1;
		selecting_person_item = false;
		list_1 = false;
		list_2 = false;
		itemlist = false;
		active = true;
		selected_button = 0;
		item_selected = 0;
		if instance_exists(obj_soul)
		{
			instance_destroy(obj_soul)
		}
		}
}

if act_menu_active
{

	
}

if enemy_turn
{
	if !instance_exists(obj_battle_box)
	{instance_create_depth(430,300,depth-1,obj_battle_box)}
	
	if (!instance_exists(obj_soul) && instance_exists(soul_spawn_source))
	{
	    instance_create_depth(
	        soul_spawn_source.x,
	        soul_spawn_source.y,
	        soul_spawn_source.depth + 1,
	        obj_soul
	    );
	}
	
	if instance_exists(obj_battle_box)
	{
		if obj_battle_box.image_index > 14 and obj_soul.x > obj_battle_box.x
		{
			with (obj_soul)
			{
			x = lerp(x, obj_battle_box.x, 0.1);
            y = lerp(y, obj_battle_box.y, 0.1);
			}
		}
	}
}

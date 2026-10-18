// Move player and enemy to their respective positions
if (instance_exists(obj_fake_kris)) 
{
	
if global.battle = false
{
var image_k = instance_create_depth(obj_fake_kris.x, obj_fake_kris.y, obj_fake_kris.depth, obj_afterimage);
    image_k.image_xscale = obj_fake_kris.image_xscale;
	image_k.image_yscale = obj_fake_kris.image_yscale;
    image_k.sprite_index = obj_fake_kris.sprite_index;
    image_k.image_index = obj_fake_kris.image_index;
}
	
    with (obj_fake_kris) 
	{
        if (x != other.target_player_x || y != other.target_player_y) 
		{
            x = lerp(x, other.target_player_x, 0.1);
            y = lerp(y, other.target_player_y, 0.1);
        }
    }
}

if (instance_exists(obj_enemy_overworld)) 
{
    with (obj_enemy_overworld) 
	{   
		if global.battle = false
		{
        var image_enemy = instance_create_depth(x, y, depth, obj_afterimage);
        image_enemy.image_xscale = image_xscale;
		image_enemy.image_yscale = image_yscale;
        image_enemy.sprite_index = sprite_index;
		}

        if (x != other.target_enemy_x || y != other.target_enemy_y) 
		{
            x = lerp(x, other.target_enemy_x, 0.1);
            y = lerp(y, other.target_enemy_y, 0.1);
        }
    }
}

// Move party members if they exist
if (instance_exists(obj_suzy)) 
{
    with (obj_suzy) 
	{
		
        var target_x = global.num_active_members > 1 && global.party_order[1] == "Susie" ? other.target_npc_1_x : other.target_npc_2_x;
        var target_y = global.num_active_members > 1 && global.party_order[1] == "Susie" ? other.target_npc_1_y : other.target_npc_2_y;
        
        if global.battle = false
		{
		var image_susie = instance_create_depth(x, y, depth, obj_afterimage);
        image_susie.image_xscale = image_xscale;
		image_susie.image_yscale = image_yscale;
        image_susie.sprite_index = sprite_index;
		}
		
		if (x != target_x || y != target_y) 
		{
            x = lerp(x, target_x, 0.1);
            y = lerp(y, target_y, 0.1);
        }
    }
}

if (instance_exists(obj_ralsei))
{
    with (obj_ralsei) 
	{
        var target_x = global.num_active_members > 1 && global.party_order[1] == "Ralsei" ? other.target_npc_1_x : other.target_npc_2_x;
        var target_y = global.num_active_members > 1 && global.party_order[1] == "Ralsei" ? other.target_npc_1_y : other.target_npc_2_y;
        
		if global.battle
		{
		var image_ralsei = instance_create_depth(x, y, depth, obj_afterimage);
        image_ralsei.image_xscale = image_xscale;
		image_ralsei.image_yscale = image_yscale;
        image_ralsei.sprite_index = sprite_index;
		}
		
		if (x != target_x || y != target_y) 
		{
            x = lerp(x, target_x, 0.1);
            y = lerp(y, target_y, 0.1);
        }
    }
}

// Check if the transition is complete
if obj_enemy_overworld.x >= target_enemy_x-10 and obj_enemy_overworld.y >= target_enemy_y-10 and !instance_exists(obj_battle)
{
    // Destroy afterimages
    with (obj_afterimage)
	{
        instance_destroy();
    }

    // Show debug message and transition to battle scene
    show_debug_message("Transition to battle scene");

    instance_create_depth(x - 50, y, -200, obj_battle);
	show_debug_message("BATTLE = " + string(obj_battle.x) + "y = " + string(obj_battle.y))
	
	instance_destroy()
}

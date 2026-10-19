// Draw Event (obj_menu_dark)
draw_self();

if (instance_exists(obj_menu_dark))
{
    var t_x = camera_get_view_x(view_camera[0]);
    var t_y = camera_get_view_y(view_camera[0]);

    var item_width = (menu_width - 154) / max_items_per_row; // Width of each item

    var _y = t_y + 150; // Starting y position for the first item
    var _x = 0; // Starting x position for the first item

    draw_set_font(fnt_mainbig);
    draw_set_color(c_white);

    if (image_index < 4) {
        draw_text_transformed(t_x + 510, t_y + 35, "D$ " + string(global.gold), 1.8, 1.8, 0);
    }

    // Calculate position for Kris's health bar
    var bar_width_K = 80; // Default width for Kris's health bar
    var bar_x_K = t_x + (640 - bar_width_K) / 2; // Center horizontally

    // Draw health bar for the protagonist (Kris)
    var hp_percentage_K = global.hp_K / global.maxhp_K;
    bar_width_K = hp_percentage_K * 100; // Assuming the HP bar is 100 pixels wide

    bar_x_K = t_x + 120; // Adjust the X global.value as needed
    var bar_y_K = t_y + 273; // Adjust the Y global.value as needed

    if (global.num_active_members == 1) 
	{
        bar_x_K = t_x + 270;
    } 
	else if (global.num_active_members > 1) 
    {
        bar_x_K = t_x + 120;
    }

    if (global.member[0])
	{
        draw_set_color(c_aqua); // Set the color of the filled part of the HP bar
        draw_rectangle(bar_x_K, bar_y_K + 150, bar_x_K + bar_width_K, bar_y_K + 160, false); // Draw the filled part of the HP bar

        draw_set_color(c_red); // Set the color of the empty part of the HP bar
        draw_rectangle(bar_x_K + bar_width_K, bar_y_K + 150, bar_x_K + 100, bar_y_K + 160, false); // Draw the empty part of the HP bar

        // Draw text for protagonist's HP
        draw_set_color(c_white);
        draw_text(bar_x_K, bar_y_K + 133, "HP " + string(global.hp_K) + "/" + string(global.maxhp_K));

        // Draw Kris's face sprite and name
        if ((selecting_member && selected_party_member == 0 && !selecting_item) || (global.itemtarget == 2 && !selecting_item && selecting_member)) {
            draw_sprite(spr_soulb_face, 0, bar_x_K - 50, bar_y_K + 140); // Adjust sprite position as needed
            draw_text(bar_x_K - 30, bar_y_K + 160, "Kris"); // Adjust text position as needed for name
        }
		else
		{
            var sprite_face_K = spr_krisb_face; // Change to appropriate sprite for Kris
            draw_sprite(sprite_face_K, 0, bar_x_K - 50, bar_y_K + 140); // Adjust sprite position as needed
            draw_text(bar_x_K - 30, bar_y_K + 160, "Kris"); // Adjust text position as needed for name
        }
   
   }


    // Draw HP panels for the active party.
    // Character data is stored in global.memberData.

    var _party_count = array_length(global.party_order);

    // Keep the original font and bar placement as closely as possible.
    var _bar_y = t_y + 423;
    var _bar_width = 100;
    var _bar_height = 10;
    var _spacing = (_party_count == 2) ? 270 : 150;

    // Center one member; use the original layout for two members.
    var _start_x;
    if (_party_count <= 1)
        _start_x = t_x + 270;
    else
        _start_x = t_x + 120;

    for (var i = 0; i < _party_count; i++)
    {
        var _member_name = global.party_order[i];
		var _member = scr_get_member_data(_member_name);

        // Skip missing character definitions instead of crashing the menu.
        if (is_undefined(_member))
            continue;

        // Read live HP values from the global variables.
        var _hp = variable_global_get(_member.hpVar);
        var _max_hp = variable_global_get(_member.maxHpVar);

        // Avoid division by zero and keep the bar within its limits.
        var _hp_ratio = 0;
        if (_max_hp > 0)
            _hp_ratio = clamp(_hp / _max_hp, 0, 1);

        var _bar_x = _start_x + i * _spacing;
        var _filled_width = _bar_width * _hp_ratio;

        // Preserve the original position for the first two members.
        // For three or more members, distribute them more evenly.
        if (_party_count >= 3)
            _bar_x = t_x + 70 + i * 200;

        // HP bar.
        draw_set_color(_member.hpBarColor);
        draw_rectangle(
            _bar_x, _bar_y,
            _bar_x + _filled_width, _bar_y + _bar_height,
            false
        );

        draw_set_color(c_red);
        draw_rectangle(
            _bar_x + _filled_width, _bar_y,
            _bar_x + _bar_width, _bar_y + _bar_height,
            false
        );

        // HP text.
        draw_set_color(c_white);
        draw_set_font(fnt_mainbig);
        draw_text(
            _bar_x, _bar_y - 20,
            "HP " + string(_hp) + "/" + string(_max_hp)
        );

        // Determine whether this character is the selected target.
        var _selected = (
            selecting_member
            && !selecting_item
            && (
                selected_party_member == i
                || global.itemtarget == 2
            )
        );

        // Face and name.
        var _face = _member.faceSprite;
        if (_selected)
            _face = spr_soulb_face;

        draw_sprite(_face, 0, _bar_x - 38, _bar_y - 15);
        draw_text(_bar_x - 30, _bar_y + 10, _member.name);

        // Character reactions.
        // These fields are defined in scr_memb().
        if (acomment)
        {
            draw_set_font(fnt_dt_mono);
            draw_set_alpha(amessagetemp_alpha);

            var _reaction = "";
            var _show_reaction = false;
            var _reaction_width = 220;

            // Read the reaction only if the field exists and isn't empty.
            if (variable_struct_exists(_member, "reactionVar")
                && _member.reactionVar != "")
            {
                _reaction = variable_instance_get(id, _member.reactionVar);

                // Equipment reaction.
                if (equip_menu_active
                    && variable_struct_exists(_member, "equippingFlagVar")
                    && _member.equippingFlagVar != ""
                    && variable_instance_get(id, _member.equippingFlagVar)
                    && _reaction != "")
                {
                    _show_reaction = true;
                }

                // Item reaction.
                if (item_menu_active && _reaction != "")
                {
                    if (old_reactions)
                    {
                        _show_reaction = true;
                    }
                    else if (old_selected_member >= 0
                        && old_selected_member < array_length(global.party_order)
                        && global.party_order[old_selected_member] == _member_name)
                    {
                        _show_reaction = true;
                    }
                }

                // Keep Susie's narrower text wrapping.
                if (_member_name == "Susie")
                {
                    _reaction_width = 130;
                }
            }

            if (_show_reaction)
            {
                draw_text_ext(
                    _bar_x - 30,
                    _bar_y + 30,
                    _reaction,
                    10,
                    _reaction_width
                );
            }

            draw_set_alpha(1);
        }
    }

    // Restore drawing defaults for the rest of the menu.
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(fnt_mainbig);

			

/// Draw healing numbers above the affected party members.
if (draw_hp)
{
    draw_set_font(fnt_mainbig);
    draw_set_color(c_lime);
    draw_set_alpha(hp_alpha);

    var _party_count = array_length(global.party_order);

    var _bar_y = t_y + 423;
    var _bar_width = 100;
    var _spacing = (_party_count == 2) ? 270 : 150;
    var _start_x = (_party_count <= 1) ? t_x + 270 : t_x + 120;

    for (var i = 0; i < _party_count; i++)
    {
        // Individual items only affect the selected member.
        if (global.itemtarget == 1 && i != old_selected_member)
            continue;

        var _bar_x = _start_x + i * _spacing;

        if (_party_count >= 3)
            _bar_x = t_x + 70 + i * 200;

        draw_text(
            _bar_x + 20,
            _bar_y - move_hp,
            "+" + string(previous_hp)
        );
    }

    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(fnt_mainbig);
}



//item menu
if (item_menu_active) 
{
        draw_sprite_ext(spr_menu_item, 0, t_x + 86, t_y + 100, 1.7, 1.7, 0, c_white, 1);

        if (selected_other < 2) {
            // Draw the items
            for (var i = 0; i < array_length(global.items_dark); i++) 
			{
                var item_index = i % max_items_per_row; // Calculate the index of the item within the current row
                var row_index = floor(i / max_items_per_row); // Calculate the index of the current row
                var item_x = t_x + 134 + item_index * item_width; // Calculate the x position of the item
                var item_y = t_y + 165 + row_index * (item_height + item_spacing); // Calculate the y position of the item

                draw_set_color(c_white); // Set color to white for items
                draw_set_font(fnt_dt_mono);
                draw_text_transformed(item_x - 5, item_y, global.items_dark[i], 1.2, 1.2, 0);
            }
			
			
        } else {
            // Draw the items
            for (var n = 0; n < array_length(global.items_key); n++) {
                var item_index_key = n % max_items_per_row; // Calculate the index of the item within the current row
                var row_index_key = floor(n / max_items_per_row); // Calculate the index of the current row
                var item_x_key = t_x + 134 + item_index_key * item_width; // Calculate the x position of the item
                var item_y_key = t_y + 165 + row_index_key * (item_height + item_spacing); // Calculate the y position of the item

                if (global.items_key[n] == "Cell Phone" || global.items_key[n] == "Lancer") {
                    draw_set_color(c_white); // Set color to white for items that are interactable
                } else {
                    draw_set_color(c_silver); // Objects that don't do anything
                }
                draw_set_font(fnt_dt_mono);
                draw_text_transformed(item_x_key - 5, item_y_key, global.items_key[n], 1.2, 1.2, 0);
            }
        }
    

    if (key_menu) 
	{
        // Check if the selected item is within bounds
        if (key_selected >= 0 && key_selected < array_length(global.items_key)) {
            // Display the description of the selected key item
            scr_key_info(global.items_key[key_selected]);
            draw_set_font(fnt_dt_mono_BIG);
            draw_set_color(c_white);
            draw_text_ext_transformed(t_x + 35, t_y + 20, global.key_description, 30, 450, 1, 1, 0);

            if (array_contains(global.items_key, "Star Walker")) 
			{
                draw_sprite(spr_npc_originalstarwalker, 0, t_x + 20, t_y + 31);
            }
            if (array_contains(global.items_key, "Roulxs Kaard")) 
			{
                draw_sprite_ext(spr_Roulxs, 0, t_x + 445, t_y + 249, 1.5, 1.5, 0, c_white, 1);
            }
			if array_contains(global.items_key, "object")
			{
				draw_sprite_ext(spr_WHO, 0, t_x + 425, t_y + 249, 1.5, 1.5, 0, c_white, 1);
			}
        }
    }

    if (item_menu || toss) 
	{
        if (selecting_item || selecting_member) 
		{
            // Check if the selected item is within bounds
            if (item_selected >= 0 && item_selected < array_length(global.items_dark)) 
			{
                // Display the description of the selected key item
                scr_iteminfo(global.items_dark[item_selected]);
                draw_set_font(fnt_dt_mono_BIG);
                draw_text_ext_transformed(t_x + 35, t_y + 20, global.item_desc, 30, 435, 1, 1, 0);
            }
        }
        show_debug_message("item target = " + string(global.itemtarget));
    }
}

// Info menu
if (power_menu_active) 
{
    draw_sprite_ext(spr_menu_power, 0, t_x + 86, t_y + 100, 1.7, 1.7, 0, c_white, 1);
    var member_name; // Define outside the loop
    var member_index; // Define outside the loop
    var kris_face_x = t_x + 270 - 110; // Corrected variable assignment
    var kris_face_y = t_y + 276 - 5 - 102;
    var simbol_atk = spr_symbol_mini_sword;
    var empty_text = "---------";
	// Get the current time in milliseconds
    var time = current_time;

    if (selecting_magic == true) // Write description of the spell regardless if there are party members or not
    {
        // Draw the spell description
        draw_set_font(fnt_dt_mono_BIG);
        if (spell_desc != "") 
        {
            draw_text_ext(t_x + 30, t_y + 20, spell_desc, 20, 450);
        }
    }

    draw_set_font(fnt_dt_mono_BIG);
    draw_text_transformed(kris_face_x - 35, kris_face_y + 58,  "Attack:  ", 1.05, 1.05, 0);
    draw_text_transformed(kris_face_x - 35, kris_face_y + 82,  "Defense: ", 1.05, 1.05, 0);
    draw_text_transformed(kris_face_x - 35, kris_face_y + 105, "Magic:   ", 1.05, 1.05, 0);
    draw_sprite_ext(spr_symbol_mini_shield, 0, kris_face_x - 55, kris_face_y + 82, 1.9, 1.9, 0, c_white, 1);
    draw_sprite_ext(spr_symbol_mini_mag, 0, kris_face_x - 55, kris_face_y + 105, 1.9, 1.9, 0, c_white, 1);

    var atk, df, mag; // Variables to hold stats

    if (global.member[0] == true) 
    {
        if (global.num_active_members == 1) 
        {
            draw_set_font(fnt_dt_mono_BIG);
            draw_text(kris_face_x, kris_face_y - 45, "Kris");
            draw_text(kris_face_x + 130, kris_face_y - 35, "LV " + string(draw_lv) + " - " + string(draw_title));
            draw_text_ext(kris_face_x + 130, kris_face_y - 20, global.member_info, 18, 230);
            draw_sprite_ext(simbol_atk, 0, kris_face_x - 55, kris_face_y + 58, 1.9, 1.9, 0, c_white, 1);
            
            // Empty text lines for Kris with a 10% chance for "DOG"
            draw_set_color(c_gray);
            var line_1_info = draw_text_transformed(kris_face_x - 35, kris_face_y + 129, empty_text, 1.15, 1.15, 0);
			if dog < 9
			{
            var line_2_info = draw_text_transformed(kris_face_x - 35, kris_face_y + 153, empty_text, 1.15, 1.15, 0);
			}
			if dog >= 9
			{
			draw_set_color(c_white)
		    
			draw_sprite_ext(spr_symbol_mini_dog, 0, kris_face_x - 55, kris_face_y + 153, 1.9, 1.9, 0, c_white, 1);
            var line_2_info = draw_text_transformed(kris_face_x - 35, kris_face_y + 153, "Dog", 1.15, 1.15, 0);
			// Calculate whether 1.5 seconds (1500 ms) have passed
            if ((time div 1500) mod 2 == 0) {
            // Draw the first frame (index 0)
           draw_sprite_ext(spr_dog_sleep,0,kris_face_x + 85, kris_face_y + 153, 1.5, 1.5, 0,c_white,1);
           } else {
           // Draw the second frame (index 1)
            draw_sprite_ext(spr_dog_sleep,1,kris_face_x + 85, kris_face_y + 153, 1.5, 1.5, 0,c_white,1);
           }
			draw_set_color(c_gray);
			}
		    
            draw_set_color(c_white);
			draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x - 55, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
		    var line_3_info = draw_text_transformed(kris_face_x - 35, kris_face_y + 174, "Guts:    ", 1.15, 1.15, 0);
            draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x + 85, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
			draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x + 105, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);

            // Fetch Kris's stats
            atk = global.real_atk_K;
            df = global.real_df_K;
            mag = global.real_mag_K;

            draw_text_transformed(kris_face_x + 85, kris_face_y + 58, string(atk), 1.05, 1.05, 0);
            draw_text_transformed(kris_face_x + 85, kris_face_y + 82, string(df), 1.05, 1.05, 0);
            draw_text_transformed(kris_face_x + 85, kris_face_y + 105, string(mag), 1.05, 1.05, 0);

            // Get the selected party member's name
            var members_name = global.party_order[selected_info];

            // Ensure member_name is correctly used here
            var member_spells = global.spells_map[? members_name];

            // Draw the spells and descriptions
            for (var k = 0; k < array_length(member_spells); k++) 
            {
                var spell = member_spells[k]; // Define the spell variable here
                var spell_text = string(spell.tpCost) + "% " + string(spell.name);
                draw_set_color(c_gray);
                draw_text_transformed(t_x + 335, t_y + 245 + (k * 25), spell_text, 1.1, 1.1, 0);
                draw_set_color(c_white);
                if (k == selected_power) 
                {
                    spell_desc = spell.description;
                }
            }
        } 
        else 
        {
            kris_face_x = t_x + 270 - 160;
        }
        draw_sprite_ext(spr_kris_head, 0, kris_face_x, kris_face_y, 2, 2, 0, c_white, 1);
    }

    // Draw other members based on global.party_order
    for (var i = 0; i < array_length(global.party_order); i++) 
    {
        var member_order = global.party_order[i]; // Correct assignment of member name
        member_index = -1;

        // Find the index of the member in global.memberData
        for (var j = 1; j < array_length(global.memberData); j++) 
        {
            if (global.memberData[j].name == member_order) 
            {
                member_index = j;
                break;
            }
        }

        if (member_index != -1 && global.member[member_index]) 
        {
            var member = global.memberData[member_index];
            var power_face_sprite = member.face;
            var power_face_x = 0;
            var power_face_y = t_y + 276 - 5 - 102;

            if (global.num_active_members == 2) 
            {
                power_face_x = t_x + 315 - 150;
            } 
            else 
            {
                power_face_x = t_x + 100 + i * 50;
            }

            // Fetch the stats for the member
            if (member.name == "Kris") 
			{
                atk = global.real_atk_K;
                df = global.real_df_K;
                mag = global.real_mag_K;
            } 
			else if (member.name == "Susie") 
			{
                simbol_atk = spr_simbol_axe;
                atk = global.real_atk_S;
                df = global.real_df_S;
                mag = global.real_mag_S;
            } 
			else if (member.name == "Ralsei") 
			{
                simbol_atk = spr_simbol_scarf;
                atk = global.real_atk_R;
                df = global.real_df_R;
                mag = global.real_mag_R;
            } 
			else if (member.name == "Toriel")
			{
                simbol_atk = spr_simbol_book;
                atk = global.real_atk_T;
                df = global.real_df_T;
                mag = global.real_mag_T;
             }

            // Check if this is the selected member
            if (i == selected_info) 
            {
                draw_text_transformed(kris_face_x + 135, kris_face_y + 58,  string(atk), 1.05, 1.05, 0);
                draw_text_transformed(kris_face_x + 135, kris_face_y + 82,  string(df), 1.05, 1.05, 0);
                draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(mag), 1.05, 1.05, 0);
                draw_sprite_ext(simbol_atk, 0, kris_face_x - 5, kris_face_y + 58, 1.6, 1.6, 0, c_white, 1);

             // Draw different texts and sprites for each party member
            if (member.name == "Susie")
			{
				draw_sprite_ext(spr_symbol_mini_evil, 0, kris_face_x - 5, kris_face_y + 129, 1.9, 1.9, 0, c_white, 1);
                var susie_line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, "Rudeness:", 1.15, 1.15, 0);
				draw_text_transformed(kris_face_x + 135, kris_face_y + 129, "89", 1.05, 1.05, 0);
				draw_sprite_ext(spr_symbol_mini_evil, 0, kris_face_x - 5, kris_face_y + 153, 1.9, 1.9, 0, c_white, 1);
                var susie_line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 153, "Purple:  ", 1.15, 1.15, 0);
				draw_text_transformed(kris_face_x + 135, kris_face_y + 153, "Yes", 1.05, 1.05, 0);
				draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x - 5, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
                var susie_line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 174, "Guts:    ", 1.15, 1.15, 0);
                draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x + 135, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
				draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x + 155, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
			} 
			else if (member.name == "Ralsei") 
			{
                draw_sprite_ext(spr_symbol_mini_sweet, 0, kris_face_x - 5, kris_face_y + 129, 1.9, 1.9, 0, c_white, 1);
                var ralsei_line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, "Sweetness:  ", 1.05, 1.05, 0);
				draw_text_transformed(kris_face_x + 135, kris_face_y + 129, "97", 1.05, 1.05, 0);
				draw_sprite_ext(spr_symbol_mini_fluffy, 0, kris_face_x - 5, kris_face_y + 153, 1.9, 1.9, 0, c_white, 1);
                var ralsei_line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 153, "Fluffiness: ", 0.9, 0.9, 0);
				draw_sprite_ext(spr_symbol_mini_fluffy, 0, kris_face_x + 135, kris_face_y + 153, 1.9, 1.9, 0, c_white, 1);
				draw_sprite_ext(spr_symbol_mini_fluffy, 0, kris_face_x + 155, kris_face_y + 153, 1.9, 1.9, 0, c_white, 1);
                draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x - 5, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
		        var ralsei_line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 174, "Guts:    ", 1.15, 1.15, 0);

            } 
			else if (member.name == "Toriel") 
			{

                var toriel_line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, "Fireness:        ", 1.15, 1.15, 0);
                var toriel_line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 153, "Protectiveness:  ", 1.15, 1.15, 0);
                var toriel_line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 174, "Guts:            ", 1.15, 1.15, 0);

            }

            //Draw party member names and description
            draw_text(kris_face_x + 35, power_face_y - 45, member.name);
            draw_text(kris_face_x + 180, kris_face_y - 35, "LV " + string(draw_lv) + " - " + string(draw_title));
            draw_text_ext(kris_face_x + 180, kris_face_y - 20, global.member_info, 18, 230);


                // Draw the spells and descriptions
                var members_name = global.party_order[selected_info];
                var member_spells = global.spells_map[? members_name];
                for (var k = 0; k < array_length(member_spells); k++) 
                {
                    var spell = member_spells[k]; // Define the spell variable here
                    var spell_text = string(spell.tpCost) + "% " + string(spell.name);
                    draw_set_color(c_gray);
                    draw_text_ext_transformed(t_x + 335, t_y + 245 + (k * 25), spell_text,17,250, 1.05, 1.05, 0);
                    draw_set_color(c_white);
                    if (k == selected_power) 
                    {
                        spell_desc = spell.description;
                    }
                }
            }

            //Draw the face
			draw_sprite_ext(power_face_sprite, 0, power_face_x, power_face_y - 8, 2, 2, 0, c_white, 1);
           


        }
    }

    // Draw Kris stats and spells if Kris is selected
    if (selected_info == 0 && global.num_active_members > 1) 
    {
        draw_set_font(fnt_dt_mono_BIG);
		draw_text(kris_face_x + 35, power_face_y - 45, "Kris");  //draw the name
		draw_text(kris_face_x + 180, kris_face_y - 35, "LV " + string(draw_lv) + " - " + string(draw_title));
        draw_text_ext(kris_face_x + 180, kris_face_y - 20, global.member_info, 18, 230);
			
        draw_sprite_ext(spr_symbol_mini_sword, 0, kris_face_x - 5, kris_face_y + 58, 1.9, 1.9, 0, c_white, 1);

            // Fetch Kris's stats
            atk = global.real_atk_K;
            df = global.real_df_K;
            mag = global.real_mag_K;

        draw_text_transformed(kris_face_x + 135, kris_face_y + 58, string(atk), 1.05, 1.05, 0);
        draw_text_transformed(kris_face_x + 135, kris_face_y + 82, string(df), 1.05, 1.05, 0);
        draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(mag), 1.05, 1.05, 0);
        
		    // Empty text lines for Kris with a 10% chance for "DOG"
            draw_set_color(c_gray);
            var line_1_info = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, empty_text, 1.15, 1.15, 0);
			if dog < 9
			{
            var line_2_info = draw_text_transformed(kris_face_x + 15, kris_face_y + 153, empty_text, 1.15, 1.15, 0);
			}
			if dog >= 9
			{
			draw_set_color(c_white)
			draw_sprite_ext(spr_symbol_mini_dog,0,kris_face_x - 5, kris_face_y + 153,1.9,1.9,0,c_white,1)
            var line_2_info = draw_text_transformed(kris_face_x + 15, kris_face_y + 153, "Dog", 1.15, 1.15, 0);
			// Calculate whether 1.5 seconds (1500 ms) have passed
            if ((time div 1500) mod 2 == 0) {
            // Draw the first frame (index 0)
           draw_sprite_ext(spr_dog_sleep,0,kris_face_x + 135, kris_face_y + 153, 1.5, 1.5, 0,c_white,1);
           } else {
           // Draw the second frame (index 1)
            draw_sprite_ext(spr_dog_sleep,1,kris_face_x + 135, kris_face_y + 153, 1.5, 1.5, 0,c_white,1);
           }
			draw_set_color(c_gray);
			}
			draw_set_color(c_white);
			draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x - 5, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
		    var line_3_info = draw_text_transformed(kris_face_x + 15, kris_face_y + 174, "Guts:    ", 1.15, 1.15, 0);
            draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x + 135, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
			draw_sprite_ext(spr_symbol_mini_guts, 0, kris_face_x + 155, kris_face_y + 174, 1.9, 1.9, 0, c_white, 1);
            
		
        // Draw the spells and descriptions
        var member_spells = global.spells_map[? "Kris"];
        for (var k = 0; k < array_length(member_spells); k++) 
        {
            var spell = member_spells[k]; // Define the spell variable here
            var spell_text = string(spell.tpCost) + "% " + string(spell.name);
            draw_set_color(c_gray);
            draw_text_transformed(t_x + 335, t_y + 245 + (k * 25), spell_text, 1.1, 1.1, 0);
            draw_set_color(c_white);
            if (k == selected_power) 
            {
                spell_desc = spell.description;
            }
        }
    }
}

//Equip menu
if (equip_menu_active)
{
 draw_sprite_ext(spr_menu_weapons, 0, t_x + 86, t_y + 100, 1.7, 1.7, 0, c_white, 1);
  var member_name; // Define outside the loop
    var member_index; // Define outside the loop
    var kris_face_x = t_x + 270 - 110; // Corrected variable assignment
    var kris_face_y = t_y + 276 - 5 - 102;
	var simbol_atk = spr_simbol_sword;
	var description_equip = " ";
	
	
	
	  draw_set_font(fnt_dt_mono_BIG);
    draw_text_transformed(kris_face_x - 35, kris_face_y + 58,  "Attack:  ", 1.05, 1.05, 0);
    draw_text_transformed(kris_face_x - 35, kris_face_y + 82,  "Defense: ", 1.05, 1.05, 0);
    draw_text_transformed(kris_face_x - 35, kris_face_y + 105, "Magic:   ", 1.05, 1.05, 0);
	draw_sprite_ext(spr_symbol_mini_sword, 0, kris_face_x - 55, kris_face_y + 58, 1.9, 1.9, 0, c_white, 1);
    draw_sprite_ext(spr_symbol_mini_shield, 0, kris_face_x - 55, kris_face_y + 82, 1.9, 1.9, 0, c_white, 1);
    draw_sprite_ext(spr_symbol_mini_mag, 0, kris_face_x - 55, kris_face_y + 105, 1.9, 1.9, 0, c_white, 1);

    var atk, df, mag, new_atk, new_df, new_mag; // Variables to hold stats

    if (global.member[0] == true) 
    {
        if (global.num_active_members == 1) 
        {
            draw_set_font(fnt_dt_mono_BIG);
            draw_text(kris_face_x, kris_face_y - 45, "Kris");
			
            draw_sprite_ext(simbol_atk, 0, kris_face_x + 133, kris_face_y - 45, 1.9, 1.9, 0, c_white, 1);
			draw_text(kris_face_x + 185, kris_face_y - 32, weapon);
			if weapon = " "
			{draw_text(kris_face_x + 185, kris_face_y - 32, "---------");}
			scr_weaponinfo(weapon)
			if line_1 == true and selecting_person != true and selecting_weapon != true
			{
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.weapondesctemp, 30, 435, 1, 1, 0);
			}
			
			
			//draw weapon abilities
			if selecting_weapon != true
			{
			  draw_sprite_ext(global.weaponabilityicontemp, 0, kris_face_x - 55, kris_face_y + 129, 1.9, 1.9, 0, c_orange, 1);
			  var kris_line_1 = draw_text_transformed(kris_face_x - 35, kris_face_y + 129, global.weaponabilitytemp, 1.15, 1.15, 0);
			  	if global.weaponabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var kris_line_1 = draw_text_transformed(kris_face_x - 35, kris_face_y + 129,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			}
			if selecting_weapon == true
			{
			 	scr_weaponinfo(global.weapons[weapon_selected])
				draw_set_color(c_yellow)
				draw_sprite_ext(global.weaponabilityicontemp, 0, kris_face_x - 55, kris_face_y + 129, 1.9, 1.9, 0, c_yellow, 1);
			    var kris_line_1 = draw_text_transformed(kris_face_x - 35, kris_face_y + 129, global.weaponabilitytemp, 1.15, 1.15, 0);
				if global.weaponabilitytemp == " "
				{
				    draw_set_color(c_yellow)
					var kris_line_1 = draw_text_transformed(kris_face_x - 35, kris_face_y + 129,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			    draw_set_color(c_white)
				draw_text_ext_transformed(t_x + 35, t_y + 20, global.weapondesctemp, 30, 435, 1, 1, 0);
			}
			
            draw_sprite_ext(spr_simbol_shield_I, 0, kris_face_x + 133, kris_face_y - 15, 1.9, 1.9, 0, c_white, 1);
	        draw_text(kris_face_x + 185, kris_face_y - 5,armor_I)
			if armor_I == " "
			{draw_text(kris_face_x + 185, kris_face_y - 5,"--------")}
		
			draw_sprite_ext(spr_simbol_shield_II, 0, kris_face_x + 133, kris_face_y + 15, 1.9, 1.9, 0, c_white, 1);
			draw_text(kris_face_x + 185, kris_face_y + 20,armor_II)
			if armor_II == " " 
			{draw_text(kris_face_x + 185, kris_face_y + 20,"--------")}
			
			//draw armor description and abilities
			 if line_2 == true and selecting_bars
			{  
				scr_armorinfo(armor_I)
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
			}
			 if !selecting_armor
			{
			 		scr_armorinfo(armor_I)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 56, kris_face_y + 150, 1.9, 1.9, 0, c_orange, 1);
			    var _line_2 = draw_text_transformed(kris_face_x - 35, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);	
				if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_2 = draw_text_transformed(kris_face_x - 35, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			}
			
			 if line_3 == true and selecting_bars
			   {
				   scr_armorinfo(armor_II)
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
			
		  	   }
			 if !selecting_armor
			{
			 		scr_armorinfo(armor_II)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 56, kris_face_y + 170, 1.9, 1.9, 0, c_orange, 1);
			    var _line_3 = draw_text_transformed(kris_face_x - 35, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
			    if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_3 = draw_text_transformed(kris_face_x - 35, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			}
			  
			//Selecting armor description and ability
			if selecting_armor
			{
			 		scr_armorinfo(global.armors[armor_selected])
					draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
					draw_set_color(c_yellow)
					if line_2
					{
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 56, kris_face_y + 150, 1.9, 1.9, 0, c_yellow, 1);
			    var _line_2 = draw_text_transformed(kris_face_x - 35, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);	
				if global.armorabilitytemp == " "
				{
	
					var _line_2 = draw_text_transformed(kris_face_x - 35, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					
				}
				draw_set_color(c_white)
				scr_armorinfo(armor_II)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 56, kris_face_y + 170, 1.9, 1.9, 0, c_orange, 1);
			    var _line_3 = draw_text_transformed(kris_face_x - 35, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
                if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_3 = draw_text_transformed(kris_face_x - 35, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
				}
				    if line_3
				{
					draw_set_color(c_yellow)
				    draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 56, kris_face_y + 170, 1.9, 1.9, 0, c_yellow, 1);
			        var _line_3 = draw_text_transformed(kris_face_x - 35, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
				    if global.armorabilitytemp == " "
				   {
				   
					var _line_3 = draw_text_transformed(kris_face_x - 35, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
				
				   }
				    draw_set_color(c_white)
				    scr_armorinfo(armor_I)
				    draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 56, kris_face_y + 150, 1.9, 1.9, 0, c_orange, 1);
			        var _line_2 = draw_text_transformed(kris_face_x - 35, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);
				    if global.armorabilitytemp == " "
				   {
				    draw_set_color(c_gray)
					var _line_2 = draw_text_transformed(kris_face_x - 35, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				   }
				}
			}
			
			
            // Fetch Kris's stats
            atk = global.real_atk_K;
            df = global.real_df_K;
            mag = global.real_mag_K;
			new_atk = global.real_atk_K - global.current_weapon_atk_K;
			new_df = global.real_df_K - global.current_weapon_df_K;
	     	new_mag = global.real_mag_K - global.current_weapon_mag_K;
	var		new_atk_armor = global.real_atk_K - global.current_armor1_atk_K;
	var		new_df_armor =  global.real_df_K - global.current_armor1_df_K;
	var		new_mag_armor = global.real_mag_K - global.current_armor1_mag_K;
	
	if selecting_armor
	{
		if equipping_armor_slot == 1
		{
			new_atk_armor = global.real_atk_K - global.current_armor1_atk_K;
			new_df_armor =  global.real_df_K - global.current_armor1_df_K;
			new_mag_armor = global.real_mag_K - global.current_armor1_mag_K;
		}
		if equipping_armor_slot == 2
		{
			new_atk_armor = global.real_atk_K - global.current_armor2_atk_K;
			new_df_armor =  global.real_df_K - global.current_armor2_df_K;
			new_mag_armor = global.real_mag_K - global.current_armor2_mag_K;
		}
	}
	
            if !selecting_weapon and !selecting_armor
			{
            draw_text_transformed(kris_face_x + 85, kris_face_y + 58, string(atk), 1.05, 1.05, 0);
            draw_text_transformed(kris_face_x + 85, kris_face_y + 82, string(df), 1.05, 1.05, 0);
            draw_text_transformed(kris_face_x + 85, kris_face_y + 105, string(mag), 1.05, 1.05, 0);
			}
			if selecting_weapon
			{
				scr_weaponinfo(global.weapons[weapon_selected])
				
				if (new_atk + global.weaponattemp) > atk 
				{draw_set_color(c_yellow)}
				else
				if (new_atk + global.weaponattemp) < atk 
				{draw_set_color(c_red)}
				else
				if (new_atk + global.weaponattemp) = atk 
				{draw_set_color(c_white)}
		      draw_text_transformed(kris_face_x + 85, kris_face_y + 58, string(new_atk + global.weaponattemp), 1.05, 1.05, 0);
			  
				if (new_df + global.weapondftemp) > df 
				{draw_set_color(c_yellow)}
				else
				if (new_df + global.weapondftemp) < df 
				{draw_set_color(c_red)}
				else
				if (new_df + global.weapondftemp) = df 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 85, kris_face_y + 82, string(new_df + global.weapondftemp), 1.05, 1.05, 0);
			  
				if (new_mag + global.weaponmagtemp) > mag 
				{draw_set_color(c_yellow)}
				else
				if (new_mag + global.weaponmagtemp) < mag 
				{draw_set_color(c_red)}
				else
				if (new_mag + global.weaponmagtemp) = mag 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 85, kris_face_y + 105, string(new_mag + global.weaponmagtemp), 1.05, 1.05, 0);
			}
			 draw_set_color(c_white)
			if selecting_armor
			{
				
				scr_armorinfo(global.armors[armor_selected]);
				
				if (new_atk_armor + global.armorattemp) > atk 
				{draw_set_color(c_yellow)}
				else
				if (new_atk_armor + global.armorattemp) < atk 
				{draw_set_color(c_red)}
				else
				if (new_atk_armor + global.armorattemp) = atk 
				{draw_set_color(c_white)}
		      draw_text_transformed(kris_face_x + 85, kris_face_y + 58, string(new_atk_armor + global.armorattemp), 1.05, 1.05, 0);
			  
				if (new_df + global.armordftemp) > df 
				{draw_set_color(c_yellow)}
				else
				if (new_df_armor + global.armordftemp) < df 
				{draw_set_color(c_red)}
				else
				if (new_df_armor + global.armordftemp) = df 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 85, kris_face_y + 82, string(new_df_armor + global.armordftemp), 1.05, 1.05, 0);
			  
				if (new_mag_armor + global.armormagtemp) > mag 
				{draw_set_color(c_yellow)}
				else
				if (new_mag_armor + global.armormagtemp) < mag 
				{draw_set_color(c_red)}
				else
				if (new_mag_armor + global.armormagtemp) = mag 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 85, kris_face_y + 105, string(new_mag_armor + global.armormagtemp), 1.05, 1.05, 0);
			}
			 draw_set_color(c_white)

            // Get the selected party member's name
            var members_name = global.party_order[selected_info];
        } 
        else 
        {
            kris_face_x = t_x + 270 - 160;
        }
        draw_sprite_ext(spr_kris_head, 0, kris_face_x, kris_face_y, 2, 2, 0, c_white, 1);
    }

    // Draw other members based on global.party_order
    for (var i = 0; i < array_length(global.party_order); i++) 
    {
        var member_order = global.party_order[i]; // Correct assignment of member name
        member_index = -1;

        // Find the index of the member in global.memberData
        for (var j = 1; j < array_length(global.memberData); j++) 
        {
            if (global.memberData[j].name == member_order) 
            {
                member_index = j;
                break;
            }
        }

        if (member_index != -1 && global.member[member_index]) 
        {
            var member = global.memberData[member_index];
            var power_face_sprite = member.face;
            var power_face_x = 0;
            var power_face_y = t_y + 276 - 5 - 102;

            if (global.num_active_members == 2) 
            {
                power_face_x = t_x + 315 - 150;
            } 
            else 
            {
                power_face_x = t_x + 100 + i * 50;
            }

            // Fetch the stats for the member
			

			
            if (member.name == "Kris")
			{
                atk = global.real_atk_K;
                df = global.real_df_K;
                mag = global.real_mag_K;
	    		new_atk = atk - global.current_weapon_atk_K;
			    new_df =  df  - global.current_weapon_df_K;
			    new_mag = mag - global.current_weapon_mag_K;
	var		new_atk_armor = atk - global.current_armor1_atk_K;
	var		new_df_armor =  df  - global.current_armor1_df_K;
	var		new_mag_armor = mag - global.current_armor1_mag_K;
                if selecting_armor
	{
		if equipping_armor_slot == 1
		{
			new_atk_armor = atk - global.current_armor1_atk_K;
			new_df_armor =  df  - global.current_armor1_df_K;
			new_mag_armor = mag - global.current_armor1_mag_K;
		}
		if equipping_armor_slot == 2
		{
			new_atk_armor = atk - global.current_armor2_atk_K;
			new_df_armor =  df  - global.current_armor2_df_K;
			new_mag_armor = mag - global.current_armor2_mag_K;
		}
	}
            }
			else if (member.name == "Susie") 
			{
                simbol_atk = spr_simbol_axe;
                atk = global.real_atk_S;
                df = global.real_df_S;
                mag = global.real_mag_S;
	    		new_atk = atk - global.current_weapon_atk_S;
			    new_df =  df  - global.current_weapon_df_S;
			    new_mag = mag - global.current_weapon_mag_S;
	var		new_atk_armor = atk - global.current_armor1_atk_S;
	var		new_df_armor =  df  - global.current_armor1_df_S;
	var		new_mag_armor = mag - global.current_armor1_mag_S;
                if selecting_armor
	{
		if equipping_armor_slot == 1
		{
			new_atk_armor = atk - global.current_armor1_atk_S;
			new_df_armor =  df  - global.current_armor1_df_S;
			new_mag_armor = mag - global.current_armor1_mag_S;
		}
		if equipping_armor_slot == 2
		{
			new_atk_armor = atk - global.current_armor2_atk_S;
			new_df_armor =  df  - global.current_armor2_df_S;
			new_mag_armor = mag - global.current_armor2_mag_S;
		}
	}
            } 
			else if (member.name == "Ralsei") 
			{
                simbol_atk = spr_simbol_scarf;
                atk = global.real_atk_R;
                df = global.real_df_R;
                mag = global.real_mag_R;
	    		new_atk = atk - global.current_weapon_atk_R;
			    new_df =  df  - global.current_weapon_df_R;
			    new_mag = mag - global.current_weapon_mag_R;
	var		new_atk_armor = atk - global.current_armor1_atk_R;
	var		new_df_armor =  df  - global.current_armor1_df_R;
	var		new_mag_armor = mag - global.current_armor1_mag_R;
                if selecting_armor
	{
		if equipping_armor_slot == 1
		{
			new_atk_armor = atk - global.current_armor1_atk_R;
			new_df_armor =  df  - global.current_armor1_df_R;
			new_mag_armor = mag - global.current_armor1_mag_R;
		}
		if equipping_armor_slot == 2
		{
			new_atk_armor = atk - global.current_armor2_atk_R;
			new_df_armor =  df  - global.current_armor2_df_R;
			new_mag_armor = mag - global.current_armor2_mag_R;
		}
	}
            } 
			else if (member.name == "Toriel")
			{
                simbol_atk = spr_simbol_book;
                atk = global.real_atk_T;
                df = global.real_df_T;
                mag = global.real_mag_T;
	    		new_atk = atk - global.current_weapon_atk_T;
			    new_df =  df  - global.current_weapon_df_T;
			    new_mag = mag - global.current_weapon_mag_T;

	var		new_atk_armor = atk - global.current_armor1_atk_T;
	var		new_df_armor =  df  - global.current_armor1_df_T;
	var		new_mag_armor = mag - global.current_armor1_mag_T;
				if selecting_armor
	{
		if equipping_armor_slot == 1
		{
			new_atk_armor = atk - global.current_armor1_atk_T;
			new_df_armor =  df  - global.current_armor1_df_T;
			new_mag_armor = mag - global.current_armor1_mag_T;
		}
		if equipping_armor_slot == 2
		{
			new_atk_armor = atk - global.current_armor2_atk_T;
			new_df_armor =  df  - global.current_armor2_df_T;
			new_mag_armor = mag - global.current_armor2_mag_T;
		}
	}
            }

            // Check if this is the selected member
            if (i == selected_member_equip) 
            {
				

				
				if !selecting_weapon and !selecting_armor
			    {
                draw_text_transformed(kris_face_x + 135, kris_face_y + 58,  string(atk), 1.05, 1.05, 0);
                draw_text_transformed(kris_face_x + 135, kris_face_y + 82,  string(df), 1.05, 1.05, 0);
                draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(mag), 1.05, 1.05, 0);
				}	
				if selecting_weapon
			{
				scr_weaponinfo(global.weapons[weapon_selected])
				
				if (new_atk + global.weaponattemp) > atk 
				{draw_set_color(c_yellow)}
				else
				if (new_atk + global.weaponattemp) < atk 
				{draw_set_color(c_red)}
				else
				if (new_atk + global.weaponattemp) = atk 
				{draw_set_color(c_white)}
		      draw_text_transformed(kris_face_x + 135, kris_face_y + 58, string(new_atk + global.weaponattemp), 1.05, 1.05, 0);
			  
				if (new_df + global.weapondftemp) > df 
				{draw_set_color(c_yellow)}
				else
				if (new_df + global.weapondftemp) < df 
				{draw_set_color(c_red)}
				else
				if (new_df + global.weapondftemp) = df 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 82, string(new_df + global.weapondftemp), 1.05, 1.05, 0);
			  
				if (new_mag + global.weaponmagtemp) > mag 
				{draw_set_color(c_yellow)}
				else
				if (new_mag + global.weaponmagtemp) < mag 
				{draw_set_color(c_red)}
				else
				if (new_mag + global.weaponmagtemp) = mag 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(new_mag + global.weaponmagtemp), 1.05, 1.05, 0);
			}
			    draw_set_color(c_white)
				if selecting_armor
			{
				
				scr_armorinfo(global.armors[armor_selected]);
				
				if (new_atk_armor + global.armorattemp) > atk 
				{draw_set_color(c_yellow)}
				else
				if (new_atk_armor + global.armorattemp) < atk 
				{draw_set_color(c_red)}
				else
				if (new_atk_armor + global.armorattemp) = atk 
				{draw_set_color(c_white)}
		      draw_text_transformed(kris_face_x + 135, kris_face_y + 58, string(new_atk_armor + global.armorattemp), 1.05, 1.05, 0);
			  
				if (new_df + global.armordftemp) > df 
				{draw_set_color(c_yellow)}
				else
				if (new_df_armor + global.armordftemp) < df 
				{draw_set_color(c_red)}
				else
				if (new_df_armor + global.armordftemp) = df 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 82, string(new_df_armor + global.armordftemp), 1.05, 1.05, 0);
			  
				if (new_mag_armor + global.armormagtemp) > mag 
				{draw_set_color(c_yellow)}
				else
				if (new_mag_armor + global.armormagtemp) < mag 
				{draw_set_color(c_red)}
				else
				if (new_mag_armor + global.armormagtemp) = mag 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(new_mag_armor + global.armormagtemp), 1.05, 1.05, 0);
			}
			    draw_set_color(c_white)
			 
					
	          draw_sprite_ext(simbol_atk, 0, kris_face_x + 183, kris_face_y - 45, 1.9, 1.9, 0, c_white, 1);
		      draw_text(kris_face_x + 235, kris_face_y - 32, weapon);
			  if weapon == " "
			  {draw_text(kris_face_x + 235, kris_face_y - 32, "-------");}
		      scr_weaponinfo(weapon)
			  
		      
			//draw weapon abilities
			if selecting_weapon != true
			{
			  	draw_sprite_ext(global.weaponabilityicontemp, 0, kris_face_x - 4, kris_face_y + 133, 1.9, 1.9, 0, c_orange, 1);
			    var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, global.weaponabilitytemp, 1.15, 1.15, 0);
                if global.weaponabilitytemp == " "
				{draw_set_color(c_grey)
				 var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, "-------", 1.15, 1.15, 0);
				 draw_set_color(c_white)
				 }
			
			if line_1 == true and selecting_person != true
			  {
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.weapondesctemp, 30, 435, 1, 1, 0);
			  }
			}
			if selecting_weapon == true
			{
			 	scr_weaponinfo(global.weapons[weapon_selected])
				draw_text_ext_transformed(t_x + 35, t_y + 20, global.weapondesctemp, 30, 435, 1, 1, 0);
				draw_set_color(c_yellow)
				draw_sprite_ext(global.weaponabilityicontemp, 0, kris_face_x - 4, kris_face_y + 133, 1.9, 1.9, 0, c_yellow, 1);
			    var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, global.weaponabilitytemp, 1.15, 1.15, 0);
				if global.weaponabilitytemp == " "
				{var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, "-------", 1.15, 1.15, 0);}
			    draw_set_color(c_white)
		
			}
			  
		      draw_sprite_ext(spr_simbol_shield_I, 0, kris_face_x + 183, kris_face_y - 15, 1.9, 1.9, 0, c_white, 1);
              draw_text(kris_face_x + 235, kris_face_y - 5, armor_I);
			  if armor_I == " "
			  {draw_text(kris_face_x + 235, kris_face_y - 5, "-------");}
		       	
		
		      draw_sprite_ext(spr_simbol_shield_II, 0, kris_face_x + 183, kris_face_y + 15, 1.9, 1.9, 0, c_white, 1);
              draw_text(kris_face_x + 235, kris_face_y + 25, armor_II);
			  if armor_II == " "
			  {draw_text(kris_face_x + 235, kris_face_y + 25, "-------");}
			  

			//draw armor description and abilities
			 if line_2 == true and selecting_bars
			{  
				scr_armorinfo(armor_I)
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
			}
			 if !selecting_armor
			{
			 		scr_armorinfo(armor_I)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 150, 1.9, 1.9, 0, c_orange, 1);
			    var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);	
				if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			}
			
			 if line_3 == true and selecting_bars
			   {
				   scr_armorinfo(armor_II)
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
			
		  	   }
			 if !selecting_armor
			{
			 		scr_armorinfo(armor_II)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 170, 1.9, 1.9, 0, c_orange, 1);
			    var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
			    if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			}
			  
			//Selecting armor description and ability
			if selecting_armor
			{
			 		scr_armorinfo(global.armors[armor_selected])
					draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
					draw_set_color(c_yellow)
					if line_2
					{
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 150, 1.9, 1.9, 0, c_yellow, 1);
			    var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);	
				if global.armorabilitytemp == " "
				{
	
					var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					
				}
				draw_set_color(c_white)
				scr_armorinfo(armor_II)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 170, 1.9, 1.9, 0, c_orange, 1);
			    var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
                if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
				}
				    if line_3
				{
					draw_set_color(c_yellow)
				    draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 170, 1.9, 1.9, 0, c_yellow, 1);
			        var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
				    if global.armorabilitytemp == " "
				   {
				   
					var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
				
				   }
				    draw_set_color(c_white)
				    scr_armorinfo(armor_I)
				    draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 150, 1.9, 1.9, 0, c_orange, 1);
			        var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);
				    if global.armorabilitytemp == " "
				   {
				    draw_set_color(c_gray)
					var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				   }
				}
			}
		
			

		
    
            //Draw party member names and description
            draw_text(kris_face_x + 35, power_face_y - 45, member.name);

           
        }
		 
		 //Draw the face
		  draw_sprite_ext(power_face_sprite, 0, power_face_x, power_face_y - 8, 2, 2, 0, c_white, 1);
            
		if (selected_member_equip == 0 && global.num_active_members > 1) 
    {
        draw_set_font(fnt_dt_mono_BIG);
		draw_text(kris_face_x + 35, power_face_y - 45, "Kris");  //draw the name			
       
	          draw_sprite_ext(spr_simbol_sword, 0, kris_face_x + 183, kris_face_y - 45, 1.9, 1.9, 0, c_white, 1);
		      draw_text(kris_face_x + 235, kris_face_y - 32, weapon);
			  scr_weaponinfo(weapon)
			
			//draw weapon abilities
			if selecting_weapon != true
			{
			  	draw_sprite_ext(global.weaponabilityicontemp, 0, kris_face_x - 4, kris_face_y + 133, 1.9, 1.9, 0, c_orange, 1);
			   var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, global.weaponabilitytemp, 1.15, 1.15, 0);
			   if global.weaponabilitytemp == " "
				{var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, "-------", 1.15, 1.15, 0);}

			
			if line_1 == true and selecting_person != true
			  {
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.weapondesctemp, 30, 435, 1, 1, 0);
			  }
			}
			if selecting_weapon == true
			{
			 	scr_weaponinfo(global.weapons[weapon_selected])
				draw_text_ext_transformed(t_x + 35, t_y + 20, global.weapondesctemp, 30, 435, 1, 1, 0);
				draw_set_color(c_yellow)
				draw_sprite_ext(global.weaponabilityicontemp, 0, kris_face_x - 4, kris_face_y + 133, 1.9, 1.9, 0, c_yellow, 1);
			    var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, global.weaponabilitytemp, 1.15, 1.15, 0);
				if global.weaponabilitytemp == " "
				{var _line_1 = draw_text_transformed(kris_face_x + 15, kris_face_y + 129, "-------", 1.15, 1.15, 0);}
			    draw_set_color(c_white)
		
			}
			
		      draw_sprite_ext(spr_simbol_shield_I, 0, kris_face_x + 183, kris_face_y - 15, 1.9, 1.9, 0, c_white, 1);
              draw_text(kris_face_x + 235, kris_face_y - 5, armor_I);
			  scr_armorinfo(armor_I)
			  if armor_I == " "
			  {draw_text(kris_face_x + 235, kris_face_y - 5, "-------");}

		
		      draw_sprite_ext(spr_simbol_shield_II, 0, kris_face_x + 183, kris_face_y + 15, 1.9, 1.9, 0, c_white, 1);
              draw_text(kris_face_x + 235, kris_face_y + 25, armor_II);
			  if armor_II == " "
			  {draw_text(kris_face_x + 235, kris_face_y + 25, "-------");}


			//draw armor description and abilities
			 if line_2 == true and selecting_bars
			{  
				scr_armorinfo(armor_I)
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
			}
			 if !selecting_armor
			{
			 		scr_armorinfo(armor_I)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 150, 1.9, 1.9, 0, c_orange, 1);
			    var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);	
				if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			}
			
			 if line_3 == true and selecting_bars
			   {
				   scr_armorinfo(armor_II)
			 	draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
			
		  	   }
			 if !selecting_armor
			{
			 		scr_armorinfo(armor_II)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 170, 1.9, 1.9, 0, c_orange, 1);
			    var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
			    if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
			}
			  
			//Selecting armor description and ability
			if selecting_armor
			{
			 		scr_armorinfo(global.armors[armor_selected])
					draw_text_ext_transformed(t_x + 35, t_y + 20, global.armordesctemp, 30, 435, 1, 1, 0);
					draw_set_color(c_yellow)
					if line_2
					{
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 150, 1.9, 1.9, 0, c_yellow, 1);
			    var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);	
				if global.armorabilitytemp == " "
				{
	
					var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					
				}
				draw_set_color(c_white)
				scr_armorinfo(armor_II)
				draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 170, 1.9, 1.9, 0, c_orange, 1);
			    var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
                if global.armorabilitytemp == " "
				{
				    draw_set_color(c_gray)
					var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				}
				}
				    if line_3
				{
					draw_set_color(c_yellow)
				    draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 170, 1.9, 1.9, 0, c_yellow, 1);
			        var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169, global.armorabilitytemp, 1.15, 1.15, 0);	
				    if global.armorabilitytemp == " "
				   {
				   
					var _line_3 = draw_text_transformed(kris_face_x + 15, kris_face_y + 169,"-----------", 1.15, 1.15, 0);	
				
				   }
				    draw_set_color(c_white)
				    scr_armorinfo(armor_I)
				    draw_sprite_ext(global.armorabilityicontemp, 0, kris_face_x - 4, kris_face_y + 150, 1.9, 1.9, 0, c_orange, 1);
			        var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149, global.armorabilitytemp, 1.15, 1.15, 0);
				    if global.armorabilitytemp == " "
				   {
				    draw_set_color(c_gray)
					var _line_2 = draw_text_transformed(kris_face_x + 15, kris_face_y + 149,"-----------", 1.15, 1.15, 0);	
					draw_set_color(c_white)	
				   }
				}
			}


            // Fetch Kris's stats
            atk = global.real_atk_K;
            df = global.real_df_K;
            mag = global.real_mag_K;
			new_atk = global.real_atk_K - global.current_weapon_atk_K;
			new_df = global.real_df_K - global.current_weapon_df_K;
	     	new_mag = global.real_mag_K - global.current_weapon_mag_K;
	var		new_atk_armor = global.real_atk_K - global.current_armor1_atk_K;
	var		new_df_armor =  global.real_df_K - global.current_armor1_df_K;
	var		new_mag_armor = global.real_mag_K - global.current_armor1_mag_K;
	
	if selecting_armor
	{
		if equipping_armor_slot == 1
		{
			new_atk_armor = global.real_atk_K - global.current_armor1_atk_K;
			new_df_armor =  global.real_df_K - global.current_armor1_df_K;
			new_mag_armor = global.real_mag_K - global.current_armor1_mag_K;
		}
		if equipping_armor_slot == 2
		{
			new_atk_armor = global.real_atk_K - global.current_armor2_atk_K;
			new_df_armor =  global.real_df_K - global.current_armor2_df_K;
			new_mag_armor = global.real_mag_K - global.current_armor2_mag_K;
		}
	}

				if !selecting_weapon and !selecting_armor
			    {
                draw_text_transformed(kris_face_x + 135, kris_face_y + 58,  string(atk), 1.05, 1.05, 0);
                draw_text_transformed(kris_face_x + 135, kris_face_y + 82,  string(df), 1.05, 1.05, 0);
                draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(mag), 1.05, 1.05, 0);
				}	
				if selecting_weapon
			{
				scr_weaponinfo(global.weapons[weapon_selected])
				
				if (new_atk + global.weaponattemp) > atk 
				{draw_set_color(c_yellow)}
				else
				if (new_atk + global.weaponattemp) < atk 
				{draw_set_color(c_red)}
				else
				if (new_atk + global.weaponattemp) = atk 
				{draw_set_color(c_white)}
		      draw_text_transformed(kris_face_x + 135, kris_face_y + 58, string(new_atk + global.weaponattemp), 1.05, 1.05, 0);
			  
				if (new_df + global.weapondftemp) > df 
				{draw_set_color(c_yellow)}
				else
				if (new_df + global.weapondftemp) < df 
				{draw_set_color(c_red)}
				else
				if (new_df + global.weapondftemp) = df 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 82, string(new_df + global.weapondftemp), 1.05, 1.05, 0);
			  
				if (new_mag + global.weaponmagtemp) > mag 
				{draw_set_color(c_yellow)}
				else
				if (new_mag + global.weaponmagtemp) < mag 
				{draw_set_color(c_red)}
				else
				if (new_mag + global.weaponmagtemp) = mag 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(new_mag + global.weaponmagtemp), 1.05, 1.05, 0);
			}
			    draw_set_color(c_white)
				if selecting_armor
			{
				
				scr_armorinfo(global.armors[armor_selected]);
				
				if (new_atk_armor + global.armorattemp) > atk 
				{draw_set_color(c_yellow)}
				else
				if (new_atk_armor + global.armorattemp) < atk 
				{draw_set_color(c_red)}
				else
				if (new_atk_armor + global.armorattemp) = atk 
				{draw_set_color(c_white)}
		      draw_text_transformed(kris_face_x + 135, kris_face_y + 58, string(new_atk_armor + global.armorattemp), 1.05, 1.05, 0);
			  
				if (new_df + global.armordftemp) > df 
				{draw_set_color(c_yellow)}
				else
				if (new_df_armor + global.armordftemp) < df 
				{draw_set_color(c_red)}
				else
				if (new_df_armor + global.armordftemp) = df 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 82, string(new_df_armor + global.armordftemp), 1.05, 1.05, 0);
			  
				if (new_mag_armor + global.armormagtemp) > mag 
				{draw_set_color(c_yellow)}
				else
				if (new_mag_armor + global.armormagtemp) < mag 
				{draw_set_color(c_red)}
				else
				if (new_mag_armor + global.armormagtemp) = mag 
				{draw_set_color(c_white)}
              draw_text_transformed(kris_face_x + 135, kris_face_y + 105, string(new_mag_armor + global.armormagtemp), 1.05, 1.05, 0);
			}
			    draw_set_color(c_white)
		
		if selecting_armor or selecting_weapon
		{
			if keyboard_check(global.confirm)
		 {	
			 if instance_exists(obj_follower_suzy)
			draw_text(member_bar_x+10,member_bar_y+30,amessage2temp)
			 if instance_exists(obj_follower_ralsei)
			draw_text(member_bar_x+10,member_bar_y+30,amessage3temp)
			 if instance_exists(obj_follower_Toriel_dark)
			draw_text(member_bar_x+10,member_bar_y+30,amessage4temp)
			
			
		 }
		}
        
	 }
		
		
		
    }
	}
	


	
// Draw list
draw_set_font(fnt_dt_mono_BIG);
if (surface_exists(viewport_surface)) 
{
    // Set the surface as the target for drawing
    surface_set_target(viewport_surface);
    // Clear the surface with transparency
    draw_clear_alpha(c_black, 0);

    // Determine which list to use and the scroll position
    var list_items = [];
    
    if (line_1 or selecting_person) 
	{
        list_items = global.weapons;

    }
	else if ((line_2 or line_3) and selecting_bars or selecting_armor) 
	{
        list_items = global.armors;

    }
	
	if (!selecting_weapon and !selecting_armor)  // Make the list grey when it's not modifiable
	{
		draw_set_color(c_gray);
	} 
	else
	{
		draw_set_color(c_white);
	}
    
	
    // Calculate which items to draw based on the scroll position
    var start_index = floor(scroll_y / item_height);
    var end_index = min(start_index + ceil(view_height / item_height), array_length(list_items));
      
	  scr_init_weapon_icons()
	  
// Draw each item in the visible range on the surface
for (var i = start_index; i < end_index; i++) 
{
    var item_y = (i - start_index) * item_height - (scroll_y % item_height);
    var item_text = list_items[i];
    var weapon_icon = global.weapon_icons[? item_text];
	var armor_icon = global.armoricontemp;

    var can_equip = true;

    // Determine which character is currently equipping
    if (selecting_weapon) 
    {
        if (equipping_kris) 
        {
            can_equip = weaponchar1temp
        } 
        else if (equipping_susie) 
        {
            can_equip = weaponchar2temp
        } 
        else if (equipping_ralsei) 
        {
            can_equip = weaponchar3temp
        } 
        else if (equipping_toriel) 
        {
            can_equip = weaponchar4temp
        }
    } 
    else if (selecting_armor) 
    {
		/*
        if (equipping_kris) 
        {
            can_equip = armorchar1temp
        } 
        else if (equipping_susie) 
        {
            can_equip = armorchar2temp
        } 
        else if (equipping_ralsei) 
        {
            can_equip = armorchar3temp
        } 
        else if (equipping_toriel) 
        {
            can_equip = armorchar4temp
        }
		*/
		
    }

    // Change text color if the item can't be equipped
    if (!can_equip || item_text == " ") 
    {
        draw_set_color(c_gray);
    } 
    else 
    {
        draw_set_color(c_white);
    }

    // Draw item text
    if (item_text == " ") 
    {
        item_text = "------------";
		armor_icon = spr_symbol_mini_empty;
    }

    if (selecting_armor or line_2 or line_3) 
    {
		if item_text != " "
        draw_sprite_ext(armor_icon, 0, 0, item_y, 1.5, 1.5, 0, c_white, 1);
    } 
    else if (selecting_weapon or line_1 or !selecting_armor) 
    {
        draw_sprite_ext(weapon_icon, 0, 0, item_y - 3, 1.9, 1.9, 0, c_white, 1);
    }

    draw_text(20, item_y, item_text);

    // Reset color
    draw_set_color(c_white);
}

// Reset the drawing target to the screen
surface_reset_target();

// Draw the surface to the screen at the specified position
draw_surface(viewport_surface, view_x, view_y);


}
}

//Option menu
if options_menu_active == true
{
  draw_sprite_ext(spr_menu_settings, 0, t_x + 86, t_y + 100, 1.7, 1.7, 0, c_white, 1);
  
  draw_set_font(fnt_dt_mono)
  if !controls
  {
  draw_text_transformed(t_x + 265,t_y + 108,"Config     ",2,2,0)
  if selected_volume
  {draw_set_color(c_yellow)}
  else
  {draw_set_color(c_white)}
  draw_text_transformed(t_x + 170,t_y + 150,"Master Volume     " + string(global.volume)+"%",2,2,0)
  draw_set_color(c_white)
  draw_text_transformed(t_x + 170,t_y + 180,"Controls",2,2,0)
  draw_text_transformed(t_x + 170,t_y + 210,"Simplify VFX      " + string(val),2,2,0)
  draw_text_transformed(t_x + 170,t_y + 240,"Fullscreen        " + string(fullscreen),2,2,0)
  draw_text_transformed(t_x + 170,t_y + 270,"AutoRun           " + string(run),2,2,0)
  draw_text_transformed(t_x + 170,t_y + 300,"Return to Title",2,2,0)
  draw_text_transformed(t_x + 170,t_y + 330,"Back",2,2,0)
  }
  else
  {
  draw_text_transformed(t_x + 120,t_y + 108,"Function      " + "Key    " + "Gamepad",1.9,1.9,0)
  if option_selected == 0
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 150,"DOWN           " + key_to_string(global.down),1.8,1.8,0)
  draw_sprite_ext(controller_down,0,t_x + 480, t_y + 150,1.2,1.2,0,c_white,1)
  draw_set_color(c_white) 
  
  if option_selected == 1
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 175,"RIGHT          " + key_to_string(global.right),1.8,1.8,0) 
  draw_sprite_ext(controller_right,0,t_x + 480, t_y + 175,1.2,1.2,0,c_white,1)
  draw_set_color(c_white)
  
  if option_selected == 2
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 200,"UP             " + key_to_string(global.up),1.8,1.8,0)
  draw_sprite_ext(controller_up,0,t_x + 480, t_y + 200,1.2,1.2,0,c_white,1)
  draw_set_color(c_white) 
  
  if option_selected == 3
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 225,"LEFT           " + key_to_string(global.left),1.8,1.8,0) 
  draw_sprite_ext(controller_left,0,t_x + 480, t_y + 225,1.2,1.2,0,c_white,1)
  draw_set_color(c_white)
  
    if option_selected == 4
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 250,"CONFIRM        " + key_to_string(global.confirm),1.8,1.8,0)
  draw_sprite_ext(button_xbox_a,0,t_x + 485, t_y + 255,1.4,1.4,0,c_white,1)
  draw_set_color(c_white) 
  
  if option_selected == 5
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 275,"CANCEL         " + key_to_string(global.cancel),1.8,1.8,0) 
  draw_sprite_ext(button_xbox_b,0,t_x + 485, t_y + 280,1.4,1.4,0,c_white,1)
  draw_set_color(c_white)
  
    if option_selected == 6
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 300,"MENU           " + key_to_string(global.menu),1.8,1.8,0)
  draw_sprite_ext(button_xbox_y,0,t_x + 485, t_y + 305,1.4,1.4,0,c_white,1)
  draw_set_color(c_white) 
  
  if option_selected == 7
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 325,"Reset to Default",1.8,1.8,0) 
  draw_set_color(c_white)
  
  if option_selected == 8
  {
	draw_set_color(selected_color)  
  }
  else
  {
	draw_set_color(c_white)  
  }
  draw_text_transformed(t_x + 120,t_y + 350,"Finish",1.8,1.8,0) 
  
  }
	
}





}

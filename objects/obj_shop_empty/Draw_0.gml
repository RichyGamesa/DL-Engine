// Draw GUI event of the shop menu object
if background != noone
draw_sprite_ext(background, 0, t_x + 155, t_y + 70,0.35,0.35,0,c_white,1)

draw_self(); // Draw the default sprite of the object

draw_set_font(fnt_dt_mono)
var _y = t_y + 140; // Starting y position for the first item

if talk == false
draw_text(213, 215, "$" + string(global.gold));

if (buying_mode)
{
	draw_sprite_part(spr_menu_buy,0,0,menu_shop_pos,121,104,t_x+200,t_y +15)
    // Draw the shop items, prices, and descriptions
    for (var i = 0; i < array_length(shop_items); i++) 
	{

       if (bought[i]) 
	   {
            draw_set_color(c_gray); // Set color to grey for bought items
	   } 
	   else 
	   {
            draw_set_color(c_white); // Set color to white for items that are not bought
       }
	   
        draw_text(27, _y, shop_items[i]);
		
		
		if bought[i] = false
        draw_text(163, _y, "$" + string(shop_prices[i]));
		else
		{
		draw_text(155, _y, "Bought");	
		}

		if (bought[selected_button]) == false
		{
			draw_set_color(c_white)
		}
		else
		{
			draw_set_color(c_grey)
		}
        _y += 20; // Move down for the next item
		
		if shop_desc_type == "Item"
		{
        draw_text(242, 25 - menu_shop_pos , shop_desc_type[selected_button]); // Draw description type of selected item
		}
		else
		{
		 draw_text(235, 25 - menu_shop_pos , shop_desc_type[selected_button]); // Draw description type of selected item
		}
	    draw_text_ext(220, 40 - menu_shop_pos , shop_desc[selected_button], 10, 82); // Draw description of selected item
        draw_set_color(c_white); // Reset color
		
		if shop_desc_type[selected_button] == "Armor"
		{
				scr_armorinfo(shop_items[selected_button])
			
		  if array_contains(global.party_order,"Kris")
		  {
		    if armorchar1temp == true
			{
			draw_sprite_ext(spr_krisb_face,0,220, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_simbol_shield_I,0,240, 80 - menu_shop_pos, 0.5,0.5,0,c_white,1)
			draw_sprite_ext(spr_simbol_shield_II,0,240, 87 - menu_shop_pos, 0.5,0.5,0,c_white,1)
			if global.current_armor1_df_K < global.armordftemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(248,80 - menu_shop_pos,"+" + string((global.armordftemp)),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(248,80 - menu_shop_pos,"-" + string((global.armordftemp - global.current_armor1_df_K )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			if global.current_armor2_df_K < global.armordftemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(248,87 - menu_shop_pos,"+" + string(global.armordftemp),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(248,87 - menu_shop_pos,"-" + string((global.armordftemp - global.current_armor2_df_K )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			}
			else
			{
				draw_sprite_ext(spr_krisb_face_shop,0,220, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			}
		  }
		  if array_contains(global.party_order,"Susie")
		  {
		    if armorchar2temp == true
			{
			draw_sprite_ext(spr_susieb_face,0,265, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_simbol_shield_I,0,290, 80 - menu_shop_pos, 0.5,0.5,0,c_white,1)
			draw_sprite_ext(spr_simbol_shield_II,0,290, 87 - menu_shop_pos, 0.5,0.5,0,c_white,1)
			if global.current_armor1_df_S < global.armordftemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(298,80 - menu_shop_pos,"+" + string((global.armordftemp)),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(298,80 - menu_shop_pos,"-" + string((global.armordftemp - global.current_armor1_df_S )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			if global.current_armor2_df_S < global.armordftemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(298,87 - menu_shop_pos,"+" + string(global.armordftemp),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(298,87 - menu_shop_pos,"-" + string((global.armordftemp - global.current_armor2_df_S )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			}
			else
			{
			draw_sprite_ext(spr_susieb_face_shop,0,265, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			}
		  }
		  if array_contains(global.party_order,"Ralsei")
		  {
		    if armorchar3temp == true
			{
			draw_sprite_ext(spr_ralseib_face,0,218, 105 - menu_shop_pos,0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_simbol_shield_I,0,240, 100 - menu_shop_pos, 0.5,0.5,0,c_white,1)
			draw_sprite_ext(spr_simbol_shield_II,0,240, 108 - menu_shop_pos, 0.5,0.5,0,c_white,1)
			if global.current_armor1_df_R < global.armordftemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(248,100 - menu_shop_pos,"+" + string((global.armordftemp)),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(248,100 - menu_shop_pos,"-" + string((global.armordftemp - global.current_armor1_df_R )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			if global.current_armor2_df_R < global.armordftemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(248,108 - menu_shop_pos,"+" + string(global.armordftemp),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(248,108 - menu_shop_pos,"-" + string((global.armordftemp - global.current_armor2_df_R )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			}
			else
			{
			draw_sprite_ext(spr_ralseib_face_shop,0,218, 105 - menu_shop_pos,0.6,0.6,0,c_white,1)
			}
		  }
		}
		
		if shop_desc_type[selected_button] == "Weapon"
		{
				scr_weaponinfo(shop_items[selected_button])

		  if array_contains(global.party_order,"Kris")
		  {
		    if weaponchar1temp == true
			{
			draw_sprite_ext(spr_krisb_face,0,220, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_symbol_mini_sword_shop,0,240, 83 - menu_shop_pos, 0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_symbol_mini_star_shop,0,240, 93 - menu_shop_pos, 0.6,0.6,0,c_white,1)
			if global.current_weapon_atk_K < global.weaponattemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(245,78 - menu_shop_pos,"+" + string((global.weaponattemp)),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(245,78 - menu_shop_pos,"-" + string((global.weaponattemp - global.current_weapon_atk_K )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			if global.current_weapon_mag_K < global.weaponmagtemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(245,89 - menu_shop_pos,"+" + string(global.weaponmagtemp),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(245,89 - menu_shop_pos,"-" + string((global.weaponmagtemp - global.current_weapon_mag_K )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			}
			else
			{
				draw_sprite_ext(spr_krisb_face_shop,0,220, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			}
		  }
		  if array_contains(global.party_order,"Susie")
		  {
		    if weaponchar2temp == true
			{
			draw_sprite_ext(spr_susieb_face,0,265, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_symbol_mini_sword_shop,0,290, 83 - menu_shop_pos, 0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_symbol_mini_star_shop,0,290, 93 - menu_shop_pos, 0.6,0.6,0,c_white,1)
			if global.current_weapon_atk_S < global.weaponattemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(295,78 - menu_shop_pos,"+" + string((global.weaponattemp)),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(295,78 - menu_shop_pos,"-" + string((global.weaponattemp - global.current_weapon_atk_S )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			if global.current_weapon_mag_S < global.weaponmagtemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(295,89 - menu_shop_pos,"+" + string(global.weaponmagtemp),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(295,89 - menu_shop_pos,"-" + string((global.weaponmagtemp - global.current_weapon_mag_S )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			}
			else
			{
			draw_sprite_ext(spr_susieb_face_shop,0,275, 83 - menu_shop_pos,0.6,0.6,0,c_white,1)
			}
		  }
		  if array_contains(global.party_order,"Ralsei")
		  {
		    if weaponchar3temp == true
			{
			draw_sprite_ext(spr_ralseib_face,0,218, 105 - menu_shop_pos,0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_symbol_mini_sword_shop,0,240, 105 - menu_shop_pos, 0.6,0.6,0,c_white,1)
			draw_sprite_ext(spr_symbol_mini_star_shop,0,240, 115 - menu_shop_pos, 0.6,0.6,0,c_white,1)
			if global.current_weapon_atk_S < global.weaponattemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(245,100 - menu_shop_pos,"+" + string((global.weaponattemp)),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(245,100 - menu_shop_pos,"-" + string((global.weaponattemp - global.current_weapon_atk_S )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			if global.current_weapon_mag_S < global.weaponmagtemp
			{
				draw_set_color(c_yellow)
				draw_text_ext_transformed(245,110 - menu_shop_pos,"+" + string(global.weaponmagtemp),300,300,0.45,0.45,0)
			    draw_set_color(c_white)
			}
			else
			{
				
				draw_set_color(c_aqua)
				draw_text_ext_transformed(245,110 - menu_shop_pos,"-" + string((global.weaponmagtemp - global.current_weapon_mag_S )),300,300,0.45,0.45,0)
				draw_set_color(c_white)
			}
			}
			else
			{
			draw_sprite_ext(spr_ralseib_face_shop,0,218, 110 - menu_shop_pos,0.6,0.6,0,c_white,1)
			}
		  }
		}
		
    }
	    
		if !confirm_buy
		{
		draw_set_color(c_navy)
		draw_text_ext(t_x+ 223, t_y + 139, displayed_current,15,55);
        draw_set_color(c_white)
        draw_text_ext(t_x+ 220, t_y + 136, displayed_current,15,55);
		}
		else
		{   
			draw_text(t_x+218,t_y+140,"Buy it for  ")
			if shop_prices[selected_button] < 10 
			{
			draw_text(t_x + 245, t_y + 160,"$" + string(shop_prices[selected_button]))
			}
			else
			{
			draw_text(t_x + 240, t_y + 160,"$" + string(shop_prices[selected_button]))	
			}
			draw_text(t_x+238,t_y+185,"Yes")
            draw_text(t_x+238,t_y+185+18,"No")
		}
		
	draw_set_font(Arial)
	if shop_desc_type[selected_button] == "Item"
	{
	if empty_longness - 12 <= 0 or empty_longness != 0
	{
	  draw_text_transformed(263, 222, "space: " + string(empty_longness),0.8,0.8,0);
	}
    else
	if empty_longness_save - 46 > 0
	{
	draw_text_transformed(263, 222, "space: " + string(empty_longness_save),0.8,0.8,0);
	}
	else
	{
		draw_text_transformed(263, 222, "NO SPACE",0.8,0.8,0);
	}
	}
	if shop_desc_type[selected_button] == "Weapon"
	{
	  	 draw_text_transformed(263, 222, "space: " + string(empty_longness_weapon),0.8,0.8,0);
	}
	if shop_desc_type[selected_button] == "Armor"
	{
	  	 draw_text_transformed(263, 222, "space: " + string(empty_longness_armor),0.8,0.8,0);
	}
	draw_set_font(fnt_dt_mono)
}

if sell_mode == false 
{
if (image_index < 1) 
{
    // Draw menu options if menu is active
    draw_text(t_x + 250, _y-10, "Buy");
    draw_text(t_x + 250, _y + 10, "Sell");
    draw_text(t_x + 250, _y + 30, "Talk");
    draw_text(t_x + 250, _y + 50, "Exit");
	
	draw_set_color(c_navy)
	draw_text_ext(t_x + 18,_y+2,"* "+string(displayed_current),25,300)
	draw_set_color(c_white)
	draw_text_ext(t_x + 15,_y,"* "+string(displayed_current),25,300)
}
}


if (sell_mode) {
    if (!selected_an_option_sell) {
        draw_text(t_x + 45, t_y + 135, "Sell Items");
        draw_text(t_x + 45, t_y + 155, "Sell Weapons");
        draw_text(t_x + 45, t_y + 175, "Sell Armors");
        draw_text(t_x + 45, t_y + 195, "Sell Pocket Items");
        draw_text(t_x + 45, t_y + 215, "Return");

        draw_set_color(c_navy);
        draw_text_ext(t_x + 223, t_y + 146, displayed_current, 15, 55);
        draw_set_color(c_white);
        draw_text_ext(t_x + 220, t_y + 143, displayed_current, 15, 55);
    }

    if (selected_an_option_sell) {
        if (!confirm_buy) {
            draw_set_color(c_navy);
            draw_text_ext(t_x + 223, t_y + 146, displayed_current, 15, 55);
            draw_set_color(c_white);
            draw_text_ext(t_x + 220, t_y + 143, displayed_current, 15, 55);
        } else {
            draw_text(t_x + 218, t_y + 140, "Sell it for");
			draw_text(t_x + 240, t_y + 160, "$" + string(value));	
            draw_text(t_x + 238, t_y + 185, "Yes");
            draw_text(t_x + 238, t_y + 203, "No");
        }

        if (!surface_exists(viewport_surface)) {
            viewport_surface = surface_create(view_width, view_height);
        }

        surface_set_target(viewport_surface);
        draw_clear_alpha(c_black, 0);

        // Calculate which items to draw based on the scroll position
        var start_index = floor(scroll_y / item_height);
        var end_index = min(start_index + ceil(view_height / item_height), array_lenght);

        // Draw each item in the visible range on the surface
        for (var i = start_index; i < end_index; i++) 
		{
            var item_y = (i - start_index) * item_height - (scroll_y % item_height);
            var item_text = array_sell[i];

            // Debug message
            show_debug_message("Item: " + item_text + ", Index: " + string(i));

            // Retrieve and store the item value
            var item_value = 0; // Default value if not set by any script

            if (selected_option_sell == 0) {
                scr_iteminfo(item_text);
                item_value = global.value; // Store the value returned by scr_iteminfo
            } else if (selected_option_sell == 1) {
                scr_weaponinfo(item_text);
                item_value = global.value; // Store the value returned by gml_Script_scr_weaponinfo
            } else if (selected_option_sell == 2) {
                scr_armorinfo(item_text);
                item_value = global.value; // Store the value returned by gml_GlobalScript_scr_armorinfo
            } else if (selected_option_sell == 3) {
                scr_iteminfo(item_text);
                item_value = global.value; // Store the value returned by scr_iteminfo
            }

            // Debug message for value
            show_debug_message("Item: " + item_text + ", Value: " + string(item_value));

            // Change text color if the item can't be equipped
            if (item_text == " ") {
                draw_set_color(c_gray);
            } else {
                draw_set_color(c_white);
            }

            // Draw item text
            if (item_text == " ") {
                item_text = "------------";
            }

            // Check if the current item is the selected item
            if (i == selected_sell) 
			{
                value = global.value; // Set the value of the selected item
            }
			
		    draw_text(20, item_y, item_text);
            draw_text(130, item_y, "$" + string(global.value)); // Display the price of each item
			
			if (confirm_buy) 
			{
			   draw_text(t_x + 240, t_y + 160, "$" + string(value));	
			}
			
        }
        if (confirm_buy) 
			{
			   draw_text(t_x + 240, t_y + 160, "$" + string(value));	
			}
			
        // Reset the drawing target to the screen
        surface_reset_target();

        // Draw the surface to the screen at the specified position
        draw_surface(viewport_surface, view_x, view_y);
    }
}




if talk = true
{
	draw_set_font(fnt_dt_mono)
	draw_set_color(c_navy)
draw_text_ext(33, 140, displayed_text,15,200);
draw_set_color(c_white)
draw_text_ext(30, 138, displayed_text,15,200);
}

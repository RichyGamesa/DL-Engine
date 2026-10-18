// obj_battle draw event

// Draw self (obj_battle sprite)
draw_self();

// Set the font for the TP text
draw_set_font(fnt_dt_mono_BIG);
draw_set_color(c_white)
if (global.tp >= 100) {
    draw_set_color(c_orange);
    draw_text(x, y + 115, "MAX");
    draw_set_color(c_white);
} else if (global.tp <= 9) {
    draw_text(x + 7, y + 115, string(global.tp));
} else {
    draw_text(x + 3, y + 115, string(global.tp));
}

// Draw the empty bar TP
draw_sprite(spr_battle_tp_empty, 0, x + 34, y + 228);

// Calculate the height of the yellow bar based on global.tp
var tp_height = 100 - global.tp;

// Calculate the y position to start drawing the yellow part
var yellow_bar_y = y + 228 + 19 - tp_height; // Adjusted for the height of the empty bar sprite

// Draw the yellow part of the TP bar
draw_sprite_part(spr_battle_tp_yellow, 0, 0,tp_height, 19, 187, x + 34, y + 228);

// Calculate percentage of TP
var tpPercent = global.tp / 100;

// Draw TP Bar
draw_set_color(c_gray);
draw_rectangle(x + 10, y + 10, x + 210, y + 30, false);  // Background bar
draw_set_color(c_blue);
draw_rectangle(x + 10, y + 10, x + 10 + (200 * tpPercent), y + 30, false);  // Actual TP bar

//Draw bars
draw_set_font(Deltarune)
draw_set_color(c_white)
draw_sprite(bar_1,0,bar_1_x,y+293)
draw_sprite(bar_1_face,0,bar_1_x + 13, y+300)
draw_text(bar_1_x + 133,y + 300,string(bar_1_hp) + "     " + string(bar_1_max_hp))


    // Draw health bar for the protagonist (Kris)
    var hp_percentage_1 = bar_1_hp / bar_1_max_hp;
    var bar_width_1 = hp_percentage_1 * 100; // Assuming the HP bar is 100 pixels wide

 draw_set_color(bar_1_color); // Set the color of the filled part of the HP bar
 draw_rectangle(bar_1_x + 127, y + 313,bar_1_x + 105 + bar_width_1, y + 322, false); // Draw the filled part of the HP bar
 if turn == 0
 {
	 switch (selected_button) 
	 {
     case 0:
         draw_sprite(spr_button_fight,0,bar_1_x+15,y+331.5)
         break;
     case 1:
	     if member_0_name == "Kris"
         draw_sprite(spr_button_act,0,bar_1_x+50,y+331.5)
		 else
		 draw_sprite(spr_button_magic,0,bar_1_x+50,y+331.5)
         break;
	case 2:
         draw_sprite(spr_button_item,0,bar_1_x+85,y+331.5)
		 break;
case 3:
         draw_sprite(spr_button_spare,0,bar_1_x+120,y+331.5)
		 break;
case 4:
         draw_sprite(spr_button_defend,0,bar_1_x+155,y+331.5)
		 break;

     }
   

 }

if global.num_active_members == 2
{
	draw_set_color(c_white)
	draw_sprite(bar_2,0,bar_2_x,y+293)
	draw_sprite(bar_2_face,0,bar_2_x + 13, y+300)
    draw_text(bar_2_x + 133,y + 300,string(bar_2_hp) + "     " + string(bar_2_max_hp))
	
	  // Draw health bar for the protagonist (Kris)
    var hp_percentage_2 = bar_2_hp / bar_2_max_hp;
    var bar_width_2 = hp_percentage_2 * 100; // Assuming the HP bar is 100 pixels wide

 draw_set_color(bar_2_color); // Set the color of the filled part of the HP bar
 draw_rectangle(bar_2_x + 127, y + 313,bar_2_x + 105 + bar_width_2, y + 322, false); // Draw the filled part of the HP bar
 
 if turn == 1
 {
	 switch (selected_button) 
	 {
     case 0:
         draw_sprite(spr_button_fight,0,bar_2_x+15,y+331.5)
         break;
     case 1:
	     if member_1_name == "Kris"
         draw_sprite(spr_button_act,0,bar_2_x+50,y+331.5)
		 else
		 draw_sprite(spr_button_magic,0,bar_2_x+50,y+331.5)
         break;
	case 2:
         draw_sprite(spr_button_item,0,bar_2_x+85,y+331.5)
		 break;
case 3:
         draw_sprite(spr_button_spare,0,bar_2_x+120,y+331.5)
		 break;
case 4:
         draw_sprite(spr_button_defend,0,bar_2_x+155,y+331.5)
		 break;

     }
   

 }
 
}
draw_set_color(c_white)

if global.num_active_members == 3
{ 
draw_sprite(bar_2,0,bar_2_x,y+293)
draw_sprite(bar_3,0,bar_3_x,y+293)
}

if fighting
{
if fight_selecting
{
	draw_set_color(c_white)
	draw_text(x+90,y+375,enemy_0_name)
     draw_set_color(c_red)
	draw_rectangle(bar_1_x + 147, y + 313,bar_1_x + 105 + bar_width_1, y + 322, false); // Draw the empty part of the HP bar
	draw_set_color(c_green)
	draw_rectangle(bar_1_x + 147, y + 313,bar_1_x + 105 + bar_width_1, y + 322, false); // Draw the filled part of the HP bar
	draw_set_color(c_white)
}
else
draw_sprite(spr_bar_fight_Kris,0,x+15,y+365)	
}

if itemlist
{
	draw_set_font(fnt_dt_mono)
	
	if selecting_person_item != true
	{
		    
            // Draw the items
			if list_1 
			{
            for (var i = 0; i < 9; i++) 
			{
				
                var item_index = i % max_items_per_row; // Calculate the index of the item within the current row
                var row_index = floor(i / max_items_per_row); // Calculate the index of the current row
                var item_x = t_x + 104 + item_index * item_width; // Calculate the x position of the item
                var item_y = t_y + 265 + row_index * (item_height + item_spacing); // Calculate the y position of the item

                draw_set_color(c_white); // Set color to white for items
                draw_text_transformed(item_x - 45,item_y + 105, global.items_dark[i], 1.2, 1.2, 0);
				
				scr_iteminfo(global.items_dark[item_selected]);
				draw_text_ext(t_x + 450, t_y + 379, global.item_desc, 20, 150)
            }
			if longness > 8
			{
				draw_sprite(spr_arrow_down,0,t_x + 15, t_y + 429 )
			}
			}
			else
			if list_2
			{
				for (var i = 9; i < longness; i++) 
			{
				
                var item_index = i % max_items_per_row; // Calculate the index of the item within the current row
                var row_index = floor(i / max_items_per_row); // Calculate the index of the current row
                var item_x = t_x + 104 + item_index * item_width; // Calculate the x position of the item
                var item_y = t_y + 164 + row_index * (item_height + item_spacing); // Calculate the y position of the item

                draw_set_color(c_white); // Set color to white for items
                draw_set_font(fnt_dt_mono);
                draw_text_transformed(item_x - 45,item_y + 105, global.items_dark[i], 1.2, 1.2, 0);
				
				scr_iteminfo(global.items_dark[item_selected]);
				draw_text_ext(t_x + 450, t_y + 379, global.item_desc, 20, 150)
            }
				
				draw_sprite(spr_arrow_up,0,t_x + 15, t_y + 369 )
		    }
	} 	
	
	else 
	if selecting_person_item == true
	{
	draw_set_font(fnt_dt_mono_BIG)
	
	if global.num_active_members == 1
	{
	draw_set_color(c_white)
	draw_text(x+90,y+375,member_0_name)
     draw_set_color(c_red)
	draw_rectangle(bar_1_x + 147, y + 313,bar_1_x + 105 + bar_width_1, y + 322, false); // Draw the empty part of the HP bar
	draw_set_color(c_green)
	draw_rectangle(bar_1_x + 147, y + 313,bar_1_x + 105 + bar_width_1, y + 322, false); // Draw the filled part of the HP bar
	draw_set_color(c_white)
	}
	if global.num_active_members == 2
	{
	draw_set_color(c_white)
	draw_text_transformed(x+90,y+375,member_0_name,1.2,1.2,0)
	draw_set_color(c_red)
	draw_rectangle(bar_1_x + 405, y + 373,bar_1_x + 415 + bar_width_1, y + 390, false); // Draw the empty part of the HP bar
	draw_set_color(c_lime)
	draw_rectangle(bar_1_x + 405, y + 373,bar_1_x + 415 + bar_width_1, y + 390, false); // Draw the filled part of the HP bar
	
	draw_set_color(c_white)
	draw_text_transformed(x+90,y+405,member_1_name,1.2,1.2,0)
	draw_set_color(c_red)
	draw_rectangle(bar_1_x + 405, y + 400,bar_1_x + 415 + bar_width_2, y + 417, false); // Draw the empty part of the HP bar
	draw_set_color(c_lime)
	draw_rectangle(bar_1_x + 405, y + 400,bar_1_x + 415 + bar_width_2, y + 417, false); // Draw the filled part of the HP bar
	
	draw_set_color(c_white)
	}
	}
	
	
	
}

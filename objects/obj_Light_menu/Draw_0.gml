draw_self()

if instance_exists(obj_Light_menu) = true 
{

var t_x = camera_get_view_x(view_camera[0]) - 5;
var t_y = camera_get_view_y(view_camera[0]);
var _y = 0; // Starting y position for the first item
    
	
	draw_set_color(border_color)
	draw_rectangle(x + 7,y + 75, x + 78, y + 130, false)

	draw_set_color(c_black)
	draw_rectangle(x + 10,y + 78, x + 75, y + 127, false)
	
	
	
	draw_set_color(border_color)
	draw_rectangle(x + 7,y + 135, x + 78, y + 209, false)

	draw_set_color(c_black)
	draw_rectangle(x + 10,y + 138, x + 75, y + 206, false)
	
	
	
	draw_set_color(color)
	draw_set_font(fnt_dt_mono)
	draw_text_transformed(x + 12,t_y+28,global.light_vessel_name,1,1,0)
	
	
	
	draw_set_font(font_overworld_mars);
	draw_text_transformed(x+12,t_y+48,    "LV " + string(global.L_lv),1.1,1.1,0)
    draw_text_transformed(x+12,t_y+58,    "HP " + string(global.Light_hp) + " " + "/" + " " + string(global.Light_maxhp),1.1,1.1,0)
    draw_text_transformed(x+12,t_y+68,    "$  " + string(global.L_money),1.1,1.1,0)
	draw_set_font(fnt_dt_mono)
    
	
	if array_length(global.light_items) <= 0
	{
	draw_set_color(c_grey)
	draw_text(x + 26,t_y + 93,"ITEMS")
	draw_set_color(color)
	}
	else
	{
	draw_text(x + 26,t_y + 93,"ITEMS")
	}
	
	
	draw_set_color(color)
	draw_text(x + 26, t_y + 113, "STATS")
	
	
	
	if array_length(global.numbers) <= 0
	{
	draw_set_color(c_grey)
	draw_text(x + 26, t_y + 133, "CELL")
	draw_set_color(color)
	}
	else
	{
	draw_set_color(color)
	draw_text(x + 26, t_y + 133, "CELL")
	}
	

    
if (image_index == 1) //Items
	{
	
		draw_set_color(border_color)
	draw_rectangle(x + 85,y + 75, x + 263, y + 256, false)

	draw_set_color(c_black)
	draw_rectangle(x + 88,y + 78, x + 260, y + 253, false)
		
    // Draw the items
    for (var i = 0; i < array_length(global.light_items); i++)
	{
        draw_set_color(color); // Set color to 
        draw_set_font(fnt_dt_mono)
        draw_text(x+112,t_y+40+_y, global.light_items[i]);
        _y += 17; // Move down for the next item
        

    }
	
	
	draw_text(x + 112, y + 232, "USE")
	draw_text(x + 158, y + 232, "INFO")
	draw_text(x + 210, y + 232, "DROP")
	
	}

if (image_index == 2) //INFO
{ 
	draw_set_color(border_color)
	draw_rectangle(x + 85,y + 75, x + 258, y + 75 + 209, false)

	draw_set_color(c_black)
	draw_rectangle(x + 88,y + 78, x + 255, y + 78 + 203, false)
	
		//173
	//181  209
	
	draw_set_color(color)
	
	draw_set_font(fnt_dt_mono)
	
	draw_text_transformed(x+105,t_y+42,"'" + "'" + string(global.light_vessel_name) + " '" + "'",1,1,0) //Draw name
	
	draw_set_font(fnt_dt_mono)
	
	draw_text(x+98,t_y+71,"LV " + string(global.L_lv)) //Draw the LV (lightWorld L.O.V.E)
	
	draw_text(x+98,t_y+86.5,"HP " + string(global.Light_hp) + "/" + string(global.Light_maxhp)); //Draw the HP

    //draw Atk and Def
    draw_text(x+98,t_y+119,"ATK " + string(round(global.L_at))  + " (" + string(global.L_wp_atk)  + ")");
	draw_text(x+98,t_y+135,"DEF " + string(round(global.L_df)) + " (" + string(global.L_armor_def) + ")");
	
	//Draw exp and next exp for LOVE up
	draw_text(x+185,t_y+119,"EXP  " + string(global.L_xp));
	draw_text(x+185,t_y+135,"NEXT " + string(global.next_Lv));
   
    //Draw Equipment
	draw_text(x+98,t_y+165,"WEAPON:" + string(global.L_weapon))
	draw_text(x+98,t_y+181,"ARMOR:" + string(global.L_armor))
	

	draw_text(x+98,t_y+201.5,"$:" + string(global.L_money)) //Draw the Dollars
	if global.PlayerKills > 0 
	{
	draw_set_color(c_yellow)
	draw_text(x+165 + string_length(global.L_money),t_y+201.5,"KILLS:" + string(global.PlayerKills))	
	draw_set_color(color)
	}
	else
	{
	if global.PlayerSpares > 0
	{
	draw_set_color(color)	
	draw_text(x+165 + string_length(global.L_money),t_y+201.5,"SPARES:" + string(global.PlayerSpares))
	draw_set_color(color)
	}
	}
}
		
if (image_index == 3) //Cellphone 
{
	
	//173
	//135
	draw_set_color(border_color)
	draw_rectangle(x + 85,y + 75, x + 258, y + 220, false)

	draw_set_color(c_black)
	draw_rectangle(x + 88,y + 78, x + 255, y + 217, false)
	
	
    // Draw the numbers
    var __y = 0; // Starting y position for the first number
    for (var i = 0; i < array_length(global.numbers); i++) 
	{

        draw_set_color(color); // Set color to white for numbers
        draw_set_font(fnt_dt_mono);
        draw_text(x + 124,t_y +40  + __y, global.numbers[i]);
        __y += 17; // Move down for the next number
    }
}


}

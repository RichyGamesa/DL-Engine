// Draw event

// Position the textbox at the bottom center of the screen
 textbox_x = obj_Overworld_Camera.x + 13;
 textbox_y = obj_Overworld_Camera.y + 165;



if instance_exists(mainchara)
{
if (mainchara.y >= textbox_y - 48 and !textbox_only_down) or textbox_only_up
{
textbox_y = obj_Overworld_Camera.y + 10;	
}
}


draw_set_font(font);

if (!setup) 
{
    setup = true;
    obj_Overworld_Frisk.Frozen = true; 
}

// Draw the textbox
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);
draw_set_color(border_color);
draw_rectangle(obj_Overworld_Camera.x + 10, textbox_y - 3, obj_Overworld_Camera.x + 310, textbox_y + 65, false);
draw_set_color(c_black);
draw_rectangle(textbox_x, textbox_y, obj_Overworld_Camera.x + 307, textbox_y + 62, false);

draw_set_color(color)
//draw the choices
var _x_choice1 = textbox_x + 8;
var _y_choice1 = textbox_y + 20;
var _x_choice2 = textbox_x + 232;
var _y_choice2 = textbox_y + 20;
var _x_choice_3 = textbox_x + 125 - string_length(choice_3);
var _x_choice_4 = textbox_x + 125 - string_length(choice_4);
var _y_choice_3 = textbox_y + 1;
var _y_choice_4 = textbox_y + 45;

if choice_number != 1
{
if string_width(choice_1) > 180
{
_y_choice1 = textbox_y + 5;	
}

if string_width(choice_2) > 180
{
_y_choice2 = textbox_y + 5;	
}

if string_width(choice_4) > 200
{
_y_choice_4 = textbox_y + 33
}

if selected_choice != 1 
{
draw_text_ext(_x_choice1,_y_choice1,choice_1,10,75)
}
else
draw_text_ext_color(_x_choice1,_y_choice1,choice_1,10,75,c_yellow,c_yellow,c_yellow,c_yellow,1)

if choice_number > 1
if selected_choice != 2 
draw_text_ext(_x_choice2,_y_choice2,choice_2,10,70)
else
draw_text_ext_color(_x_choice2,_y_choice2,choice_2,10,70,c_yellow,c_yellow,c_yellow,c_yellow,1)

if choice_number > 2
if selected_choice != 3 
draw_text_ext(_x_choice_3,_y_choice_3,choice_3,10,200)
else
draw_text_ext_color(_x_choice_3,_y_choice_3,choice_3,10,200,c_yellow,c_yellow,c_yellow,c_yellow,1)

if choice_number > 3
if selected_choice != 4
draw_text_ext(_x_choice_4,_y_choice_4,choice_4,10,200)
else
draw_text_ext_color(_x_choice_4,_y_choice_4,choice_4,10,200,c_yellow,c_yellow,c_yellow,c_yellow,1)
}
else
{
_x_choice1 = textbox_x + 150;
_y_choice1 = textbox_y + 20;
if selected_choice != 1 
{
draw_text_ext(_x_choice1,_y_choice1,choice_1,12,170)	
}
else
{
draw_text_ext_color(_x_choice1,_y_choice1,choice_1,12,100,c_yellow,c_yellow,c_yellow,c_yellow,1)		
}
}

//show_debug_message("lengt_1 = " + string(string_length(choice_1)))
//show_debug_message("lengt_2 = " + string(string_length(choice_2)))
//show_debug_message("lengt_3 = " + string(string_length(choice_3)))
//show_debug_message("lengt_4 = " + string(string_length(choice_4)))

//show_debug_message("width_1 = " + string(string_width(choice_1)))
//show_debug_message("width_2 = " + string(string_width(choice_2)))
//show_debug_message("width_3 = " + string(string_width(choice_3)))
//show_debug_message("width_4 = " + string(string_width(choice_4)))
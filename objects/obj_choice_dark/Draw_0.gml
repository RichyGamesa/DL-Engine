// Draw event

 textbox_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - textbox_width) / 2;
 textbox_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - textbox_height - border;


if instance_exists(mainchara)
{
if mainchara.y >= textbox_y - 48
{
textbox_y = camera_get_view_y(view_camera[0]) + 50;	
}
}


draw_set_font(font);

if (!setup) 
{
    setup = true;
    obj_mainchara.can_move = false; 
}

// Draw the textbox
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);
draw_sprite_ext(txtb_sprite, textbox_image_index, textbox_x, textbox_y, textbox_width / txtb_sprite_w, textbox_height / txtb_sprite_h, 0, c_white, 1);

//draw the choices
var _x_choice1 = textbox_x + 35;
var _y_choice1 = textbox_y + 58;
var _x_choice2 = textbox_x + 400;
var _y_choice2 = textbox_y + 60;
if choice_number != 1
{
if string_width(choice_1) > 60
{
_y_choice1 = textbox_y - 25;	
}
if string_width(choice_2) > 60
{
_y_choice2 = textbox_y - 25;	
}
if selected_choice != 1 
{
draw_text_ext_transformed(_x_choice1,_y_choice1,choice_1,10,60,1.3,1.3,0)
}
else
draw_text_ext_transformed_color(_x_choice1,_y_choice1,choice_1,10,60,1.3,1.3,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
if choice_number > 1
if selected_choice != 2 
draw_text_ext_transformed(_x_choice2,_y_choice2,choice_2,10,60,1.3,1.3,0)
else
draw_text_ext_transformed_color(_x_choice2,_y_choice2,choice_2,10,60,1.3,1.3,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
if choice_number > 2
if selected_choice != 3 
draw_text_transformed(textbox_x + 210 ,textbox_y + 18,choice_3,1.3,1.3,0)
else
draw_text_ext_transformed_color(textbox_x + 210 ,textbox_y + 18,choice_3,10,300,1.3,1.3,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
if choice_number > 3
if selected_choice != 4
draw_text_transformed(textbox_x + 210 ,textbox_y + 100,choice_4,1.3,1.3,0)
else
draw_text_ext_transformed_color(textbox_x + 210 ,textbox_y + 100,choice_4,10,300,1.3,1.3,0,c_yellow,c_yellow,c_yellow,c_yellow,1)
}
else
{
_x_choice1 = textbox_x + 240;
_y_choice1 = textbox_y + 66;

if selected_choice != 1 
{
draw_text_ext_transformed(_x_choice1,_y_choice1,choice_1,12,180,1.3,1.3,0)	
}
else
{
draw_text_ext_transformed_color(_x_choice1,_y_choice1,choice_1,12,180,1.3,1.3,0,c_yellow,c_yellow,c_yellow,c_yellow,1)		
}
}
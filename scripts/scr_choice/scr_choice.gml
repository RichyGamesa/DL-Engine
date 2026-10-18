function scr_choice(choice_number, choice1, choice2, choice3, choice4) 
{
    var t_x = camera_get_view_x(view_camera[0]);
    var t_y = camera_get_view_y(view_camera[0]);
    global.cutscene = true;
	with (obj_choice_light)
	{
    var textbox_width = 485;
    var textbox_height = 145;
    var border = 10;
    var line_sep = 30;
    var line_width = 237;

    var textbox_x = t_x + (camera_get_view_width(view_camera[0]) - textbox_width) / 2;
    var textbox_y = t_y + camera_get_view_height(view_camera[0]) - textbox_height - border;

    var txtb_sprite = sTextbox_dark;
    if global.darkworld == false
    {
        textbox_width = 260;
        textbox_height = 87;
        txtb_sprite = sTextbox_light;
        // Position the textbox at the bottom center of the screen
        textbox_x = t_x + 160;
        textbox_y = t_y + 200;
    }

    var txtb_image = 0;
    var txtb_image_spd = 0;
    var txtb_sprite_w = sprite_get_width(txtb_sprite);
    var txtb_sprite_h = sprite_get_height(txtb_sprite);
        
    // Draw the textbox
    draw_sprite_ext(txtb_sprite, txtb_image, textbox_x, textbox_y, textbox_width / txtb_sprite_w, textbox_height / txtb_sprite_h, 0, c_white, 1);
        
    // Draw choice text aligned to the left and right
    draw_set_color(c_white);
    if (choice_number >= 1) draw_text(textbox_x + 20, textbox_y + 20, choice1);
    if (choice_number >= 2) draw_text(textbox_x + 20, textbox_y + 50, choice2);
    if (choice_number >= 3) draw_text(textbox_x + 20, textbox_y + 80, choice3);
    if (choice_number >= 4) draw_text(textbox_x + 20, textbox_y + 110, choice4);

    // Create the soul object if it doesn't exist
    if !instance_exists(obj_soul) 
    {
        instance_create_depth(t_x + 340, t_y + 360, -300, obj_soul);
    }
	
	if keyboard_check(global.left)
	{
	 	obj_soul.x = textbox_x - 50
	}
}
}


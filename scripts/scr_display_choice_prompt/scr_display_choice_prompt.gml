/*
// Script scr_display_choice_prompt
function scr_display_choice_prompt(argument0, argument1, argument2) {
    var question_text = argument0;
    var choice_1_text = argument1;
    var choice_2_text = argument2;
    global.selected_choice = 0;
    
    // Check if cutscene is true before displaying choice prompt
    if (global.cutscene == true) {
        var textbox_width = 300;
        var textbox_height = 107;
        var border = 20;
        var line_sep = 15;
        var textbox_x = camera_get_view_x(view_camera[0]) + 160;
        var textbox_y = camera_get_view_y(view_camera[0]) + 190;
        var txtb_sprite = sTextbox_light
		if global.darkworld = true {
	        txtb_sprite = sTextbox_dark;
		}
        var txtb_image = 0;
        var txtb_image_spd = 0;
        var txtb_sprite_w = sprite_get_width(txtb_sprite);
        var txtb_sprite_h = sprite_get_height(txtb_sprite);
        
        // Draw the textbox
        draw_sprite_ext(txtb_sprite, txtb_image, textbox_x, textbox_y, textbox_width / txtb_sprite_w, textbox_height / txtb_sprite_h, 0, c_white, 1);
        
        // Draw the question text
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_text(textbox_x, textbox_y - 20, question_text);
        
        // Draw choice text aligned to the left and right
        draw_set_halign(fa_left); // Align left for choice 1
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_text(textbox_x - 100, textbox_y - 2, choice_1_text);

        draw_set_halign(fa_right); // Align right for choice 2
        draw_set_valign(fa_middle);
        draw_text(textbox_x + 100, textbox_y - 2, choice_2_text);

        // Draw heart cursor
        var heart_x = textbox_x - 10 - sprite_get_width(spr_soul) / 2; // Default position for heart cursor
        var heart_y = textbox_y - 6; // Align heart vertically with the textbox

        // Update heart cursor position based on the selected choice
        if (global.choice == 1) {
            heart_x = textbox_x - 58 - sprite_get_width(spr_soul) / 2; // Align heart with the left choice text
        } else {
            heart_x = textbox_x + 58 - sprite_get_width(spr_soul) / 2; // Align heart with the right choice text
        }

        draw_sprite(spr_soul, 0, heart_x, heart_y);

        
     // Initialize variables
var choice_selected = false;

// Wait for player input
if (!choice_selected) {
    if (keyboard_check_pressed(global.left)) {
        global.choice = 1;
        audio_play_sound(snd_menumove, 10, false);
    } else if (keyboard_check_pressed(global.right)) {
        global.choice = 2;
        audio_play_sound(snd_menumove, 10, false);
    } else if (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter)) {
        global.selected_choice = global.choice;
        obj_mainchara.can_move = true;
		choice_selected = true; // Set the flag to prevent further selections
        audio_play_sound(snd_select, 10, false);
        global.cutscene = false; // Set cutscene to false to hide the choice prompt
        instance_destroy(oWall_cutscene);
      
    }
}


}
}
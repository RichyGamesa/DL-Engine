// Draw event
var confirm_key = keyboard_check_pressed(global.confirm) or keyboard_check_released(vk_enter) or keyboard_check(global.menu) or keyboard_check(vk_control);
var skip_key = keyboard_check_pressed(global.cancel) or keyboard_check_pressed(vk_shift) or keyboard_check(global.menu) or keyboard_check(vk_control);

// Position the textbox at the bottom center of the screen
var textbox_x = camera_get_view_x(view_camera[0]);
var textbox_y = camera_get_view_y(view_camera[0]);

draw_set_font(font);

if (!setup) {
    setup = true;
    obj_mainchara.can_move = false;
    page_number = array_length(text);
    for (var _p = 0; _p < page_number; _p++) {
        text_length[_p] = string_length(text[_p]);
        
            text_x_offset[_p] = 20;
            line_width = 230;

        // Parse colored text
        text_segments[_p] = parse_colored_text(text[_p]);
    }
}

if (draw_char < text_length[page])
{
    draw_char += text_speed;
    draw_char = clamp(draw_char, 0, text_length[page]);
	if instance_exists(obj_shop_normal)
{
obj_shop_normal.shop_keeper_image_index += 0.25
}
}
else
{
	
}
if (skippable) 
{
    if (confirm_key) 
	{
        if (draw_char == text_length[page]) {
            if (page < page_number - 1) {
                page++;
                draw_char = 0;
            } else {
                obj_mainchara.can_move = true;
                instance_destroy();
            }
        }
    } else if (skip_key && draw_char != text_length[page]) {
        draw_char = text_length[page];
    }
}

// Textbox variables
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);

// Change the shop keeper
    if speaker_sprite[page] != noone 
	{
	if (draw_char < text_length[page])
    obj_shop_normal.shop_keeper_current_sprite = speaker_sprite[page];
	else
	{
	 obj_shop_normal.shop_keeper_current_sprite = obj_shop_normal.shop_keeper_idle;	
	 obj_shop_normal.shop_keeper_image_index += 0.15
	}
	}
    
    


// Draw the text

var draw_x = textbox_x + 33;
var draw_y = textbox_y + 140;
var drawn_chars = 0;
var width = 250;


for (var i = 0; i < array_length(text_segments[page]); i++)
{
    var segment = text_segments[page][i];
    var segment_text = string_copy(segment.text, 1, draw_char - drawn_chars);


    draw_set_color(segment.color);
    draw_text_ext(draw_x, draw_y, segment_text, line_sep, width);

    var segment_length = string_length(segment_text);
    drawn_chars += segment_length;

    // Update draw_x and draw_y for wrapping
    var text_width = string_width(segment_text);
    if (draw_x + text_width >= textbox_x + width) 
	{

        draw_x = textbox_x + 33; // Reset to start of the next line
    
		draw_y += line_sep		 

    } 
	else 
	{
        draw_x += text_width;
    }

    if (drawn_chars >= draw_char) 
	{
        break;
    }
}
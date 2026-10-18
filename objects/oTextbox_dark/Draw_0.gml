// Draw event
var confirm_key = keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter) 
var skip_key = keyboard_check_pressed(global.cancel) or keyboard_check_pressed(vk_shift) 
var skip_everything_key =  keyboard_check(global.menu) or keyboard_check(vk_control);

// Position the textbox at the bottom center of the screen
var textbox_x = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]) - textbox_width) / 2;
var textbox_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - textbox_height - border;


if instance_exists(mainchara)
{
if mainchara.y >= textbox_y - 48
{
textbox_y = camera_get_view_y(view_camera[0]) + 50;	
}
}


draw_set_font(font);
var speaker_sprite_index = 0;
if speaker_sprite_index > 1
{
speaker_sprite_index = 0;	
}

if (!setup)
{
    setup = true;
    obj_mainchara.can_move = false;
    page_number = array_length(text);
    for (var _p = 0; _p < page_number; _p++) {
        text_length[_p] = string_length(text[_p]);
        
        // Portrait
        text_x_offset[_p] = 10;
        portrait_x_offset[_p] = 10;
        line_width = 190;

        // No portrait
        if (speaker_sprite[0] == noone)
		{
            text_x_offset[_p] = 20;
            line_width = 230;
        }

        // Parse colored text
        text_segments[_p] = parse_colored_text(text[_p]);
    }
}

if (draw_char < text_length[page]) 
{
	if !skip_everything_key
	{
    draw_char += text_speed;
    draw_char = clamp(draw_char, 0, text_length[page]);
	speaker_sprite_index += 1
	}
	else
	{
	draw_char += text_speed_skip;
    draw_char = clamp(draw_char, 0, text_length[page]);
	speaker_sprite_index += 1
	}
}

if (skippable) 
{
	if skip_everything_key
	{
	draw_char = text_length[page];
	}
    if (confirm_key) or skip_everything_key
	{

        if (draw_char == text_length[page]) 
		{
            if (page < page_number - 1) 
			{
                page++;
                draw_char = 0;
            } 
			else 
			{
                obj_mainchara.can_move = true;
                instance_destroy();
            }
        }
    }	
	if (skip_key && draw_char != text_length[page]) 
	{
        draw_char = text_length[page];
    }
}

// Draw the textbox
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);
draw_sprite_ext(txtb_sprite, textbox_image_index, textbox_x, textbox_y, textbox_width / txtb_sprite_w, textbox_height / txtb_sprite_h, 0, c_white, 1);

// Draw portrait if any
if speaker_sprite[0] != noone
if (speaker_sprite[page] != noone)
{
    sprite_index = speaker_sprite[page];
    if (draw_char == text_length[page]) 
	{
        speaker_sprite_index = 0;
    }
    var speaker_x = 53;
    draw_sprite_ext(sprite_index, speaker_sprite_index, textbox_x + 60, textbox_y + 75, 55 / sprite_width, 55 / sprite_height, 0, c_white, 1);
}

// Draw the text
var draw_x, draw_y;
var drawn_chars = 0;
var width = 0;

if (speaker_sprite[page] == noone) 
{
    draw_x = (textbox_x + text_x_offset[page] * 2 - border) + 5;
    draw_y = (textbox_y - border) + 43;
    width = 338;

} else {
    draw_x = textbox_x + 105;
    draw_y = textbox_y + border + 12;
    width = 300;
}

for (var i = 0; i < array_length(text_segments[page]); i++) {
    var segment = text_segments[page][i];
    var segment_text = string_copy(segment.text, 1, draw_char - drawn_chars);

    draw_set_color(c_navy);
    draw_text_ext(draw_x + 1.5, draw_y + 1.5, segment_text, line_sep, width);
    draw_set_color(segment.color);
    draw_text_ext(draw_x, draw_y, segment_text, line_sep, width);

    var segment_length = string_length(segment_text);
    drawn_chars += segment_length;

    // Update draw_x and draw_y for wrapping
    var text_width = string_width(segment_text);
    if (draw_x + text_width >= textbox_x + width) 
	{
		if speaker_sprite[0] == noone
		{
        draw_x = (textbox_x + text_x_offset[page] * 2 - border) + 5; // Reset to start of the next line
       
		draw_y += line_sep
		 
		}
		else
		{
			   draw_x = textbox_x + 105;
            
			   draw_y += line_sep
		}
    } else {
        draw_x += text_width;
    }

    if (drawn_chars >= draw_char) {
        break;
    }
}
// Draw event
var confirm_key = keyboard_check_pressed(global.confirm) or keyboard_check_pressed(vk_enter) 
var skip_key = keyboard_check_pressed(global.cancel) or keyboard_check_pressed(vk_shift) 
var skip_everything_key =  keyboard_check(global.menu) or keyboard_check(vk_control);

// Position the textbox at the bottom center of the screen
var textbox_x = obj_Overworld_Camera.x + 13;
var textbox_y = obj_Overworld_Camera.y + 165;



if instance_exists(mainchara)
{
if (mainchara.y >= textbox_y - 48 and !textbox_only_down) or textbox_only_up
{
textbox_y = obj_Overworld_Camera.y + 10;	
}
}


draw_set_font(font);
var speaker_sprite_index = 0;
var textbox_sprite_index = 0
if textbox_sprite_index > 1
{
textbox_sprite_index = 0;	
}
if speaker_sprite_index > 1
{
speaker_sprite_index = 0;	
}

if (!setup) 
{
    setup = true;
    mainchara.can_move = false;
    page_number = array_length(text);
    for (var _p = 0; _p < page_number; _p++) 
	{
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
                mainchara.can_move = false;
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
draw_set_color(border_color);
if border_theme == "normal" or border_theme == "Normal"
{
draw_rectangle(obj_Overworld_Camera.x + 10, textbox_y - 3, obj_Overworld_Camera.x + 310, textbox_y + 65, false);
draw_set_color(c_black);
draw_rectangle(textbox_x, textbox_y, obj_Overworld_Camera.x + 307, textbox_y + 62, false);
}
else
{
draw_set_color(c_black);
draw_rectangle(textbox_x, textbox_y, obj_Overworld_Camera.x + 307, textbox_y + 62, false);


}
// Draw portrait if any

if (speaker_sprite[page] != noone) 
{
    sprite_index = speaker_sprite[page];
    if (draw_char == text_length[page]) 
	{
        speaker_sprite_index = 0;
    }
    var speaker_x = 53;
    draw_sprite_ext(sprite_index, speaker_sprite_index, textbox_x + 25, textbox_y + 25,  1, 1, 0, portrait_color, 1);
}

// Draw the text
var draw_x, draw_y;
var drawn_chars = 0;
var width = 0;

if (speaker_sprite[page] == noone) 
{

    draw_x = textbox_x + border + 2;
    draw_y = textbox_y + 5;
    width = 295;
	
} 
else 
{
    draw_x = textbox_x + 50;
    draw_y = textbox_y + 5;
    width = 245;
}

for (var i = 0; i < array_length(text_segments[page]); i++) 
{
    var segment = text_segments[page][i];
    var segment_text = string_copy(segment.text, 1, draw_char - drawn_chars);
        
	if string_copy(segment_text, drawn_chars, 1) == "&" or string_copy(segment_text, drawn_chars, i) == "&" or string_char_at(segment_text,i) == "&"
	{
		if speaker_sprite[page] == noone
		{
           draw_x = textbox_x - 100; // Reset to start of the next line
       
		draw_y += line_sep
		 
		}
		else
		{
			  draw_x = textbox_x - 60;
            
			   draw_y += line_sep
		}
		i++
    }
				
    var segment_length = string_length(segment_text);
    drawn_chars += segment_length;
      
	draw_set_color(segment.color);
    draw_text_ext_transformed(draw_x, draw_y, segment_text, line_sep, width,1,1,0);
	  
    // Update draw_x and draw_y for wrapping
    var text_width = string_width(segment_text);
	
    if (draw_x + text_width >= textbox_x + width) 
	{
		if speaker_sprite[page] == noone
		{
           draw_x = textbox_x - 100; // Reset to start of the next line
       
		draw_y += line_sep
		 
		}
		else
		{
			  draw_x = textbox_x - 60;
            
			   draw_y += line_sep
		}
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


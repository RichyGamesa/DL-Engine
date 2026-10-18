var confirm_key = keyboard_check_pressed(global.confirm) or keyboard_check_released(vk_enter) or keyboard_check(global.menu) or keyboard_check(vk_control) ;
var skip_key =  keyboard_check_pressed(global.cancel) or keyboard_check_pressed(vk_shift) or keyboard_check(global.menu) or keyboard_check(vk_control) ;
 
var textbox_x = camera_get_view_x(view_camera[0]) + 160;
var textbox_y = camera_get_view_y(view_camera[0]) + 190;

if(setup == false) {
	setup = true;
	
	obj_mainchara.can_move = false;
	
	draw_set_font(fnt_dt_mono);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);	

//loop throught pages
 page_number = array_length(text);
for (var _p = 0; _p < page_number; _p++){
 
           //find how many caracters are on each page and store that number in the text lenght array
           text_lenght[_p] = string_length(text[_p]);
 
        //get the x position when 
		text_x_offset[_p] = 20;
		line_width = 230;
  
 }
//typing text
if draw_char < text_lenght[page] {
 draw_char += text_speed;
 draw_char = clamp(draw_char, 0, text_lenght[page]);
}

//flip throught pages
if confirm_key {

       if selected = false {
		   selected_button = current_button;
		   selected = true;
	   } else
	   //destroy the textbox
	   {
		   obj_mainchara.can_move = true
		   instance_destroy();
	   }
	} 
}	

//draw the textbox
txtb_image += txtb_image_spd;
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);
draw_sprite_ext(txtb_sprite,txtb_image,textbox_x,textbox_y,textbox_width/txtb_sprite_w, textbox_height/txtb_sprite_h,0,c_white,1);
 

//draw the text

var _drawtext1 = string_copy(text[page], 1, draw_char);
draw_text_ext((textbox_x - text_x_offset[page]*2 - border) - 46, (textbox_y  - border) - 3, _drawtext1, line_sep, 50)

var _drawtext2 = string_copy(text[page], 1, draw_char);
draw_text_ext((textbox_x - text_x_offset[page]*2 - border) - 46, (textbox_y  - border) - 3, _drawtext2, line_sep, 50)

if impossible3 != false {
var _drawtext3 = string_copy(text[page], 1, draw_char);
draw_text_ext((textbox_x - text_x_offset[page]*2 +20) - 46, (textbox_y  - border) - 6, _drawtext3, line_sep, line_width)
}
if impossible4 != false {
var _drawtext4 = string_copy(text[page], 1, draw_char);
draw_text_ext((textbox_x - text_x_offset[page]*2 - border) - 46, (textbox_y  - border), _drawtext4, line_sep, line_width)
}




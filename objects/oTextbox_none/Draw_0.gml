var confirm_key = keyboard_check_pressed(global.confirm) or keyboard_check_released(vk_enter) or keyboard_check(global.menu) or keyboard_check(vk_control) ;
var skip_key =  keyboard_check_pressed(global.cancel) or keyboard_check_pressed(vk_shift) or keyboard_check(global.menu) or keyboard_check(vk_control) ;
 
var textbox_x = camera_get_view_x(view_camera[0]) + 100;
var textbox_y = camera_get_view_y(view_camera[0]) + 300;

if(setup == false) {
	setup = true;
	
	obj_mainchara.can_move = false;
	
	draw_set_font(fnt_dt_mono_BIG);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);	
	

//loop throught pages
 page_number = array_length(text);
for (var _p = 0; _p < page_number; _p++){
 
           //find how many caracters are on each page and store that number in the text lenght array
           text_lenght[_p] = string_length(text[_p]);
 
        //get the x position when 
		
		
		//portrait
		text_x_offset[_p] = 10;
		portrait_x_offset[_p] = 10;
		line_width = 190;
		
		
		
		
		
		//no portrait
		if speaker_sprite[0] == noone{
		text_x_offset[_p] = 20;
		line_width = 230;
		}
 
   }
 }
//typing text
if draw_char < text_lenght[page] {
 draw_char += text_speed;
 draw_char = clamp(draw_char, 0, text_lenght[page]);
}

//flip throught pages
if confirm_key {
	//if the typing is done
	if draw_char == text_lenght[page]{
		//next page
       if page < page_number-1 {
		   page++
		   draw_char = 0
	   } else
	   //destroy the textbox
	   {
		   obj_mainchara.can_move = true
		   instance_destroy();
	   }
	} 
}	
else if skip_key and draw_char != text_lenght[page]{
		//fill the page
		draw_char = text_lenght[page];
	} 

//draw the textbox
txtb_image += txtb_image_spd;
var txtb_sprite_w = sprite_get_width(txtb_sprite);
var txtb_sprite_h = sprite_get_height(txtb_sprite);
draw_sprite_ext(txtb_sprite,image_index,textbox_x,textbox_y,9, 2.7,0,c_white,1);
 

	 //draw portrait
if  speaker_sprite[0] != noone{
	sprite_index = speaker_sprite[page];
	if draw_char == text_lenght[page] {image_index = 0};
	var speaker_x = 53;

    //draw portrait
	draw_sprite_ext(sprite_index,image_index, textbox_x + 25, textbox_y + 39,55/sprite_width,55/sprite_height,0,c_white,1);
	
}



//draw the text
if speaker_sprite[0] == noone{
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext((textbox_x + text_x_offset[page]*2 - border) + 5, (textbox_y  - border) + 43 , _drawtext, 25, 290)
}

else if speaker_sprite[0] != noone{
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + 85, textbox_y + border + 12, _drawtext, line_sep, 240)
}


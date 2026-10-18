//draw_self()

if (_enabled)
{
   /* for (var i = 0; i < array_length(_completed_files); i++)
    {
        var star_index = _completed_files[i];
        draw_sprite_ext(spr_ui_star, star_index, x + 180, y + 26 + (i * 12), 1, 1, 0, c_white, _alpha);
    }*/
}

if (_title_enabled)
{
	for (var i = 1; i<=7; i++)
	{
    draw_set_halign(fa_center);
    
    draw_set_alpha(_alpha);
    draw_set_font(_font);
	
	if i>button_count-1
	{
	_chapter_title[i] = "- -";
	_chapter_icons[i] = spr_chapterIcon;
	_chapter_noise[i] = snd_nosound;
	}
	
	if _chapter_title[i] == "- -" //If chapter is "empty"
	_color = c_gray
	
	if i == selected_chapter and !( selected_chapter == button_count)  // if chapter is the selected chapter and not on quit
	_color = c_yellow;
	

	
	draw_set_colour(_color)
	if confirmed_a_chapter and selected_chapter == i //change the text to Play and Back
	{
	draw_set_colour(c_white)
	if selected_button == 0
	draw_set_colour(c_yellow)
    draw_text_transformed(x-35, -50 + (i * 60), "Play", _scale, _scale, 0);
	draw_set_colour(c_white)
	if selected_button == 1
	draw_set_colour(c_yellow)
	draw_text_transformed(x+120, -50 + (i * 60), "Do Not", _scale, _scale, 0);
	draw_set_colour(_color)
	}
	else //draw it normally
	draw_text_transformed(x+30, -50 + (i * 60), _chapter_title[i], _scale, _scale, 0);
	
	draw_sprite_ext(_chapter_icons[i], _icon_index, (x + (view_wport[0] / 2)) - 76,-30 + (i * 60), _scale, _scale, 0, _color, _alpha);
    
    draw_set_halign(fa_left);
	
	draw_text_transformed(45, -50 + (i * 60), "Chapter " + string(i), _scale, _scale, 0);
	_color = c_white
    draw_set_alpha(1);
	
	draw_sprite_ext(spr_horzBar, 0, x,  (i * 60), _scale, _scale, 0, c_white, _alpha);
    
	

	
	}
	
	draw_set_colour(c_white)
	if selected_chapter<button_count
	draw_sprite_ext(spr_soul, 0, x-300 + (selected_button*150) + (confirmed_a_chapter*200),  -40 + (selected_chapter * 60), _scale/2, _scale/2, 0, c_white, _alpha);
	if selected_chapter >= button_count
	{
	draw_set_colour(c_yellow)
	draw_sprite_ext(spr_soul, 0, room_width/2-30,  440, _scale/2, _scale/2, 0, c_white, _alpha);
	}
	draw_set_alpha(_alpha)
	draw_text_transformed(room_width/2-10, 430, "Quit", _scale, _scale, 0);
	draw_set_colour(c_white)
	draw_set_alpha(1)

}







/*
if !anim_start
draw_self()
else
{
draw_sprite_ext(spr_chapter_selection,2,x,y,width,1,0,c_white,1)	
}
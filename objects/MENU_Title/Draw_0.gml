draw_self()

if image_index > 1 and image_index < 5
{
if file_exists("File_1") != true
{   draw_set_font(fnt_dt_mono);
	draw_text(164,53,"SAVE FILE 1")
}
if file_exists("File_2") != true
{   draw_set_font(fnt_dt_mono);
	draw_text(164,126,"SAVE FILE 2")
}
if file_exists("File_3") != true
{   draw_set_font(fnt_dt_mono);
	draw_text(164,203,"SAVE FILE 3")
}
	
	
}
if image_index = 5
{draw_set_font(fnt_dt_mono);
	draw_text(4,53,SavedName)
}

if file_exists("File_1") = true 
{
	 draw_set_font(fnt_dt_mono);
	 draw_text(164,53,SavedName);
	 
}
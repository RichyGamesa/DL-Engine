/// obj_namescreen Draw Event

// Draw the player's name
draw_set_font(fnt_dt_mono);
draw_set_color(c_white);
 if (string_length(player_name) < max_name_length)
draw_text(name_x, name_y, player_name);
else
draw_text_color(name_x,name_y,player_name,c_yellow,c_yellow,c_yellow,c_yellow,1)

// Draw voice
draw_set_font(fnt_dt_mono);
draw_text_ext(instructions_x,instructions_y, instructions,20,230);

// Draw instructions
draw_set_font(fnt_dt_mono);
draw_text(10,170,"USE YOUR KEYBOARD TO WRITE YOUR NAME");

draw_set_font(fnt_dt_mono);
draw_text(10,190,"PRESS [ENTER] TO CONFIRM");

draw_set_font(fnt_dt_mono);
draw_text(10,210,"PRESS [SHIFT] TO CANCEL");
// Draw  GUI Event 

var line1 = displayed_lines[0];
var line_1_y = 138;

var line2 = displayed_lines[1];
var line_2_y = 168;

var line3 = displayed_lines[2];
var line_3_y = 198;

var line_x = 200;

var glow_alpha = 0.18;
var return_alpha = 1;

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(fnt_dt_mono_BIG);
draw_set_halign(fa_left);
draw_set_valign(fa_top);


// Glow
	for (var i = 1; i <= 3; i++)
	{
	    draw_set_alpha((glow_alpha / i) * return_alpha);
	    draw_text_transformed(line_x - i, line_1_y,line1,1.5, 1.5, 0);
	    draw_text_transformed(line_x + i, line_1_y,line1,1.5, 1.5, 0);
	    draw_text_transformed(line_x, line_1_y,line1,1.5, 1.5, 0);
	    draw_text_transformed(line_x, line_1_y,line1,1.5, 1.5, 0);
	}

draw_set_alpha(1);	
	
draw_text_transformed(
    line_x, line_1_y,
    line1,
    1.5, 1.5, 0
);

// Glow
	for (var i = 1; i <= 3; i++)
	{
	    draw_set_alpha((glow_alpha / i) * return_alpha);
	    draw_text_transformed(line_x - i, line_2_y,line2,1.5, 1.5, 0);
	    draw_text_transformed(line_x + i, line_2_y,line2,1.5, 1.5, 0);
	    draw_text_transformed(line_x, line_2_y,line2,1.5, 1.5, 0);
	    draw_text_transformed(line_x, line_2_y,line2,1.5, 1.5, 0);
	}

draw_set_alpha(1);

draw_text_transformed(
    line_x, line_2_y,
    line2,
    1.5, 1.5, 0
);

// Glow
	for (var i = 1; i <= 3; i++)
	{
	    draw_set_alpha((glow_alpha / i) * return_alpha);
	    draw_text_transformed(line_x - i, line_3_y,line3,1.5, 1.5, 0);
	    draw_text_transformed(line_x + i, line_3_y,line3,1.5, 1.5, 0);
	    draw_text_transformed(line_x, line_3_y,line3,1.5, 1.5, 0);
	    draw_text_transformed(line_x, line_3_y,line3,1.5, 1.5, 0);
	}

draw_set_alpha(1);

draw_text_transformed(
    line_x, line_3_y,
    line3,
    1.5, 1.5, 0
);

draw_set_alpha(1);
draw_set_color(c_white);
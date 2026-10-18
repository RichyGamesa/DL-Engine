//draw event

draw_self();

if object_exists(obj_kris_target)
{
var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);
draw_sprite(spr_bar_dark,0,_x,_y)
draw_set_font(fnt_dt_mono);
    // Calculate position for Kris's health bar
    var bar_width_K = 80; // Default width for Kris's health bar
    var bar_x_K = _x + (640 - bar_width_K) / 2; // Center horizontally

    // Draw health bar for the protagonist (Kris)
    var hp_percentage_K = global.hp_K / global.maxhp_K;
    var bar_width_K = hp_percentage_K * 100; // Assuming the HP bar is 100 pixels wide

    var bar_x_K = _x + 120; // Adjust the X global.value as needed
    var bar_y_K = _y + 273; // Adjust the Y global.value as needed
	
	if global.num_active_members == 1 {bar_x_K = _x + 270}
	if global.num_active_members > 1 {bar_x_K = _x + 120}

    draw_set_color(c_aqua); // Set the color of the filled part of the HP bar
    draw_rectangle(bar_x_K, bar_y_K + 150, bar_x_K + bar_width_K, bar_y_K + 160, false); // Draw the filled part of the HP bar

    draw_set_color(c_red); // Set the color of the empty part of the HP bar
    draw_rectangle(bar_x_K + bar_width_K, bar_y_K + 150, bar_x_K + 100, bar_y_K + 160, false); // Draw the empty part of the HP bar
    
    // Draw text for protagonist's HP
    draw_set_color(c_white);
    draw_text(bar_x_K, bar_y_K + 133, "HP "+ string(global.hp_K) + "/" + string(global.maxhp_K));

    // Draw Kris's face sprite and name
    var sprite_face_K = spr_krisb_face; // Change to appropriate sprite for Kris
    draw_sprite(sprite_face_K, 0, bar_x_K - 50, bar_y_K + 140); // Adjust sprite position as needed
    draw_text(bar_x_K - 30, bar_y_K + 160, "Kris"); // Adjust text position as needed for name

 // Loop through other active party members
for (var i = 1; i < array_length(global.memberData); i++) {
    if (global.member[i]) {
        var member = global.memberData[i];
        var member_name = member.name;
        var hp = member.hp_points;
        var max_hp = member.maxHp;
        var sprite_face = member.faceSprite;
        var hp_bar_color = member.hpBarColor;

  if global.num_active_members >= 3
  {
	  global.num_active_members++;
  }
            
            // Calculate bar position and width
            var bar_width = 100; // Default width for each member bar
			if global.num_active_members == 2
			{
			var member_bar_x = _x + 70 + global.num_active_members*170;
			}
			else
            var member_bar_x = _x - 370 + global.num_active_members*170;  // Adjust spacing as needed
            var member_bar_y = bar_y_K; // Adjust vertical position as needed
			
        // Calculate HP percentage
        var hp_percentage = hp / max_hp;

        // Calculate member bar width based on HP percentage
        var member_bar_width = hp_percentage * bar_width;

        // Set bar color
        draw_set_color(hp_bar_color); // Set bar color

        // Draw filled part of the health bar
        draw_rectangle(member_bar_x, member_bar_y + 150, member_bar_x + member_bar_width - 12, member_bar_y + 160, false);

        // Set color for empty part of the health bar
        draw_set_color(c_red);

        // Calculate width of the empty part of the health bar
        var empty_bar_width = bar_width - member_bar_width;

        // Draw empty part of the health bar
        draw_rectangle(member_bar_x + member_bar_width - 12, member_bar_y + 150, member_bar_x + bar_width - 12, member_bar_y + 160, false);



        // Draw text for HP
        draw_set_color(c_white);
        draw_text(member_bar_x, member_bar_y + 133, "HP " + string(hp) + "/" + string(max_hp));

        // Draw member's face sprite and name
	    draw_sprite(sprite_face, 0, member_bar_x - 50, member_bar_y + 140); // Adjust sprite position as needed
      
		draw_text(member_bar_x - 30, member_bar_y + 160, member_name); // Adjust text position as needed for name

    }
}
}
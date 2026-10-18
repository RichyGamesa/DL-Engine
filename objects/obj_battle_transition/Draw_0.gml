//obj_battle_transition Draw event


// Draw the battle background stretched to fit the screen
draw_sprite_stretched_ext(bg_battle, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]),c_white,image_alpha);

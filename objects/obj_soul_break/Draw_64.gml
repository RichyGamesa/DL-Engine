//obj_soul_break draw gui

// Draw screenshot first
if variable_global_exists("screenshot")
if (global.screenshot != -1 && sprite_exists(global.screenshot))
{
    draw_sprite_stretched(
        global.screenshot,
        0,
        0, 0,
        display_get_gui_width(),
        display_get_gui_height()
    );
}


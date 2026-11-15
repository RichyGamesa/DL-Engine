/// @function scr_screenshot_show()
/// @description Shows the last screenshot sprite taken

function scr_screenshot_show(){
if (variable_global_exists("screenshot"))
{
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
}
}
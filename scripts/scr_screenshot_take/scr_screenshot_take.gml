
/// @function scr_take_screenshot()
/// @description Captures the current application surface and returns a sprite.

function scr_take_screenshot()
{
    if (!surface_exists(application_surface))
        return -1;

    var _width = surface_get_width(application_surface);
    var _height = surface_get_height(application_surface);

    var _screenshot = sprite_create_from_surface(
        application_surface,
        0, 0,
        _width, _height,
        false, false,
        0, 0
    );

    return _screenshot;
}

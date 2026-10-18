
if (surface_exists(application_surface))
{
    var gw = display_get_gui_width();
    var gh = display_get_gui_height();

    var sx = menu_stretch;
    var sy = 1 + (1 - menu_stretch) * 0.5;

    var wi = gw * sx;
    var h = gh * sy;

    draw_surface_stretched(
        application_surface,
        (gw - wi) * 0.5,
        (gh - h) * 0.5,
        wi,
        h
    );
}

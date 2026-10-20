//obj_damage_popup draw event
var _alpha = clamp(life / life_max, 0, 1);

draw_set_font(fnt_dt_mono);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(_alpha);

// Character-specific health bar color.
draw_set_color(popup_color);

// Scale the damage number up.
draw_text_transformed(
    x, y,
    string(value),
    popup_scale, popup_scale,
    0
);

// Restore drawing state.
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
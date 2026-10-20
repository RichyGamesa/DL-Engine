
draw_self();

var _camera_x = camera_get_view_x(view_camera[0]);
var _camera_y = camera_get_view_y(view_camera[0]);

draw_sprite(spr_bar_dark, 0, _camera_x, _camera_y);
draw_set_font(fnt_dt_mono);

var _bar_width = 100;
var _bar_y = _camera_y + 423;

// Draw active party members in party order.
var _member_slot = 0;

for (var i = 0; i < array_length(global.party_order); i++)
{
    var _member_name = global.party_order[i];
    var _member = scr_get_member_data(_member_name);

    if (is_undefined(_member))
        continue;

    var _hp = variable_global_get(_member.hpVar);
    var _max_hp = max(1, variable_global_get(_member.maxHpVar));
    var _face = _member.faceSprite;
    var _hp_color = _member.hpBarColor;

    var _bar_x;

    if (array_length(global.party_order) == 1)
    {
        _bar_x = _camera_x + 270;
    }
    else if (_member_slot == 0)
    {
        _bar_x = _camera_x + 120;
    }
    else
    {
        _bar_x = _camera_x + 290 + ((_member_slot - 1) * 170);
    }

    _member_slot++;

    var _hp_ratio = clamp(_hp / _max_hp, 0, 1);
    var _filled_width = _hp_ratio * _bar_width;

    // Filled HP.
    draw_set_color(_hp_color);
    draw_rectangle(
        _bar_x,
        _bar_y,
        _bar_x + _filled_width,
        _bar_y + 10,
        false
    );

    // Empty HP.
    draw_set_color(c_red);
    draw_rectangle(
        _bar_x + _filled_width,
        _bar_y,
        _bar_x + _bar_width,
        _bar_y + 10,
        false
    );

    // HP text.
    draw_set_color(c_white);
    draw_text(
        _bar_x,
        _bar_y - 17,
        "HP " + string(_hp) + "/" + string(_max_hp)
    );

    // Face and name.
    draw_sprite(_face, 0, _bar_x - 50, _bar_y - 10);
    draw_text(_bar_x - 30, _bar_y + 10, _member_name);
}

draw_set_color(c_white);

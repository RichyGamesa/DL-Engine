
draw_self();

if (!instance_exists(obj_kris_target))
{
    exit;
}

var _x = camera_get_view_x(view_camera[0]);
var _y = camera_get_view_y(view_camera[0]);

draw_sprite(spr_bar_dark, 0, _x, _y);
draw_set_font(fnt_dt_mono);

// --------------------------------------------------
// KRIS'S HP BAR
// --------------------------------------------------

var _bar_width = 100;
var _bar_y = _y + 423;
var _bar_x;

if (global.num_active_members == 1)
{
    _bar_x = _x + 270;
}
else
{
    _bar_x = _x + 120;
}

// Prevent invalid HP bar calculations.
var _max_hp = max(1, global.maxhp_K);
var _hp_ratio = clamp(global.hp_K / _max_hp, 0, 1);
var _filled_width = _hp_ratio * _bar_width;

// Filled portion.
draw_set_color(c_aqua);
draw_rectangle(
    _bar_x,
    _bar_y,
    _bar_x + _filled_width,
    _bar_y + 10,
    false
);

// Empty portion.
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
    "HP " + string(global.hp_K) + "/" + string(global.maxhp_K)
);

// Face and name.
draw_sprite(spr_krisb_face, 0, _bar_x - 50, _bar_y - 10);
draw_text(_bar_x - 30, _bar_y + 10, "Kris");

// --------------------------------------------------
// OTHER ACTIVE PARTY MEMBERS
// --------------------------------------------------

var _member_slot = 0;

for (var i = 1; i < array_length(global.memberData); i++)
{
    if (global.member[i])
    {
        var _member = global.memberData[i];

        var _member_name = _member.name;
        var _hp = _member.hp_points;
        var _member_max_hp = max(1, _member.maxHp);
        var _face = _member.faceSprite;
        var _hp_color = _member.hpBarColor;

        // Count only for drawing positions.
        // Never modify global.num_active_members in Draw.
        var _member_bar_x = _x + 290 + (_member_slot * 170);
        var _member_bar_y = _bar_y;

        _member_slot++;

        // Calculate HP bar fill.
        var _member_ratio = clamp(_hp / _member_max_hp, 0, 1);
        var _member_filled = _member_ratio * _bar_width;

        // Filled portion.
        draw_set_color(_hp_color);
        draw_rectangle(
            _member_bar_x,
            _member_bar_y,
            _member_bar_x + _member_filled,
            _member_bar_y + 10,
            false
        );

        // Empty portion.
        draw_set_color(c_red);
        draw_rectangle(
            _member_bar_x + _member_filled,
            _member_bar_y,
            _member_bar_x + _bar_width,
            _member_bar_y + 10,
            false
        );

        // HP text.
        draw_set_color(c_white);
        draw_text(
            _member_bar_x,
            _member_bar_y - 17,
            "HP " + string(_hp) + "/" + string(_member.maxHp)
        );

        // Face and name.
        draw_sprite(_face, 0, _member_bar_x - 50, _member_bar_y - 10);
        draw_text(_member_bar_x - 30, _member_bar_y + 10, _name);
    }
}

draw_set_color(c_white);

if (!instance_exists(obj_ExampleCutscene)
&& room != rm_death
&& instance_exists(mainchara))
{
    var _view_w = global.darkworld ? 640 : 320;
    var _view_h = global.darkworld ? 480 : 240;

    x = mainchara.x - (_view_w / 2);
    y = mainchara.y - (_view_h / 2);

    x = clamp(x, 0, max(0, room_width - _view_w));
    y = clamp(y, 0, max(0, room_height - _view_h));
}

camera_set_view_pos(view_camera[0], x, y);
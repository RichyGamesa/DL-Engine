//obj_dw_transition step event
if (instance_exists(obj_darkdoor)) {
    obj_darkdoor.depth = depth + 1;
}
if (started) {
    if (image_xscale < 4) {
        image_xscale += 0.10;
    }
    if (image_yscale < 4) {
        image_yscale += 0.10;
    }
    if (image_xscale >= 4 && image_yscale >= 4) {
        if (instance_number(obj_dw_transition) < 4) {
            instance_create_depth(x - 25, y - 10, obj_mainchara.depth + instance_created, obj_dw_transition);
            instance_created += 2;
        }
    }
    if (instance_exists(obj_doorarea_sunsetoverlay)) {
        instance_destroy(obj_doorarea_sunsetoverlay);
    }
    x = camerax;
    y = cameray;
    if (instance_exists(obj_suzy)) {
        obj_suzy.depth = obj_mainchara.depth;
    }
    if (instance_exists(obj_darkdoor)) {
        if (obj_darkdoor.con >= 16) {
            if (image_alpha > 0) {
                image_alpha -= 0.01;
            } else {
                instance_destroy();
            }
        }
    }
}
if (global.darkworld) {
    image_xscale = 999;
    image_yscale = 999;
}

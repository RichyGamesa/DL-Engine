function bullet_dam(argument0){
var damage = argument0;
var chance = random(4); // Increase the range to include Kris
var down = false;
scr_memb()
// Check if there are any active members
var any_active_member = false;
for (var i = 0; i < array_length(global.memberData); i++) {
    if (global.memberData[i].hp > 0) {
        any_active_member = true;
        break;
    }
}

if (any_active_member) {
    // Kris avoids damage, so damage other party members
    var target_member_index = -1;
    var active_members = [];

    for (var i = 0; i < array_length(global.memberData); i++) {
        if (global.memberData[i].hp > damage) {
            array_push(active_members, i);
        }
    }

    if (array_length(active_members) > 0) {
        target_member_index = active_members[irandom(array_length(active_members) - 1)];
    }

    if (target_member_index != -1) {
        if (chance <= 2) {
            if (global.memberData[target_member_index].hp <= damage) {
                down = true; // they will die next hit
            } else {
                global.memberData[target_member_index].hp -= damage;
            }
        } else {
            if (global.hp_K <= damage && down == true) {
                global.total_hp = 0;
            }
        }
    }
} else {
    // If there are no active members, Kris takes damage
	if any_active_member == false {
    if (chance <= 2) {
        if (global.hp_K <= damage) {
            down = true;
        } else {
            global.hp_K -= damage;
        }
    } else {
        if (global.hp_K <= damage && down == true) {
            global.total_hp = 0;
        }
    }
}
}

if (global.hp_K <= 0) {
    window_set_caption("THE DEATH");
    room_goto(rm_death);
    obj_mainchara.x = 700;
    obj_mainchara.y = 191;
    instance_create_depth(0, 0, -999, obj_ded);
}
}
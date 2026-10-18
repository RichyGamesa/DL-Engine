/*function damage_bullets(argument0) {
    scr_memb(); // Assuming this function initializes some global variables

    var damage = argument0;
    var chance = random(4);
    var down = false;

    var any_active_member = false;
    if (global.num_active_members > 2) {
        for (var i = 0; i < array_length(global.memberData); i++) {
            if (global.memberData[i].hp > 0) {
                any_active_member = true;
                break;
            }
        }
    }

    if (any_active_member) {
        var target_member_index = -1;
        var active_members = [];

        for (var i = 0; i < array_length(global.memberData); i++) {
            if (global.memberData[i].hp > damage) {
                array_push(active_members, i);
            }
        }

        if (array_length(active_members) > 0) {
            target_member_index = active_members[irandom(array_length(active_members))];
        }
        
        // Check if target_member_index is valid
        if (target_member_index != -1) {
            if (chance <= 2) {
                if (!down) {
                    if (global.memberData[target_member_index].hp <= damage) {
                        down = true;
                    } else {
                        global.memberData[target_member_index].hp -= damage;
                        // Update corresponding global HP global.value
                        switch (target_member_index) {
                            case 0: global.hp_K -= damage; break;
                            case 1: global.hp_S -= damage; break;
                            case 2: global.hp_R -= damage; break;
                            case 3: global.hp_T -= damage; break;
                            // Add cases for other members if needed
                        }
                    }
                }
            } else if (chance >= 3) {
                if (global.hp_K > damage) {
                    global.hp_K -= damage;
                }
                if (global.hp_K <= damage) {
                    if (down == true) {
                        global.total_hp = 0;
                    }
                }
            }
        }
    }

    if (any_active_member == false) {
        global.hp_K -= damage;
    }

    if (global.hp_K < damage) {
        if (!any_active_member) {
            global.total_hp = 0;
            room_goto(rm_death);
        }
    }
}

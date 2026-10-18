// Handle item usage
/*
if (item_menu) {
    show_debug_message("Item menu is active");

    // Check if the selected item is within bounds
    if (item_selected >= 0 && item_selected < array_length(global.items_dark)) {
        show_debug_message("Selected item is valid");

        // Get item information
        var item_name = global.items_dark[item_selected];
        scr_iteminfo(item_name);

        // Check if the item is usable
        if (usable) {
            show_debug_message("Item is usable");

            switch (global.itemtarget) {
                case 0: // Target: None
                    // No action needed
                    break;
                case 1: // Target: Single party member
                    show_debug_message("Targeting single party member");
                    if (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter)) {
                        show_debug_message("Z or Enter key pressed");
                        // Check if there are party members and a selected party member
                        if (global.num_active_members > 0 && selected_party_member >= 0 && selected_party_member < global.num_active_members) {
                            show_debug_message("Selected party member is valid");
                            // Heal the selected party member
                            global.memberData[selected_party_member].hp += hp;
                            // Ensure HP doesn't exceed max HP
                            if (global.memberData[selected_party_member].hp > global.memberData[selected_party_member].maxHp) {
                                global.memberData[selected_party_member].hp = global.memberData[selected_party_member].maxHp;
                            }
                            // Reset selected party member
                            selected_party_member = 0;
                        }
                    }
                    break;
                case 2: // Target: All party members
                    if (keyboard_check_pressed(global.confirm) || keyboard_check_pressed(vk_enter)) {
                        show_debug_message("Z or Enter key pressed");
                        // Loop through all active party members and heal them
                        for (var i = 0; i < global.num_active_members; i++) {
                            global.memberData[i].hp += hp;
                            // Ensure HP doesn't exceed max HP
                            if (global.memberData[i].hp > global.memberData[i].maxHp) {
                                global.memberData[i].hp = global.memberData[i].maxHp;
                            }
                        }
                    }
                    break;
            }
        }
    }
}
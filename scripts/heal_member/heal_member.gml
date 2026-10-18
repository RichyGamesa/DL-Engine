// Function to heal a selected party member
function heal_member(selected_party_member, amount) {
    // Update the HP of the selected member
    var global_hp_variable = global_hp_variables[selected_party_member];
    global[global_hp_variable] += amount;
    // Ensure HP doesn't exceed max HP
    var max_hp_variable = "maxhp_" + party_members[selected_party_member];
    if (global[global_hp_variable] > global[max_hp_variable]) {
        global[global_hp_variable] = global[max_hp_variable];
    }
}
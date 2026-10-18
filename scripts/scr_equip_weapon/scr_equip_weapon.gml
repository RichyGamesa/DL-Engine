function scr_equip_weapon()
{
if (equipping_kris) 
{
    // Subtract the stats of the currently equipped weapon
    global.real_atk_K -= global.current_weapon_atk_K;
    global.real_df_K -= global.current_weapon_df_K;
    global.real_mag_K -= global.current_weapon_mag_K;

    // Add the stats of the new weapon
    global.real_atk_K += global.weaponattemp;
    global.real_df_K += global.weapondftemp;
    global.real_mag_K += global.weaponmagtemp;

    // Update the current weapon stats
    global.current_weapon_atk_K = global.weaponattemp;
    global.current_weapon_df_K = global.weapondftemp;
    global.current_weapon_mag_K = global.weaponmagtemp;
}

// Repeat similar logic for Susie, Ralsei, and Toriel
if (equipping_susie) {
    global.real_atk_S -= global.current_weapon_atk_S;
    global.real_df_S -= global.current_weapon_df_S;
    global.real_mag_S -= global.current_weapon_mag_S;

    global.real_atk_S += global.weaponattemp;
    global.real_df_S += global.weapondftemp;
    global.real_mag_S += global.weaponmagtemp;

    global.current_weapon_atk_S = global.weaponattemp;
    global.current_weapon_df_S = global.weapondftemp;
    global.current_weapon_mag_S = global.weaponmagtemp;
}

if (equipping_ralsei) {
    global.real_atk_R -= global.current_weapon_atk_R;
    global.real_df_R -= global.current_weapon_df_R;
    global.real_mag_R -= global.current_weapon_mag_R;

    global.real_atk_R += global.weaponattemp;
    global.real_df_R += global.weapondftemp;
    global.real_mag_R += global.weaponmagtemp;

    global.current_weapon_atk_R = global.weaponattemp;
    global.current_weapon_df_R = global.weapondftemp;
    global.current_weapon_mag_R = global.weaponmagtemp;
}

if (equipping_toriel) {
    global.real_atk_T -= global.current_weapon_atk_T;
    global.real_df_T -= global.current_weapon_df_T;
    global.real_mag_T -= global.current_weapon_mag_T;

    global.real_atk_T += global.weaponattemp;
    global.real_df_T += global.weapondftemp;
    global.real_mag_T += global.weaponmagtemp;

    global.current_weapon_atk_T = global.weaponattemp;
    global.current_weapon_df_T = global.weapondftemp;
    global.current_weapon_mag_T = global.weaponmagtemp;
}
}
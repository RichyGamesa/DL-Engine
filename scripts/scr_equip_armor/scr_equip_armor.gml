function scr_equip_armor() {
    // Determine which armor slot is being equipped
    if (equipping_armor_slot == 1)
	{
        // Determine which character is being equipped
        if (equipping_kris) {
            // Subtract the stats of the currently equipped armor 1
            global.real_atk_K -= global.current_armor1_atk_K;
            global.real_df_K -= global.current_armor1_df_K;
            global.real_mag_K -= global.current_armor1_mag_K;

            // Update the current armor 1 stats
            global.current_armor1_atk_K = global.armorattemp;
            global.current_armor1_df_K = global.armordftemp;
            global.current_armor1_mag_K = global.armormagtemp;

            // Add the stats of the new armor 1
            global.real_atk_K += global.armorattemp;
            global.real_df_K += global.armordftemp;
            global.real_mag_K += global.armormagtemp;
        } else if (equipping_susie) {
            // Subtract the stats of the currently equipped armor 1
            global.real_atk_S -= global.current_armor1_atk_S;
            global.real_df_S -= global.current_armor1_df_S;
            global.real_mag_S -= global.current_armor1_mag_S;

            // Update the current armor 1 stats
            global.current_armor1_atk_S = global.armorattemp;
            global.current_armor1_df_S = global.armordftemp;
            global.current_armor1_mag_S = global.armormagtemp;

            // Add the stats of the new armor 1
            global.real_atk_S += global.armorattemp;
            global.real_df_S += global.armordftemp;
            global.real_mag_S += global.armormagtemp;
        } else if (equipping_ralsei) {
            // Subtract the stats of the currently equipped armor 1
            global.real_atk_R -= global.current_armor1_atk_R;
            global.real_df_R -= global.current_armor1_df_R;
            global.real_mag_R -= global.current_armor1_mag_R;

            // Update the current armor 1 stats
            global.current_armor1_atk_R = global.armorattemp;
            global.current_armor1_df_R = global.armordftemp;
            global.current_armor1_mag_R = global.armormagtemp;

            // Add the stats of the new armor 1
            global.real_atk_R += global.armorattemp;
            global.real_df_R += global.armordftemp;
            global.real_mag_R += global.armormagtemp;
        } else if (equipping_toriel) {
            // Subtract the stats of the currently equipped armor 1
            global.real_atk_T -= global.current_armor1_atk_T;
            global.real_df_T -= global.current_armor1_df_T;
            global.real_mag_T -= global.current_armor1_mag_T;

            // Update the current armor 1 stats
            global.current_armor1_atk_T = global.armorattemp;
            global.current_armor1_df_T = global.armordftemp;
            global.current_armor1_mag_T = global.armormagtemp;

            // Add the stats of the new armor 1
            global.real_atk_T += global.armorattemp;
            global.real_df_T += global.armordftemp;
            global.real_mag_T += global.armormagtemp;
        }
    } 
	else 
	if (equipping_armor_slot == 2) 
	{
        // Determine which character is being equipped
        if (equipping_kris) {
            // Subtract the stats of the currently equipped armor 2
            global.real_atk_K -= global.current_armor2_atk_K;
            global.real_df_K -= global.current_armor2_df_K;
            global.real_mag_K -= global.current_armor2_mag_K;

            // Update the current armor 2 stats
            global.current_armor2_atk_K = global.armorattemp;
            global.current_armor2_df_K = global.armordftemp;
            global.current_armor2_mag_K = global.armormagtemp;

            // Add the stats of the new armor 2
            global.real_atk_K += global.armorattemp;
            global.real_df_K += global.armordftemp;
            global.real_mag_K += global.armormagtemp;
        } else if (equipping_susie) {
            // Subtract the stats of the currently equipped armor 2
            global.real_atk_S -= global.current_armor2_atk_S;
            global.real_df_S -= global.current_armor2_df_S;
            global.real_mag_S -= global.current_armor2_mag_S;

            // Update the current armor 2 stats
            global.current_armor2_atk_S = global.armorattemp;
            global.current_armor2_df_S = global.armordftemp;
            global.current_armor2_mag_S = global.armormagtemp;

            // Add the stats of the new armor 2
            global.real_atk_S += global.armorattemp;
            global.real_df_S += global.armordftemp;
            global.real_mag_S += global.armormagtemp;
        } else if (equipping_ralsei) {
            // Subtract the stats of the currently equipped armor 2
            global.real_atk_R -= global.current_armor2_atk_R;
            global.real_df_R -= global.current_armor2_df_R;
            global.real_mag_R -= global.current_armor2_mag_R;

            // Update the current armor 2 stats
            global.current_armor2_atk_R = global.armorattemp;
            global.current_armor2_df_R = global.armordftemp;
            global.current_armor2_mag_R = global.armormagtemp;

            // Add the stats of the new armor 2
            global.real_atk_R += global.armorattemp;
            global.real_df_R += global.armordftemp;
            global.real_mag_R += global.armormagtemp;
        } else if (equipping_toriel) {
            // Subtract the stats of the currently equipped armor 2
            global.real_atk_T -= global.current_armor2_atk_T;
            global.real_df_T -= global.current_armor2_df_T;
            global.real_mag_T -= global.current_armor2_mag_T;

            // Update the current armor 2 stats
            global.current_armor2_atk_T = global.armorattemp;
            global.current_armor2_df_T = global.armordftemp;
            global.current_armor2_mag_T = global.armormagtemp;

            // Add the stats of the new armor 2
            global.real_atk_T += global.armorattemp;
            global.real_df_T += global.armordftemp;
            global.real_mag_T += global.armormagtemp;
        }
    }
}

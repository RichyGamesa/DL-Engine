function scr_armorinfo_all() //gml_Script_scr_armorinfo_all
{
    for (i = 0; i < 48; i += 1)
    {
        scr_armorinfo(global.armor[i])
        armorname[i] = armornametemp
        armordesc[i] = global.armordesctemp
        amessage2[i] = amessage2temp
        amessage3[i] = amessage3temp
        amessage4[i] = amessage4temp
		amessage5[i] = amessage5temp
        armorat[i] = global.armorattemp
        armordf[i] = global.armordftemp
        armormag[i] = global.armormagtemp
        armorbolts[i] = armorboltstemp
        armorgrazeamt[i] = armorgrazeamttemp
        armorgrazesize[i] = armorgrazesizetemp
        armorchar1[i] = armorchar1temp
        armorchar2[i] = armorchar2temp
        armorchar3[i] = armorchar3temp
        armorchar4[i] = armorchar4temp
		armorchar5[i] = armorchar5temp
        armorglobal.value[i] = global.value
        armorability[i] = global.armorabilitytemp
        armorabilityicon[i] = global.armorabilityicontemp
        armoricon[i] = global.armoricontemp
        armorelement[i] = armorelementtemp
        armorelementamount[i] = armorelementamounttemp
    }
}


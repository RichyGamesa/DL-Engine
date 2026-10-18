/// @param name String
function scr_get_spells(name)
{
var name_selected = argument0;
switch (name_selected) {
    case "Kris":
        return global.spells_Kris;
    case "Susie":
        return global.spells_Susie;
    case "Ralsei":
        return global.spells_Ralsei;
    case "Toriel":
        return global.spells_Toriel;
    default:
        return []; // Return an empty array if no match is found
}
}

-- ##################################################################
-- # CONSTANTS / CONFIG
-- ##################################################################

_G.debugPrint = function(msg, ...)
    if false then -- set to true to enable debug
        print("|cff66ccff[DJ_Debug]|r", msg, ...)
    end
end


_G.BOSS_TRANSFORMS = {
    [12201] = {
        facing = 0,
        x = 0,
        y = 0,
        z = 0,
        scale = 0.9,
    },
}

_G.armorSlotList = {
    "Head", "Neck", "Shoulder", "Back", "Chest", "Wrist", "Hands",
    "Waist", "Legs", "Feet", "Finger", "Trinket",
}

-- Assign slotIcons to _G
_G.slotIcons = {
    Head     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Head",
    Neck     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Neck",
    Shoulder = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Shoulder",
    Back     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest",
    Chest    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Chest",
    Wrist    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Wrists",
    Hands    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Hands",
    Waist    = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Waist",
    Legs     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Legs",
    Feet     = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Feet",
    Finger   = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Finger",
    Trinket  = "Interface\\PaperDoll\\UI-PaperDoll-Slot-Trinket",

    Cloth    = "Interface\\Icons\\inv_chest_cloth_26",
    Leather  = "Interface\\Icons\\inv_chest_leather_14",
    Mail     = "Interface\\Icons\\inv_chest_mail_15",
    Plate    = "Interface\\Icons\\inv_chest_plate20",
}

-- Assign weaponTypeList to _G
_G.weaponTypeList = {
    "Staff",
    "Daggers",
    "One-Handed Axes",
    "Two-Handed Axes",
    "One-Handed Maces",
    "Two-Handed Maces",
    "One-Handed Swords",
    "Two-Handed Swords",
    "Polearms",
    "Fist Weapons",
    "Bows",
    "Guns",
    "Crossbows",
    "Shield",
    "Wands",
    "Off-hand",
    "Idols",
    "Totems",
}

-- Assign weaponIcons to _G
_G.weaponIcons = {
    ["Staff"]             = "Interface\\Icons\\INV_Staff_13",
    ["Daggers"]           = "Interface\\Icons\\inv_dagger_01",
    ["One-Handed Axes"]   = "Interface\\Icons\\inv_axe_04",
    ["Two-Handed Axes"]   = "Interface\\Icons\\inv_axe_08",
    ["One-Handed Maces"]  = "Interface\\Icons\\inv_mace_01",
    ["Two-Handed Maces"]  = "Interface\\Icons\\inv_hammer_16",
    ["One-Handed Swords"] = "Interface\\Icons\\inv_sword_04",
    ["Two-Handed Swords"] = "Interface\\Icons\\inv_sword_10",
    ["Polearms"]          = "Interface\\Icons\\inv_spear_07",
    ["Fist Weapons"]      = "Interface\\Icons\\inv_gauntlets_04",
    ["Bows"]              = "Interface\\Icons\\inv_weapon_bow_05",
    ["Guns"]              = "Interface\\Icons\\inv_weapon_rifle_01",
    ["Crossbows"]         = "Interface\\Icons\\inv_weapon_crossbow_01",
    ["Shield"]            = "Interface\\Icons\\inv_shield_06",
    ["Wands"]             = "Interface\\Icons\\inv_wand_02",
    ["Off-hand"]          = "Interface\\Icons\\inv_misc_book_16",
    ["Idols"]             = "Interface\\Icons\\inv_relics_idol",
    ["Totems"]            = "Interface\\Icons\\inv_relics_totem",
}

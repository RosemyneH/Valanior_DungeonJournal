-- ##################################################################
-- # UTILITY FUNCTIONS
-- ##################################################################
debugPrint("Starting creation of Utility")

-- Define local implementations
local function IsInList(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

local function GetCurrentClass()
    local _, englishClass = UnitClass("player")
    return englishClass
end

-- Returns a union of all known armor types
local function GetAllArmorTypes()
    local union, seen = {}, {}
    debugPrint("GetAllArmorTypes called.")
    if Valanior_DJ.allowedArmorType then
        for className, armorList in pairs(Valanior_DJ.allowedArmorType) do
            debugPrint("  Checking class:", className, armorList and (#armorList .. " entries") or "nil list")
            if armorList then
                for _, t in ipairs(armorList) do
                    if not seen[t] then
                        seen[t] = true
                        table.insert(union, t)
                    end
                end
            end
        end
    end
    table.sort(union)
    debugPrint("  Returning union of armor types:", table.concat(union, ", "))
    return union
end

-- Returns all weapon types for the current class
local function GetAllWeaponTypes()
    local union, seen = {}, {}
    local currentClass = GetCurrentClass()
    debugPrint("GetAllWeaponTypes called for class:", currentClass)
    local weaponTypes = Valanior_DJ.allowedWeaponType and Valanior_DJ.allowedWeaponType[currentClass] or {}
    for _, t in ipairs(weaponTypes) do
        if not seen[t] then
            seen[t] = true
            table.insert(union, t)
        end
    end
    table.sort(union)
    debugPrint("  union of weapon types:", table.concat(union, ", "))
    return union
end

-- Checks if an item is equippable by the current class based on armor/weapon filters
local function IsItemEquippableByClass(itemID)
    local itemName, _, _, _, _, itemType, itemSubType, _, equipLoc = GetItemInfo(itemID)
    if not itemName then
        debugPrint("IsItemEquippableByClass:", itemID, "not cached yet, returning false.")
        return false
    end

    local cClass      = GetCurrentClass()
    local armorTypes  = Valanior_DJ.allowedArmorType and Valanior_DJ.allowedArmorType[cClass] or {}
    local weaponTypes = Valanior_DJ.allowedWeaponType and Valanior_DJ.allowedWeaponType[cClass] or {}
    local armorCount  = #armorTypes
    local weaponCount = #weaponTypes

    -- If no armor is selected and we do have weapons, skip armor items
    if armorCount == 0 and weaponCount > 0 then
        if itemType ~= "Weapon" then
            return false
        end
        -- If no weapon is selected and we do have armor, skip weapon items
    elseif weaponCount == 0 and armorCount > 0 then
        if itemType ~= "Armor" then
            return false
        end
    end

    if itemType == "Armor" then
        local allowedSlots = Valanior_DJ.allowedArmorSlots or {}
        if armorCount == 0 or next(allowedSlots) == nil then
            return true
        end
        local typeOK = false
        for _, t in ipairs(armorTypes) do
            if itemSubType == t then
                typeOK = true
                break
            end
        end
        local equipLocToSlotKey = {
            INVTYPE_HEAD     = "Head",
            INVTYPE_NECK     = "Neck",
            INVTYPE_SHOULDER = "Shoulder",
            INVTYPE_CLOAK    = "Back",
            INVTYPE_CHEST    = "Chest",
            INVTYPE_BODY     = "Shirt",
            INVTYPE_TABARD   = "Tabard",
            INVTYPE_WRIST    = "Wrist",
            INVTYPE_HAND     = "Hands",
            INVTYPE_WAIST    = "Waist",
            INVTYPE_LEGS     = "Legs",
            INVTYPE_FEET     = "Feet",
            INVTYPE_FINGER   = "Finger",
            INVTYPE_TRINKET  = "Trinket",
        }
        local slotKey = equipLocToSlotKey[equipLoc or ""]
        if typeOK and slotKey and allowedSlots[slotKey] then
            return true
        else
            return false
        end
    elseif itemType == "Weapon" then
        local typeOK = false
        for _, t in ipairs(weaponTypes) do
            if itemSubType == t then
                typeOK = true
                break
            end
        end
        return typeOK
    end

    return true
end

-- Simple item caching by forcing the tooltip to load
local function CacheItem(itemID)
    local tip = CreateFrame("GameTooltip", "CacheTooltip" .. itemID, nil, "GameTooltipTemplate")
    tip:SetOwner(UIParent, "ANCHOR_NONE")
    tip:SetHyperlink("item:" .. itemID)
    debugPrint("Caching item:", itemID)
end

local function PreCacheDungeonVersion(dungeon, version, force)
    debugPrint("PreCacheDungeonVersion called for dungeon:", dungeon.name, "version:", version and version.name, "force:",
        force)
    if not dungeon or not dungeon.items then
        debugPrint("  No items found or dungeon is nil, returning.")
        return
    end
    Valanior_DJ.cached = Valanior_DJ.cached or {}
    local key = dungeon.name .. (version and ("_" .. version.name) or "_default")
    if not force and Valanior_DJ.cached[key] then
        debugPrint("  Already cached, skipping.")
        return
    end
    Valanior_DJ.cached[key] = true

    if version then
        for _, id in ipairs(dungeon.items) do
            CacheItem(id + version.modifier)
        end
    else
        for _, id in ipairs(dungeon.items) do
            CacheItem(id)
        end
    end
end

-- Clears spell frames from a container if needed
local function ClearSpellFrames()
    debugPrint("ClearSpellFrames called.")
    if spellContainer then
        for _, child in ipairs({ spellContainer:GetChildren() }) do
            child:Hide()
            child:SetParent(nil)
        end
    end
end

-- ##################################################################
-- # Expose these functions to the global table (_G)
-- ##################################################################
_G.IsInList                = IsInList
_G.GetCurrentClass         = GetCurrentClass
_G.GetAllArmorTypes        = GetAllArmorTypes
_G.GetAllWeaponTypes       = GetAllWeaponTypes
_G.IsItemEquippableByClass = IsItemEquippableByClass
_G.CacheItem               = CacheItem
_G.PreCacheDungeonVersion  = PreCacheDungeonVersion
_G.ClearSpellFrames        = ClearSpellFrames

debugPrint("Utility.lua => All utility functions assigned to _G.")

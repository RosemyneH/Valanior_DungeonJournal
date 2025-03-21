-- ##################################################################
-- # UTILITY FUNCTIONS
-- ##################################################################

if not C_Timer then
    C_Timer = {}
    function C_Timer.After(delay, func)
        local f = CreateFrame("Frame")
        f.elapsed = 0
        f:SetScript("OnUpdate", function(self, elapsed)
            self.elapsed = self.elapsed + elapsed
            if self.elapsed >= delay then
                self:SetScript("OnUpdate", nil)
                func()
            end
        end)
    end
end

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

local function NormalizeItemType(itemType, itemSubType, equipLoc)
    -- If item is "Armor" but actually a shield/off-hand, force them to be "Weapon" with a matching subType.
    if itemType == "Armor" then
        if itemSubType == "Shields" then
            itemType = "Weapon"
            itemSubType = "Shield" -- user must have "Shield" in allowedWeaponType
        elseif equipLoc == "INVTYPE_HOLDABLE" and itemSubType == "Miscellaneous" then
            itemType = "Weapon"
            itemSubType = "Off-hand" -- user must have "Off-hand" in allowedWeaponType
        end
    end

    -- If itemType=="Weapon" and subType=="Daggers", user must have "Daggers" in allowedWeaponType
    -- If you have more cases (e.g. "Wands"), unify them similarly.

    return itemType, itemSubType
end

-- Always include base: Cloth, Leather, Mail, Plate
local function GetAllArmorTypes()
    local baseArmor = { "Cloth", "Leather", "Mail", "Plate" }
    local union, seen = {}, {}

    for _, armorType in ipairs(baseArmor) do
        seen[armorType] = true
        table.insert(union, armorType)
    end

    if Valanior_DJ.allowedArmorType then
        for className, armorList in pairs(Valanior_DJ.allowedArmorType) do
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
    return union
end

local function GetAllWeaponTypes()
    local union, seen = {}, {}
    local currentClass = GetCurrentClass()
    local weaponTypes = Valanior_DJ.allowedWeaponType and Valanior_DJ.allowedWeaponType[currentClass] or {}
    for _, t in ipairs(weaponTypes) do
        if not seen[t] then
            seen[t] = true
            table.insert(union, t)
        end
    end
    table.sort(union)
    return union
end

function IsItemEquippableByClass(itemID, filterIcon)
    local itemName, link, quality, _, _, itemType, itemSubType, _, equipLoc = GetItemInfo(itemID)
    if not itemName then
        debugPrint("IsItemEquippableByClass:", itemID, "not cached => false")
        return false
    end

    local cClass       = GetCurrentClass()
    local armorTypes   = Valanior_DJ.allowedArmorType and Valanior_DJ.allowedArmorType[cClass] or {}
    local weaponTypes  = Valanior_DJ.allowedWeaponType and Valanior_DJ.allowedWeaponType[cClass] or {}
    local allowedSlots = Valanior_DJ.allowedArmorSlots or {}

    -- If no filters are set, pass the item.
    if (#armorTypes == 0) and (#weaponTypes == 0) then
        return true
    end

    -- Define a mapping for equip slots.
    local slotMap = {
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
    local slotKey = slotMap[equipLoc or ""]

    -- Define slots that should ignore armor type filtering.
    local ignoreArmorTypeSlots = {
        Neck = true,
        Finger = true,
        Trinket = true,
        Back = true
    }

    -- If filtering by Weapons only, run only the weapon logic.
    if filterIcon == "Weapons" then
        if itemType == "Weapon" then
            return _G.IsInList(weaponTypes, itemSubType)
        elseif itemType == "Armor" and (itemSubType == "Shields" or equipLoc == "INVTYPE_HOLDABLE") then
            for _, wType in ipairs(weaponTypes) do
                if (itemSubType == "Shields" and wType == "Shield") or
                    (equipLoc == "INVTYPE_HOLDABLE" and wType == "Off-hand") then
                    return true
                end
            end
            return false
        else
            return false
        end
    end

    -- If filtering by Armor only, run only armor logic.
    if filterIcon == "Armor" then
        if itemType ~= "Armor" then
            return false
        end
        if slotKey and ignoreArmorTypeSlots[slotKey] then
            return allowedSlots[slotKey] == true
        end
        if #armorTypes > 0 then
            local foundType = false
            for _, t in ipairs(armorTypes) do
                if t == itemSubType then
                    foundType = true
                    break
                end
            end
            if not foundType then
                return false
            end
        end
        if slotKey then
            return allowedSlots[slotKey] == true
        end
        return false
    end

    -- If filterIcon is "All", check based on item type:
    if filterIcon == "All" then
        if itemType == "Armor" then
            if slotKey and ignoreArmorTypeSlots[slotKey] then
                return allowedSlots[slotKey] == true
            else
                if #armorTypes > 0 then
                    local foundType = false
                    for _, t in ipairs(armorTypes) do
                        if t == itemSubType then
                            foundType = true
                            break
                        end
                    end
                    if not foundType then
                        return false
                    end
                end
                if slotKey then
                    return allowedSlots[slotKey] == true
                end
                return false
            end
        elseif itemType == "Weapon" then
            if #weaponTypes == 0 then
                return true
            end
            return _G.IsInList(weaponTypes, itemSubType)
        else
            return true
        end
    end

    return true
end

local cacheQueue = cacheQueue or {}

local function ProcessCacheQueue()
    if #cacheQueue > 0 then
        local itemID = table.remove(cacheQueue, 1)
        local tip = CreateFrame("GameTooltip", nil, UIParent, "GameTooltipTemplate")
        tip:SetOwner(UIParent, "ANCHOR_NONE")
        local hyperlink = string.format("item:%d:0:0:0:0:0:0:0", itemID)
        pcall(function() tip:SetHyperlink(hyperlink) end)
        tip:Hide()
        tip = nil
    end
end

-- Create a ticker to process one item every 1/120 seconds (approx. 120 items per second)
if not cacheTicker then
    if C_Timer and C_Timer.NewTicker then
        cacheTicker = C_Timer.NewTicker(1 / 120, ProcessCacheQueue)
    else
        local f = CreateFrame("Frame")
        f.elapsed = 0
        f:SetScript("OnUpdate", function(self, elapsed)
            self.elapsed = self.elapsed + elapsed
            if self.elapsed >= 1 / 120 then
                self.elapsed = 0
                ProcessCacheQueue()
            end
        end)
        cacheTicker = f
    end
end

-- Throttled CacheItem function: Enqueues an item for caching.
local function CacheItem(itemID)
    local numID = tonumber(itemID)
    if not numID then
        return
    end
    local tip = CreateFrame("GameTooltip", nil, UIParent)
    tip:SetOwner(UIParent, "ANCHOR_NONE")
    tip:SetHyperlink("item:" .. itemID)
    debugPrint("Caching item:", itemID)
    tip:Hide()
    tip = nil
end



local function PreCacheDungeonVersion(dungeon, version, force)
    if not dungeon or not dungeon.items then
        return
    end
    Valanior_DJ.cached = Valanior_DJ.cached or {}
    local key = dungeon.name .. (version and ("_" .. (version.name or "default")) or "_default")
    if not force and Valanior_DJ.cached[key] then
        return
    end
    Valanior_DJ.cached[key] = true

    local mod = 0
    if version then
        mod = version.modifier or 0
    end

    for _, id in ipairs(dungeon.items) do
        if type(id) == "number" then
            local itemID = id + mod
            pcall(function() CacheItem(itemID) end)
        end
    end
end



local function ClearSpellFrames()
    if spellContainer then
        for _, child in ipairs({ spellContainer:GetChildren() }) do
            child:Hide()
            child:SetParent(nil)
        end
    end
end

_G.IsInList                = IsInList
_G.GetCurrentClass         = GetCurrentClass
_G.GetAllArmorTypes        = GetAllArmorTypes
_G.GetAllWeaponTypes       = GetAllWeaponTypes
_G.IsItemEquippableByClass = IsItemEquippableByClass
_G.CacheItem               = CacheItem
_G.PreCacheDungeonVersion  = PreCacheDungeonVersion
_G.ClearSpellFrames        = ClearSpellFrames

local debug = true
Valanior_DJ = Valanior_DJ or {}

local settings = Valanior_DJ
--------------------------------------------------------------------
-- INITIALIZATION ON ADDON LOAD
--------------------------------------------------------------------
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == "Valanior_DungeonJournal" then
        -- Initialize character-specific settings
        settings.showDungeonName = (settings.showDungeonName == nil) and true or settings.showDungeonName
        settings.hasAlreadyCached = settings.hasAlreadyCached or false
        settings.cached = settings.cached or {}
        settings.recacheScheduled = settings.recacheScheduled or {}
        settings.favorites = settings.favorites or {}
        settings.filterType = settings.filterType or "All"
        settings.leveledBoss = settings.leveledBoss or {}
        settings.activeFilters = settings.activeFilters or {}
        settings.levelUpClickCount = settings.levelUpClickCount or {}

        -- Default armor and weapon types, plus armor slots
        local localizedClass, englishClass = UnitClass("player")
        if not settings.allowedArmorType then
            settings.allowedArmorType = {
                WARRIOR     = { "Plate", "Mail", "Leather" },
                DEATHKNIGHT = { "Plate", "Mail", "Leather" },
                PALADIN     = { "Plate", "Mail", "Leather", "Cloth" },
                HUNTER      = { "Mail", "Leather" },
                ROGUE       = { "Leather" },
                PRIEST      = { "Cloth" },
                MAGE        = { "Cloth" },
                WARLOCK     = { "Cloth" },
                DRUID       = { "Leather", "Cloth" },
                SHAMAN      = { "Mail", "Leather", "Cloth" },
            }
        end

        if not settings.allowedWeaponType then
            settings.allowedWeaponType = {
                WARRIOR     = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms", "Shield" },
                DEATHKNIGHT = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms" },
                PALADIN     = { "One-Handed Maces", "One-Handed Swords", "Two-Handed Maces", "Two-Handed Swords",
                    "Daggers", "Fist Weapons", "Staves", "Shield" },
                HUNTER      = { "Bows", "Guns", "Crossbows", "Daggers", "One-Handed Swords", "One-Handed Axes", "Fist Weapons" },
                ROGUE       = { "Daggers", "Fist Weapons", "One-Handed Swords", "One-Handed Axes" },
                PRIEST      = { "Daggers", "Staves", "Wands", "One-Handed Maces" },
                MAGE        = { "Daggers", "Staves", "Wands", "One-Handed Swords", "Two-Handed Swords", "Shield" },
                WARLOCK     = { "Daggers", "Staves", "Wands", "One-Handed Swords" },
                DRUID       = { "Daggers", "Fist Weapons", "Staves", "One-Handed Maces" },
                SHAMAN      = { "One-Handed Axes", "One-Handed Maces", "Two-Handed Maces", "Staves", "Daggers", "Fist Weapons", "Shield" },
            }
        end

        if not settings.allowedArmorSlots then
            settings.allowedArmorSlots = {
                Head     = true,
                Neck     = true,
                Shoulder = true,
                Back     = true,
                Chest    = true,
                Wrist    = true,
                Hands    = true,
                Waist    = true,
                Legs     = true,
                Feet     = true,
                Finger   = true,
                Trinket  = true,
            }
        end
        --[[
        local key1, key2 = GetBindingKey("VALANIOR_DJ_TOGGLERUNE")
        if not key1 and not key2 then
            SetBinding("G", "VALANIOR_DJ_TOGGLERUNE")
            SaveBindings(GetCurrentBindingSet())
        end
        --]]
    end
end)


-- Globals / saved variables
-- Put these in _G if you want other files to reference them easily
_G.Valanior_DJ = _G.Valanior_DJ or {}
_G.Valanior_DJ.favorites = _G.Valanior_DJ.favorites or {} -- itemID -> true if favorited
_G.Valanior_DJ.currentVersionIndex = _G.Valanior_DJ.currentVersionIndex or 1
_G.DJ_Settings = _G.DJ_Settings or { onlyEquipable = false }

-- If needed as globals elsewhere:
_G.lastBossNavDungeon = _G.lastBossNavDungeon or nil
_G.currentBossIndex = _G.currentBossIndex or 1

-- Access the global table of dungeons
local dungeonData = _G.Valanior and _G.Valanior.djDungeons or {}
_G.dungeonData = dungeonData -- If you need to reference it outside
print("|cff66ccff[DJ_Debug]|r # of dungeons in _G.Valanior.djDungeons =", #dungeonData)

-- Frame for loading, events, etc.
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, ...)
end)

-- Slash command to toggle
SLASH_DJ1 = "/dj"
SlashCmdList["DJ"] = function(msg)
    if DungeonJournalFrame then
        DungeonJournalFrame:Show()
        debugPrint("DungeonJournalFrame is nil!")
    end
end

-- Slash command to recache
SLASH_DJRECACHE1 = "/djcache"
SlashCmdList["DJRECACHE"] = function(msg)
    debugPrint("/djcache => resetting caches.")
    Valanior_DJ.cached = {}
end
SLASH_DJWIPE = "/djwipe"
SlashCmdList["DJWIPE"] = function(msg)
    debugPrint("/djwipe => resetting caches.")
    _G.Valanior_DJ = {}
end

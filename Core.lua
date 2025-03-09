local debug = true
Valanior_DJ = Valanior_DJ or {}

local settings = Valanior_DJ
--------------------------------------------------------------------
-- INITIALIZATION ON ADDON LOAD
--------------------------------------------------------------------
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == ADDON_NAME then
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
                WARRIOR     = { "Plate", "Mail", "Leather", "Shields", "Miscellaneous" },
                DEATHKNIGHT = { "Plate", "Mail", "Leather", "Miscellaneous" },
                PALADIN     = { "Plate", "Mail", "Leather", "Cloth", "Shields", "Miscellaneous" },
                HUNTER      = { "Mail", "Leather", "Miscellaneous" },
                ROGUE       = { "Leather", "Miscellaneous" },
                PRIEST      = { "Cloth", "Miscellaneous" },
                MAGE        = { "Cloth", "Shields", "Miscellaneous" },
                WARLOCK     = { "Cloth", "Miscellaneous" },
                DRUID       = { "Leather", "Cloth", "Miscellaneous" },
                SHAMAN      = { "Mail", "Leather", "Cloth", "Shields", "Miscellaneous" },
            }
        end

        if not settings.allowedWeaponType then
            settings.allowedWeaponType = {
                WARRIOR     = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms" },
                DEATHKNIGHT = { "One-Handed Axes", "Two-Handed Axes", "One-Handed Maces", "Two-Handed Maces",
                    "One-Handed Swords", "Two-Handed Swords", "Polearms" },
                PALADIN     = { "One-Handed Maces", "One-Handed Swords", "Two-Handed Maces", "Two-Handed Swords",
                    "Daggers", "Fist Weapons", "Staves" },
                HUNTER      = { "Bows", "Guns", "Crossbows", "Daggers", "One-Handed Swords", "One-Handed Axes", "Fist Weapons" },
                ROGUE       = { "Daggers", "Fist Weapons", "One-Handed Swords", "One-Handed Axes" },
                PRIEST      = { "Daggers", "Staves", "Wands", "One-Handed Maces" },
                MAGE        = { "Daggers", "Staves", "Wands", "One-Handed Swords", "Two-Handed Swords" },
                WARLOCK     = { "Daggers", "Staves", "Wands", "One-Handed Swords" },
                DRUID       = { "Daggers", "Fist Weapons", "Staves", "One-Handed Maces" },
                SHAMAN      = { "One-Handed Axes", "One-Handed Maces", "Two-Handed Maces", "Staves", "Daggers", "Fist Weapons" },
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

        local key1, key2 = GetBindingKey("VALANIOR_DJ_TOGGLERUNE")
        if not key1 and not key2 then
            SetBinding("G", "VALANIOR_DJ_TOGGLERUNE")
            SaveBindings(GetCurrentBindingSet())
        end
    end
end)

debugPrint("Creation of Core.lua")

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
    debugPrint("PLAYER_LOGIN => DungeonJournalFrame loaded.")
end)

-- Slash command to toggle
SLASH_DJ1 = "/dj"
SlashCmdList["DJ"] = function(msg)
    debugPrint("Slash command /dj executed. DungeonJournalFrame =", DungeonJournalFrame)
    if DungeonJournalFrame then
        DungeonJournalFrame:Show()
        debugPrint("DungeonJournalFrame:Show() called")
    else
        debugPrint("DungeonJournalFrame is nil!")
    end
end

-- Slash command to recache
SLASH_DJRECACHE1 = "/djcache"
SlashCmdList["DJRECACHE"] = function(msg)
    debugPrint("/djcache => resetting caches.")
    Valanior_DJ.cached = {}
    _G.Valanior_DJ.hasCachedNPCs = false
    CacheDjDungeonsNPCs()
end

-- Example config slash (remove if unneeded)

debugPrint("Core.lua => Global variables set.")

--------------------------------------------------------------------
-- Caching NPCs for djDungeons
--------------------------------------------------------------------
--[[
    Caching Function:
    This function iterates over _G.Valanior.djDungeons.bosses and runs the caching command on each boss's NPCID.
    It uses GameTooltip:SetHyperlink to force the caching of unit data.
    The function is guarded by _G.Valanior_DJ.hasCachedNPCs so it runs only once.
--]]
local function CacheDjDungeonsNPCs()
    local djDungeons = _G.Valanior and _G.Valanior.djDungeons
    if not djDungeons then
        debugPrint("No djDungeons data found.")
        return
    end

    debugPrint("Caching NPCs... Found:", #djDungeons)

    for _, boss in ipairs(djDungeons) do
        debugPrint(" => boss.bosses", #boss.bosses)
        for _, v in ipairs(boss.bosses) do
            local tempModel = CreateFrame("PlayerModel", nil, UIParent)
            tempModel:SetSize(1, 1)                                          -- Tiny, hidden
            tempModel:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -1000, -1000) -- Off-screen
            tempModel:SetCreature(v.bossID)                                  -- Load model

            -- Clear and hide after a delay
            if not C_Timer then
                C_Timer = {}
                function C_Timer.After(delay, func)
                    local f = CreateFrame("Frame")
                    f.elapsed = 0
                    f:SetScript("OnUpdate", function(self, elapsed)
                        self.elapsed = self.elapsed + elapsed
                        if self.elapsed >= delay then
                            func()
                            self:SetScript("OnUpdate", nil)
                        end
                    end)
                end
            end
        end
    end
    debugPrint("NPC caching complete.")
end

-- Register an event so that the caching function is called once after PLAYER_LOGIN.
local cacheFrame = CreateFrame("Frame")
cacheFrame:RegisterEvent("PLAYER_LOGIN")
cacheFrame:SetScript("OnEvent", function(self, event, ...)
    CacheDjDungeonsNPCs()
end)

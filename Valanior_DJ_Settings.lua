local ADDON_NAME = ...
Valanior_DJ = Valanior_DJ or {}

local settings = Valanior_DJ or {}
--------------------------------------------------------------------
-- HELPERS
--------------------------------------------------------------------
function Valanior_DJ_ToggleRuneCollection()
    local anythingOpen = false
    local framesToCheck = {
        RuneCollection, -- your frame
    }
    for _, f in ipairs(framesToCheck) do
        if f and f:IsShown() then
            f:Hide()
            anythingOpen = true
        end
    end
    if not anythingOpen and RuneCollection then
        RuneCollection:Show()
    end
end

local function CopyTable(t)
    local copy = {}
    for i, v in ipairs(t) do
        table.insert(copy, v)
    end
    return copy
end

--------------------------------------------------------------------
-- HEADERS & KEYBINDINGS
--------------------------------------------------------------------
_G["BINDING_HEADER_VALANIOR_DJ"] = "Dungeon Journal (Valanior)"
_G["BINDING_NAME_VALANIOR_DJ_TOGGLERUNE"] = "Toggle RuneCollection"

--------------------------------------------------------------------
-- CONFIG PANEL SETUP (Stand-alone, not in Interface Options)
--------------------------------------------------------------------
local configPanel = CreateFrame("Frame", "Valanior_DJ_ConfigPanel", UIParent)
configPanel:SetSize(500, 400)
configPanel:SetPoint("CENTER")
configPanel:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 5 }
})
configPanel:SetBackdropColor(0, 0, 0, 1)
configPanel:EnableMouse(true)
configPanel:SetMovable(true)
configPanel:EnableKeyboard(true)
configPanel:SetScript("OnMouseDown", function(self) self:StartMoving() end)
configPanel:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing() end)
configPanel:Hide() -- Hidden by default

-- Title text
local titleText = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
titleText:SetPoint("TOP", configPanel, "TOP", 0, -20)
titleText:SetText("Dungeon Journal (Valanior) Options")

-- Close Button (upper-right corner)
local closeButton = CreateFrame("Button", nil, configPanel, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", configPanel, "TOPRIGHT", -5, -5)

-- "Show Dungeon Name" Option
local showDungeonNameLabel = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
showDungeonNameLabel:SetPoint("TOPLEFT", configPanel, "TOPLEFT", 20, -60)
showDungeonNameLabel:SetText("Show Dungeon Name: " .. (settings.showDungeonName and "Enabled" or "Disabled"))

local showDungeonNameCheckbox = CreateFrame("CheckButton", "Valanior_DJ_ShowDungeonName_CheckButton", configPanel,
    "InterfaceOptionsCheckButtonTemplate")
showDungeonNameCheckbox:SetPoint("LEFT", showDungeonNameLabel, "RIGHT", 10, 0)
showDungeonNameCheckbox:SetText("")
showDungeonNameCheckbox:SetChecked(settings.showDungeonName)
showDungeonNameCheckbox:SetScript("OnClick", function(self)
    settings.showDungeonName = self:GetChecked()
    local status = settings.showDungeonName and "Enabled" or "Disabled"
    showDungeonNameLabel:SetText("Show Dungeon Name: " .. status)
    print("Show Dungeon Name is now", status)
end)

-- Recache instructions and button (placed below the Show Dungeon Name row)
local recacheLabel = configPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
recacheLabel:SetPoint("TOPLEFT", showDungeonNameLabel, "BOTTOMLEFT", 0, -30)
recacheLabel:SetText("Re-cache Data: Press the button below to reset cached data.")

local recacheButton = CreateFrame("Button", "Valanior_DJ_RecacheButton", configPanel, "UIPanelButtonTemplate")
recacheButton:SetPoint("TOP", recacheLabel, "BOTTOM", 0, -10)
recacheButton:SetSize(140, 25)
recacheButton:SetText("Reset Cache")
recacheButton:SetScript("OnClick", function()
    settings.hasAlreadyCached = false
    settings.cached = {} -- clear the cached table
    print("Cache has been reset.")
end)


--------------------------------------------------------------------
-- TOGGLE CONFIG PANEL FUNCTION
--------------------------------------------------------------------
function Valanior_DJ_ToggleConfig()
    if Valanior_DJ_ConfigPanel:IsShown() then
        Valanior_DJ_ConfigPanel:Hide()
    else
        Valanior_DJ_ConfigPanel:Show()
    end
end

_G.Valanior_DJ_ToggleConfig = Valanior_DJ_ToggleConfig

SLASH_VDJ1 = "/djc"
SlashCmdList["DJC"] = function(msg)
    if _G.Valanior_DJ_ToggleConfig then
        _G.Valanior_DJ_ToggleConfig()
    end
end

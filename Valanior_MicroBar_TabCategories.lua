--[[
  TabSystem.lua
  A tab system for switching between RuneCollection and DungeonJournalFrame.
  Uses only Blizzard assets.
--]]

-- Helper function to safely create frames with a backdrop template if available.
local function SafeCreateFrame(frameType, frameName, parent)
    local template = (BackdropTemplateMixin and "BackdropTemplate") or nil
    return CreateFrame(frameType, frameName, parent, template)
end

local function CreateTabButton(parent, label, iconPath, onClickFunc)
    local container = SafeCreateFrame("Frame", nil, parent)
    container:SetSize(90, 30)
    if BackdropTemplateMixin then
        container:SetBackdrop({
            bgFile = nil,  -- No background fill, only a border.
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            edgeSize = 16, -- Bigger edge size for a thicker border.
        })
        container:SetBackdropBorderColor(1, 1, 1, 1)
    end

    local btn = SafeCreateFrame("Button", nil, container)
    btn:SetSize(90, 20)
    btn:SetPoint("CENTER", container, "CENTER")

    btn:SetNormalTexture("Interface\\characterAdvancement\\tab_not_active.blp")
    local normalTexture = btn:GetNormalTexture()
    normalTexture:SetTexCoord(0.0546875, 0.9375, 0.3671875, 0.578125)
    normalTexture:SetVertexColor(0.8, 0.9, 1)

    btn:SetHighlightTexture("Interface\\characterAdvancement\\tab_active.blp")
    local highlightTexture = btn:GetHighlightTexture()
    highlightTexture:SetTexCoord(0.0546875, 0.9375, 0.3671875, 0.578125)
    highlightTexture:SetVertexColor(1, 1, 1, 0.3)

    btn:SetPushedTexture("Interface\\characterAdvancement\\tab_active.blp")
    local pushedTexture = btn:GetPushedTexture()
    pushedTexture:SetTexCoord(0.0546875, 0.9375, 0.3671875, 0.578125)
    pushedTexture:SetVertexColor(1, 1, 1)

    local icon = btn:CreateTexture(nil, "OVERLAY")
    local defaultIconSize = 20
    if iconPath == "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\tempDungeonIcon.blp" then
        icon:SetSize(24, 20)
        icon.origWidth, icon.origHeight = 24, 20
        icon:SetTexCoord(0, 608 / 1024, 0, 721 / 1024)
        icon.texCoords = { 0, 608 / 1024, 0, 721 / 1024 }
    elseif iconPath == "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\tempRuneIcon.blp" then
        icon:SetSize(defaultIconSize, defaultIconSize)
        icon.origWidth, icon.origHeight = defaultIconSize, defaultIconSize
        icon:SetTexCoord(0, 612 / 1024, 0, 857 / 1024)
        icon.texCoords = { 0, 612 / 1024, 0, 857 / 1024 }
    else
        icon:SetSize(defaultIconSize, defaultIconSize)
        icon.origWidth, icon.origHeight = defaultIconSize, defaultIconSize
    end
    icon:SetPoint("LEFT", btn, "LEFT", 4, 0)
    icon:SetTexture(iconPath)
    btn.icon = icon

    local text = btn:CreateFontString(nil, "OVERLAY")
    text:SetFont("Fonts\\FRIZQT__.TTF", 14, "OUTLINE")
    text:SetPoint("CENTER", icon, "CENTER", 42, 2)
    text:SetJustifyH("CENTER")
    text:SetText(label)
    text:SetTextColor(1, 1, 1)
    btn.text = text

    btn:SetScript("OnEnter", function(self)
        if self.icon then
            self.icon:SetSize(self.icon.origWidth * 1.1, self.icon.origHeight * 1.1)
            self.icon:SetVertexColor(0.7, 0.7, 1)
            if self.icon.texCoords then
                self.icon:SetTexCoord(unpack(self.icon.texCoords))
            end
        end
        if self.text then
            self.text:SetTextColor(0.7, 0.7, 1)
        end
    end)
    btn:SetScript("OnLeave", function(self)
        if self.icon then
            self.icon:SetSize(self.icon.origWidth, self.icon.origHeight)
            self.icon:SetVertexColor(1, 1, 1)
            if self.icon.texCoords then
                self.icon:SetTexCoord(unpack(self.icon.texCoords))
            end
        end
        if self.text then
            self.text:SetTextColor(1, 1, 1)
        end
    end)

    btn:SetScript("OnClick", onClickFunc)
    container.button = btn -- Store reference to the inner button.
    return container
end

local function CreateTabBar(parent)
    local tabBar = SafeCreateFrame("Frame", nil, parent)
    if BackdropTemplateMixin then
        tabBar:SetBackdrop({
            bgFile = "Interface\\characterAdvancement\\background.blp",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = false,
            tileSize = 16,
            edgeSize = 32,
            insets = { left = 4, right = 4, top = 4, bottom = 4 }
        })
        tabBar:SetBackdropColor(1, 1, 1, 1)
        tabBar:SetBackdropBorderColor(0.7, 0.7, 0.7, 1)
    end
    tabBar:SetSize(160, 25)
    tabBar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", -2, -20)
    return tabBar
end

local function SwitchFrame(showFrame)
    if not showFrame then return end

    local currentFrame
    if RuneCollection and RuneCollection:IsShown() then
        currentFrame = RuneCollection
    elseif DungeonJournalFrame and DungeonJournalFrame:IsShown() then
        currentFrame = DungeonJournalFrame
    end

    if currentFrame == showFrame then
        if showFrame == RuneCollection then
            showFrame.TabBar.TabRune.button:GetNormalTexture():SetVertexColor(1, 1, 1)
            showFrame.TabBar.TabDJ.button:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5)
        elseif showFrame == DungeonJournalFrame then
            showFrame.TabBar.TabDJ.button:GetNormalTexture():SetVertexColor(1, 1, 1)
            showFrame.TabBar.TabRune.button:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5)
        end
        return
    end

    local point, relativeTo, relPoint, x, y = "CENTER", UIParent, "CENTER", 0, 0
    if currentFrame then
        local p1, rTo, rPoint, ox, oy = currentFrame:GetPoint(1)
        if p1 then
            point, relativeTo, relPoint, x, y = p1, rTo, rPoint, ox, oy
        end
    end

    if RuneCollection then RuneCollection:Hide() end
    if DungeonJournalFrame then DungeonJournalFrame:Hide() end

    showFrame:ClearAllPoints()
    showFrame:SetPoint(point, relativeTo, relPoint, x, y)
    showFrame:Show()

    if not showFrame.TabBar then
        showFrame.TabBar = CreateTabBar(showFrame)
        showFrame.TabBar.TabRune = CreateTabButton(
            showFrame.TabBar, "Rune", "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\tempRuneIcon.blp",
            function() SwitchFrame(RuneCollection) end
        )
        showFrame.TabBar.TabDJ = CreateTabButton(
            showFrame.TabBar, "Journal", "Interface\\Addons\\Valanior_DungeonJournal\\Assets\\tempDungeonIcon.blp",
            function() SwitchFrame(DungeonJournalFrame) end
        )
        showFrame.TabBar.TabRune:SetPoint("LEFT", showFrame.TabBar, "LEFT", 7, 0)
        showFrame.TabBar.TabDJ:SetPoint("LEFT", showFrame.TabBar.TabRune, "RIGHT", 5, 0)
    else
        showFrame.TabBar:SetParent(showFrame)
        showFrame.TabBar:ClearAllPoints()
        showFrame.TabBar:SetPoint("BOTTOMLEFT", showFrame, "BOTTOMLEFT", -2, -20)
        showFrame.TabBar:Show()
    end

    if showFrame == RuneCollection and showFrame.TabBar and showFrame.TabBar.TabRune and showFrame.TabBar.TabDJ then
        showFrame.TabBar.TabRune.button:GetNormalTexture():SetVertexColor(1, 1, 1)
        showFrame.TabBar.TabDJ.button:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5)
    elseif showFrame == DungeonJournalFrame and showFrame.TabBar and showFrame.TabBar.TabRune and showFrame.TabBar.TabDJ then
        showFrame.TabBar.TabDJ.button:GetNormalTexture():SetVertexColor(1, 1, 1)
        showFrame.TabBar.TabRune.button:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5)
    end
end

if RuneCollection then
    SwitchFrame(RuneCollection)
elseif DungeonJournalFrame then
    SwitchFrame(DungeonJournalFrame)
end

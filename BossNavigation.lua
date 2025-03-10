-- ##################################################################
-- # BOSS DISPLAY & NAVIGATION
-- ##################################################################
-- This module handles displaying a boss’s model, its associated story popup,
-- and provides navigation (left/right) between bosses in a dungeon.
--
-- Note: It assumes that some globals exist (e.g., dungeonDetailFrame, Valanior_DJ, debugPrint)
-- and that other modules (Utility.lua, Core.lua) have been loaded.

-- Create a hidden model frame for pre-loading models.
local preloadModelFrame = CreateFrame("PlayerModel", "PreloadModelFrame", UIParent)
preloadModelFrame:Hide()

-- List all boss IDs that you want to preload.
-- (You can iterate over your _G.Valanior.djDungeons table and collect the bossID's.)
local bossIDs = {}
for _, dungeon in ipairs(_G.Valanior.djDungeons) do
    for _, boss in ipairs(dungeon.bosses) do
        if boss.bossID then
            table.insert(bossIDs, boss.bossID)
        end
    end
end
--[[
doesnt actually work sadge
local preloadIndex = 1
local function PreloadNextBossModel()
    if preloadIndex <= #bossIDs then
        local currentBossID = bossIDs[preloadIndex]
        debugPrint("Preloading model for bossID:", currentBossID)
        preloadModelFrame:SetCreature(currentBossID)
        preloadIndex = preloadIndex + 1
        -- Delay next preload by 0.2 seconds.
        C_Timer.After(0.2, PreloadNextBossModel)
    else
        debugPrint("Finished preloading boss models.")
    end
end

-- Start the preloading process.
PreloadNextBossModel()
--]] --
local BOSS_TRANSFORMS = _G.BOSS_TRANSFORMS or {}

-------------------------------------------------------------------
-- Helper: ApplyBossTransforms
-- Called once the model is loaded to apply custom transforms.
-- NOTE: We pass in npcID here; still
-- uses bossID as the table key
-------------------------------------------------------------------
local function ApplyBossTransforms(frame, displayID)
    local transform = BOSS_TRANSFORMS[displayID]
    if transform then
        frame:SetFacing(transform.facing or 0)
        -- PlayerModel uses param order: (z, x, y)
        frame:SetPosition(transform.z or 0, transform.x or 0, transform.y or 0)
        frame:SetScale(transform.scale or 1)
    else
        frame:SetFacing(0)
        frame:SetPosition(0, 0, 0)
        frame:SetScale(1)
    end
end

-------------------------------------------------------------------
-- Helper: Setup Model Frame & Story Button
-- Changed to PlayerModel and uses display IDs from _G.NPC_DisplayID_Map
-------------------------------------------------------------------
local function SetupModelFrame(dungeon, bossData, bossKey, bossLeveled)
    -- Changed to "PlayerModel" here:
    modelFrame = modelFrame or CreateFrame("DressUpModel", "Val_modelFrame", dungeonDetailFrame)
    modelFrame:SetSize(200, 400)
    modelFrame:SetPoint("LEFT", dungeonDetailFrame, "CENTER", -290, -70)
    modelFrame:SetFrameStrata("MEDIUM")
    modelFrame:EnableMouse(true)
    modelFrame:Show()

    -- Create the Story Button if it doesn't exist
    if not modelFrame.storyButton then
        local btn = CreateFrame("Button", nil, modelFrame, "UIPanelButtonTemplate")
        btn:SetSize(25, 25)
        btn:SetNormalTexture("Interface\\Icons\\INV_Misc_Book_09")
        btn:SetPushedTexture("Interface\\Icons\\INV_Misc_Book_09")
        local nt = btn:GetNormalTexture()
        nt:SetTexCoord(0.08, 0.92, 0.08, 0.92)
        nt:SetAllPoints(btn)
        local pt = btn:GetPushedTexture()
        pt:SetTexCoord(0.06, 0.94, 0.06, 0.94)
        pt:SetAllPoints(btn)
        btn:SetPoint("BOTTOMRIGHT", modelFrame, "BOTTOMRIGHT", -13, 30)
        btn:Hide()
        btn:SetScript("OnClick", function()
            if modelFrame.storyPopup:IsShown() then
                modelFrame.storyPopup:Hide()
            else
                modelFrame.storyPopup:Show()
            end
        end)
        modelFrame.storyButton = btn
    end

    modelFrame:ClearModel()

    -- Attempt to get displayID from the global NPC_DisplayID_Map.
    if bossData.bossID then
        modelFrame:SetCreature(bossData.bossID)
        ApplyBossTransforms(modelFrame, displayID)
    else
    end

    -- Set neutral defaults before loading
    modelFrame:SetFacing(0)
    modelFrame:SetPosition(0, 0, 0)
    modelFrame:SetScale(1)

    -- Retrieve and set the saved click count for level-up
    modelFrame.levelUpClickCount = (Valanior_DJ.levelUpClickCount and Valanior_DJ.levelUpClickCount[bossKey]) or 0
    if bossLeveled then
        modelFrame.levelUpClickCount = 75
    end

    return modelFrame
end

-------------------------------------------------------------------
-- Helper: Setup the Story Popup
-------------------------------------------------------------------
local function SetupStoryPopup()
    if not modelFrame.storyPopup then
        local popup = CreateFrame("Frame", "ValaniorDJ_StoryPopup", UIParent)
        popup:SetSize(400, 200)
        popup:SetPoint("CENTER", UIParent, "CENTER")
        popup:SetFrameStrata("DIALOG")
        popup:Hide()
        tinsert(UISpecialFrames, popup:GetName())
        if popup.SetBackdrop then
            popup:SetBackdrop({
                bgFile = "Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Parchment-Horizontal",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 256,
                edgeSize = 16,
                insets = { left = 4, right = 4, top = 4, bottom = 4 }
            })
        end
        local closeBtn = CreateFrame("Button", nil, popup, "UIPanelCloseButton")
        closeBtn:SetPoint("TOPRIGHT", popup, "TOPRIGHT", -2, -2)
        closeBtn:SetScript("OnClick", function() popup:Hide() end)
        local fs = popup:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        fs:SetPoint("TOPLEFT", 10, -10)
        fs:SetPoint("RIGHT", -10, 0)
        fs:SetJustifyH("LEFT")
        fs:SetJustifyV("TOP")
        fs:SetSpacing(3)
        fs:SetText("")
        popup.closeBtn = closeBtn
        popup.text = fs
        modelFrame.storyPopup = popup
    end
    return modelFrame.storyPopup
end

-------------------------------------------------------------------
-- Helper: Setup Boss Name Label
-------------------------------------------------------------------
local function SetupBossNameLabel(bossData)
    if not bossNameFontString then
        bossNameFontString = dungeonDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    end
    bossNameFontString:ClearAllPoints()
    bossNameFontString:SetPoint("TOP", dungeonDetailFrame, "TOP", -180, -50)
    bossNameFontString:SetText(bossData.name or "Unknown Boss")
    return bossNameFontString
end

-------------------------------------------------------------------
-- Helper: Setup Spell Icons Container
-------------------------------------------------------------------
local function SetupSpellIcons()
    ClearSpellFrames()
    if dungeonDetailFrame.bossNav and dungeonDetailFrame.bossNav.spellContainer then
        local spellContainer = dungeonDetailFrame.bossNav.spellContainer
        spellContainer:ClearAllPoints()
        spellContainer:SetPoint("TOP", bossNameFontString, "BOTTOM", 0, -10)
        spellContainer:Show()
    end
end

-------------------------------------------------------------------
-- Helper: Setup Mouse Handlers for Level Up Logic
-------------------------------------------------------------------
local function SetupMouseHandlers(bossKey)
    modelFrame:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then
            self.isDragging = true
            self.dragStartX = GetCursorPosition()
            self.startFacing = self:GetFacing() or 0
        end
    end)

    modelFrame:SetScript("OnMouseUp", function(self, button)
        if button == "LeftButton" then
            local currentX = GetCursorPosition()
            local dragDist = math.abs(currentX - self.dragStartX)
            self.isDragging = false
            if dragDist < 5 then
                self:SetSequenceTime(119, 3)
            end

            if Valanior_DJ.leveledBoss[bossKey] then
                self.storyButton:Show()
            end

            self.levelUpClickCount = (Valanior_DJ.levelUpClickCount and Valanior_DJ.levelUpClickCount[bossKey]) or 0
            if not Valanior_DJ.leveledBoss[bossKey] then
                self.levelUpClickCount = self.levelUpClickCount + 1

                Valanior_DJ.levelUpClickCount[bossKey] = self.levelUpClickCount
                if self.levelUpClickCount >= 75 then
                    self:SetSequenceTime(148, 3)
                    Valanior_DJ.leveledBoss[bossKey] = true
                    if self.storyButton then
                        self.storyButton:Show()
                    end
                end
            end
        end
    end)

    modelFrame:SetScript("OnUpdate", function(self, elapsed)
        if self.isDragging then
            local currentX = GetCursorPosition()
            local diff = (currentX - self.dragStartX) / 200
            self:SetFacing(self.startFacing - diff)
        end
    end)
end

-------------------------------------------------------------------
-- Keep track of which dungeon/boss is active
-------------------------------------------------------------------
local activeDungeon
local activeBossIndex = 0

-------------------------------------------------------------------
-- Main function to display a boss in the dungeon detail view
-------------------------------------------------------------------
local function ShowBoss(dungeon)
    if not dungeon or not dungeon.bosses or #dungeon.bosses == 0 then
        return
    end

    dungeon.currentBossIndex = dungeon.currentBossIndex or 1
    local index = dungeon.currentBossIndex

    if activeDungeon == dungeon and activeBossIndex == index then
        return
    end

    activeDungeon = dungeon
    activeBossIndex = index

    local bossData = dungeon.bosses[index]
    if not bossData then
        return
    end


    Valanior_DJ.leveledBoss = Valanior_DJ.leveledBoss or {}
    Valanior_DJ.levelUpClickCount = Valanior_DJ.levelUpClickCount or {}

    local bossKey = bossData.bossID or (dungeon.name .. bossData.name)
    local bossLeveled = Valanior_DJ.leveledBoss[bossKey] or false

    SetupModelFrame(dungeon, bossData, bossKey, bossLeveled)
    SetupStoryPopup()
    SetupBossNameLabel(bossData)
    SetupSpellIcons()
    SetupMouseHandlers(bossKey)

    local popup = modelFrame.storyPopup
    popup:Hide()

    local story = bossData.story or ""
    popup.text:SetText(story)
    popup.text:SetWidth(popup:GetWidth() - 20)
    local textHeight = popup.text:GetStringHeight()
    local newHeight = textHeight + 30
    popup:SetHeight(newHeight < 200 and 200 or newHeight)

    if bossLeveled then
        modelFrame.storyButton:Show()
    else
        modelFrame.storyButton:Hide()
    end
end

-------------------------------------------------------------------
-- Creates the boss navigation frame (with left/right buttons)
-------------------------------------------------------------------
local function CreateBossNavigation(dungeonDetailFrame, dungeon)
    if not dungeon or not dungeon.bosses or #dungeon.bosses == 0 then
        return
    end

    if dungeonDetailFrame.bossNav then
        if dungeonDetailFrame.bossNav.dungeonName ~= dungeon.name then
            dungeonDetailFrame.bossNav:Hide()
            dungeonDetailFrame.bossNav = nil
        end
    end

    local bossNav = dungeonDetailFrame.bossNav
    if not bossNav then
        bossNav = CreateFrame("Frame", "DJ_BossNavFrame", dungeonDetailFrame)
        bossNav:SetAllPoints()

        dungeonDetailFrame.bossNav = bossNav
        bossNav.dungeonName = dungeon.name
        bossNav:SetScript("OnShow", function(self)
            if self.dungeonName ~= dungeon.name then
                self:Hide()
                CreateBossNavigation(dungeonDetailFrame, dungeon)
            end
        end)
    else
        for _, child in ipairs({ bossNav:GetChildren() }) do
            child:Hide()
            child:SetParent(nil)
        end
    end

    bossNav.dungeon = dungeon

    if not bossNav.bossNameFontString then
        bossNav.bossNameFontString = bossNav:CreateFontString("DJ_BossNameFontString", "OVERLAY", "GameFontNormalLarge")
    end
    bossNav.bossNameFontString:ClearAllPoints()
    bossNav.bossNameFontString:SetPoint("TOP", dungeonDetailFrame, "TOP", -180, -50)
    bossNav.bossNameFontString:SetText(" ")

    if not bossNav.spellContainer then
        bossNav.spellContainer = CreateFrame("Frame", "DJ_SpellContainer", dungeonDetailFrame)
        bossNav.spellContainer:SetSize(300, 30)
        bossNav.spellContainer:SetPoint("TOP", bossNav.bossNameFontString, "BOTTOM", 0, -10)
    else
        bossNav.spellContainer:ClearAllPoints()
        bossNav.spellContainer:SetPoint("TOP", bossNav.bossNameFontString, "BOTTOM", 0, -10)
    end
    bossNav.spellContainer:Show()

    if not bossNav.leftButton then
        bossNav.leftButton = CreateFrame("Button", "DJ_BossLeftButton", bossNav, "UIPanelButtonTemplate")
        bossNav.leftButton:SetSize(15, 15)
        bossNav.leftButton:SetText("<")
    end
    if not bossNav.rightButton then
        bossNav.rightButton = CreateFrame("Button", "DJ_BossRightButton", bossNav, "UIPanelButtonTemplate")
        bossNav.rightButton:SetSize(15, 15)
        bossNav.rightButton:SetText(">")
    end

    bossNav.leftButton:SetPoint("BOTTOMRIGHT", bossNav.bossNameFontString, "TOP", -10, 10)
    bossNav.rightButton:SetPoint("BOTTOMLEFT", bossNav.bossNameFontString, "TOP", 10, 10)

    bossNav:EnableMouse(true)
    dungeon.currentBossIndex = dungeon.currentBossIndex or 1

    local function showCurrentBoss()
        ShowBoss(dungeon)
    end

    bossNav.leftButton:SetScript("OnClick", function()
        dungeon.currentBossIndex = dungeon.currentBossIndex - 1
        if dungeon.currentBossIndex < 1 then
            dungeon.currentBossIndex = #dungeon.bosses
        end
        showCurrentBoss()
    end)

    bossNav.rightButton:SetScript("OnClick", function()
        dungeon.currentBossIndex = dungeon.currentBossIndex + 1
        if dungeon.currentBossIndex > #dungeon.bosses then
            dungeon.currentBossIndex = 1
        end
        showCurrentBoss()
    end)

    showCurrentBoss()
end

-------------------------------------------------------------------
-- Expose the main functions globally
-------------------------------------------------------------------
_G.ShowBoss = ShowBoss
_G.CreateBossNavigation = CreateBossNavigation

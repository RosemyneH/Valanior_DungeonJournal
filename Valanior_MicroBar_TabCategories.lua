--[[
  Tab System for switching between RuneCollection and DungeonJournalFrame.
  Both frames will have a tab bar at the bottom left with two tabs:
    - “Rune Collection” (with an icon, e.g. a rune icon)
    - “Dungeon Journal” (with an icon, e.g. a book icon)
  When switching, the new frame is repositioned to the same anchor point as the one being replaced.
--]]

local function CreateTabButton(parent, label, iconPath, onClickFunc)
    local btn = CreateFrame("Button", nil, parent)
    btn:SetSize(90, 25) -- adjust size as needed

    -- Normal (inactive) tab
    btn:SetNormalTexture("Interface\\PaperDollInfoFrame\\UI-Character-InactiveTab")
    btn:GetNormalTexture():SetTexCoord(0, 0.5, 0, 0.5)
    btn:GetNormalTexture():SetVertexColor(0.8, 0.9, 1) -- subtle bluish tint

    -- Highlight tab
    btn:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight")
    btn:GetHighlightTexture():SetTexCoord(0, 1, 0, 0.5)
    -- If you want to color the highlight:
    btn:GetHighlightTexture():SetVertexColor(1, 1, 1, 0.25)

    -- Pushed (active) tab
    btn:SetPushedTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
    btn:GetPushedTexture():SetTexCoord(0, 0.5, 0, 0.5)
    btn:GetPushedTexture():SetVertexColor(1, 1, 1)
    --------------------------------------------------------------------------------------

    -- Create an icon on the left
    local icon = btn:CreateTexture(nil, "ARTWORK")
    icon:SetSize(20, 20)
    icon:SetPoint("LEFT", btn, "LEFT", 4, 0)
    icon:SetTexture(iconPath)
    btn.icon = icon

    -- Create the label text to the right of the icon
    local text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    text:SetPoint("LEFT", icon, "RIGHT", 4, 0)
    text:SetText(label)
    btn.text = text

    btn:SetScript("OnClick", onClickFunc)

    return btn
end

-- Create a tab bar frame (to be re-parented to whichever frame is active)
local function CreateTabBar(parent)
    local tabBar = CreateFrame("Frame", nil, parent)
    tabBar:SetSize(200, 30) -- adjust as needed
    tabBar:SetPoint("BOTTOMLEFT", parent, "BOTTOMLEFT", 10, -50)
    return tabBar
end

-- Switch function: reads current position from the visible frame (if any)
-- Hides both frames, then positions and shows the requested one,
-- and re-parents (or creates) the tab bar on the new frame.
local function SwitchFrame(showFrame)
    if not showFrame then
        return
    end

    -- Determine which frame is currently visible (if any)
    local currentFrame
    if RuneCollection and RuneCollection:IsShown() then
        currentFrame = RuneCollection
    elseif DungeonJournalFrame and DungeonJournalFrame:IsShown() then
        currentFrame = DungeonJournalFrame
    end

    -- Save anchor from current visible frame (if any)
    local point, relativeTo, relPoint, x, y = "CENTER", UIParent, "CENTER", 0, 0
    if currentFrame then
        local p1, rTo, rPoint, ox, oy = currentFrame:GetPoint(1)
        if p1 then
            point, relativeTo, relPoint, x, y = p1, rTo, rPoint, ox, oy
        end
    end

    -- Hide both frames if they exist
    if RuneCollection then RuneCollection:Hide() end
    if DungeonJournalFrame then DungeonJournalFrame:Hide() end

    -- Show the requested frame
    showFrame:ClearAllPoints()
    showFrame:SetPoint(point, relativeTo, relPoint, x, y)
    showFrame:Show()

    -- (Re)Create tab bar if needed
    if not showFrame.TabBar then
        showFrame.TabBar = CreateTabBar(showFrame)

        showFrame.TabBar.TabRune = CreateTabButton(
            showFrame.TabBar, "Rune", "Interface\\Icons\\INV_Misc_Rune_01.blp",
            function() SwitchFrame(RuneCollection) end
        )
        showFrame.TabBar.TabDJ = CreateTabButton(
            showFrame.TabBar, "Journal", "Interface\\Icons\\INV_Misc_Book_01.blp",
            function() SwitchFrame(DungeonJournalFrame) end
        )

        showFrame.TabBar.TabRune:SetPoint("LEFT", showFrame.TabBar, "LEFT", 0, 0)
        showFrame.TabBar.TabDJ:SetPoint("LEFT", showFrame.TabBar.TabRune, "RIGHT", 10, 0)
    else
        -- Just re-parent the existing tab bar
        showFrame.TabBar:SetParent(showFrame)
        showFrame.TabBar:ClearAllPoints()
        showFrame.TabBar:SetPoint("BOTTOMLEFT", showFrame, "BOTTOMLEFT", 10, 10)
        showFrame.TabBar:Show()
    end

    -- Update tab appearances (nil-check to avoid errors)
    if showFrame == RuneCollection and showFrame.TabBar and showFrame.TabBar.TabRune and showFrame.TabBar.TabDJ then
        showFrame.TabBar.TabRune:GetNormalTexture():SetVertexColor(1, 1, 1)
        showFrame.TabBar.TabDJ:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5)
    elseif showFrame == DungeonJournalFrame and showFrame.TabBar and showFrame.TabBar.TabRune and showFrame.TabBar.TabDJ then
        showFrame.TabBar.TabDJ:GetNormalTexture():SetVertexColor(1, 1, 1)
        showFrame.TabBar.TabRune:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5)
    end
end

-- Example usage:
-- When your addon loads, you might want to default to one frame (e.g., RuneCollection).
if RuneCollection then
    SwitchFrame(RuneCollection)
else
    if DungeonJournalFrame then
        SwitchFrame(DungeonJournalFrame)
    end
end

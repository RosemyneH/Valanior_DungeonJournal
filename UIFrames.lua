-- ##################################################################
-- # UIFrames.lua
-- ##################################################################
local tempschedule = {}

local DungeonJournalFrame = CreateFrame("Frame", "DungeonJournalFrame", UIParent)
DungeonJournalFrame:SetSize(585, 430)
DungeonJournalFrame:SetPoint("CENTER")
DungeonJournalFrame:SetClampedToScreen(true)
DungeonJournalFrame:EnableMouse(true)
DungeonJournalFrame:SetMovable(true)

DungeonJournalFrame:RegisterForDrag("LeftButton", "RightButton")
DungeonJournalFrame:SetScript("OnDragStart", function(self, button)
    if button == "LeftButton" or button == "RightButton" then
        self:StartMoving()
    end
end)
DungeonJournalFrame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)

DungeonJournalFrame.BackgroundTexture = DungeonJournalFrame:CreateTexture(nil, "BACKGROUND")
DungeonJournalFrame.BackgroundTexture:SetTexture("Interface/Addons/Valanior_DungeonJournal/Assets/interface_base")
DungeonJournalFrame.BackgroundTexture:SetTexCoord(0, 0.751, 0, 0.589)
DungeonJournalFrame.BackgroundTexture:SetAllPoints(DungeonJournalFrame)
DungeonJournalFrame:Hide()

local mainCloseButton = CreateFrame("Button", nil, DungeonJournalFrame, "UIPanelCloseButton")
mainCloseButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", 4, -4)
mainCloseButton:SetSize(25, 25)

_G.itemButtonCache              = _G.itemButtonCache or {}
_G.lastBossNavDungeon           = _G.lastBossNavDungeon or nil
_G.currentDungeon               = _G.currentDungeon or nil

local dungeonData               = _G.Valanior and _G.Valanior.djDungeons or {}

Valanior_DJ.viewAllItems        = Valanior_DJ.viewAllItems or false
Valanior_DJ.currentItemPage     = Valanior_DJ.currentItemPage or 1
Valanior_DJ.currentVersionIndex = Valanior_DJ.currentVersionIndex or 1
Valanior_DJ.itemSearchQuery     = Valanior_DJ.itemSearchQuery or ""

DJ_Settings.filterType          = DJ_Settings.filterType or "All"
DJ_Settings.onlyEquipable       = DJ_Settings.onlyEquipable or false

local searchTooltip             = CreateFrame("GameTooltip", "DJ_ItemSearchTooltip", nil, "GameTooltipTemplate")
searchTooltip:SetOwner(UIParent, "ANCHOR_NONE")

local MAX_ITEMS_PER_PAGE = 16
local NUM_COLS           = 2
local displayedItems     = {}
local totalPages         = 1

local versionDropdown    = CreateFrame("Frame", "ValaniorDJ_VersionDropdown", DungeonJournalFrame,
    "UIDropDownMenuTemplate")
versionDropdown:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", 0, -30)
UIDropDownMenu_SetWidth(versionDropdown, 130)

local viewAllButton = CreateFrame("CheckButton", "ValaniorDJ_ViewAllCheckButton", DungeonJournalFrame,
    "UICheckButtonTemplate")
viewAllButton:SetSize(24, 24)
viewAllButton:SetPoint("TOPRIGHT", versionDropdown, "TOPLEFT", -85, 0)
viewAllButton:SetFrameStrata("DIALOG") -- ensures it's on top
viewAllButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)
viewAllButton:EnableMouse(true)
viewAllButton.text = viewAllButton:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
viewAllButton.text:SetPoint("LEFT", viewAllButton, "RIGHT", 0, 1)
viewAllButton.text:SetText("All Dungeons")
viewAllButton:SetChecked(Valanior_DJ.viewAllItems)

local toggleEquippableButton = CreateFrame("Button", nil, DungeonJournalFrame, "UIPanelButtonTemplate")
toggleEquippableButton:SetSize(90, 20)
toggleEquippableButton:SetPoint("BOTTOMRIGHT", DungeonJournalFrame, "BOTTOMRIGHT", -20, 20)
toggleEquippableButton:SetFrameStrata("DIALOG")
toggleEquippableButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)
toggleEquippableButton:SetText("Equip?")

local filterTypeButton = CreateFrame("Button", nil, DungeonJournalFrame)
filterTypeButton:SetSize(15, 15)
filterTypeButton:SetPoint("RIGHT", mainCloseButton, "LEFT", -35, 0)
filterTypeButton:SetFrameStrata("DIALOG")
filterTypeButton:SetFrameLevel(DungeonJournalFrame:GetFrameLevel() + 20)

local function HideDungeonInteriorUI()
    versionDropdown:Hide()
    viewAllButton:Hide()
    toggleEquippableButton:Hide()
    filterTypeButton:Hide()
end

local function ShowDungeonInteriorUI()
    versionDropdown:Show()
    viewAllButton:Show()
    toggleEquippableButton:Show()
    filterTypeButton:Show()
end

local previewFrame = CreateFrame("Frame", "DungeonJournalPreviewFrame", DungeonJournalFrame)
previewFrame:SetSize(585, 430)
previewFrame:SetPoint("TOP", DungeonJournalFrame, "TOP", 0, -10)
previewFrame:Show()

local titleText = previewFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
titleText:SetPoint("TOP", previewFrame, "TOP", 0, 0)
titleText:SetText("Adventurer's Journal")

local scrollFrame = CreateFrame("ScrollFrame", "DungeonGridScrollFrame", previewFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetSize(585, math.floor(430 * 0.82))
scrollFrame:SetPoint("TOP", titleText, "BOTTOM", 20, -38)

local scrollBar = _G[scrollFrame:GetName() .. "ScrollBar"]
if scrollBar then
    scrollBar:SetWidth(8)
    scrollBar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", -70, 0)
    scrollBar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", -70, 0)
    local thumb = _G[scrollFrame:GetName() .. "ScrollBarThumbTexture"]
    if thumb then
        thumb:SetTexture("Interface\\Buttons\\UI-ScrollBar-Knob")
        thumb:SetVertexColor(0.6, 0.6, 0.6)
    end
end

local gridContainer       = CreateFrame("Frame", "DungeonGridContainer", scrollFrame)
local numDungeonCols      = 3
local dungeonButtonWidth  = 180
local dungeonButtonHeight = 90
gridContainer:SetSize(numDungeonCols * dungeonButtonWidth, 1)
scrollFrame:SetScrollChild(gridContainer)

dungeonDetailFrame = CreateFrame("Frame", "DungeonDetailFrame", DungeonJournalFrame)
dungeonDetailFrame:SetSize(456, 336)
dungeonDetailFrame:SetPoint("TOP", DungeonJournalFrame, "TOP", 0, -10)
dungeonDetailFrame:Hide()

local dungeonTitleText = dungeonDetailFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
dungeonTitleText:SetPoint("TOP", dungeonDetailFrame, "TOP", 0, 0)

local dungeonDescScrollFrame = CreateFrame("ScrollFrame", "DungeonDescScrollFrame", dungeonDetailFrame,
    "UIPanelScrollFrameTemplate")
dungeonDescScrollFrame:SetSize(192, 240)
dungeonDescScrollFrame:SetPoint("TOPLEFT", dungeonDetailFrame, "TOPLEFT", 10, -40)
dungeonDescScrollFrame:EnableMouseWheel(true)
dungeonDescScrollFrame:SetScript("OnMouseWheel", function(self, delta)
    local cur = self:GetVerticalScroll()
    local new = cur - delta * 20
    if new < 0 then new = 0 end
    local maxScroll = self:GetVerticalScrollRange() or 0
    if new > maxScroll then new = maxScroll end
    self:SetVerticalScroll(new)
end)
local descScrollBar = _G["DungeonDescScrollFrameScrollBar"]
if descScrollBar then
    descScrollBar:Hide()
    descScrollBar.Show = function() end
end

local itemsListFrame = CreateFrame("Frame", "DungeonItemsListFrame", dungeonDetailFrame)
itemsListFrame:SetSize(400, 340)
itemsListFrame:SetPoint("TOPRIGHT", dungeonDetailFrame, "TOPRIGHT", 90, -60)

local itemsListContainer = CreateFrame("Frame", "ItemsListContainer", itemsListFrame)
itemsListContainer:SetSize(400, 340)
itemsListContainer:SetPoint("TOPLEFT", itemsListFrame, "TOPLEFT")

viewAllButton:SetScript("OnClick", function(self)
    Valanior_DJ.viewAllItems = self:GetChecked()
    Valanior_DJ.currentItemPage = 1
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
    end
end)

local function UpdateToggleEquippableButtonText()
    if DJ_Settings.onlyEquipable then
        toggleEquippableButton:SetText("Filter On")
    else
        toggleEquippableButton:SetText("All items")
    end
end

UpdateToggleEquippableButtonText()

toggleEquippableButton:SetScript("OnClick", function()
    DJ_Settings.onlyEquipable = not DJ_Settings.onlyEquipable
    UpdateToggleEquippableButtonText()
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
    end
end)

local filterTypeOptions = {
    { state = "All",     icon = "Interface\\Icons\\INV_Misc_QuestionMark" },
    { state = "Weapons", icon = "Interface\\Icons\\INV_Sword_04" },
    { state = "Armor",   icon = "Interface\\Icons\\INV_Chest_Leather_05" },
}
local currentFilterIndex = 1
for i, v in ipairs(filterTypeOptions) do
    if v.state == DJ_Settings.filterType then
        currentFilterIndex = i
        break
    end
end

local function UpdateFilterTypeButton()
    local opt = filterTypeOptions[currentFilterIndex]
    filterTypeButton:SetNormalTexture(opt.icon)
    local tex = filterTypeButton:GetNormalTexture()
    if tex then
        tex:SetTexCoord(0, 1, 0, 1)
        tex:SetSize(15, 15)
    end
    filterTypeButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")

    DJ_Settings.filterType = opt.state

    if DJ_Settings.filterType == "Weapons" or DJ_Settings.filterType == "Armor" then
        DJ_Settings.onlyEquipable = true
    else
        DJ_Settings.onlyEquipable = false
    end

    UpdateToggleEquippableButtonText()
end

UpdateFilterTypeButton()

filterTypeButton:SetScript("OnClick", function()
    currentFilterIndex = currentFilterIndex + 1
    if currentFilterIndex > #filterTypeOptions then
        currentFilterIndex = 1
    end

    UpdateFilterTypeButton()
    Valanior_DJ.currentItemPage = 1

    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
    end
end)

local function DungeonVersion_OnSelect(self)
    local newIndex = self.value
    Valanior_DJ.currentVersionIndex = newIndex
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon, newIndex)
    end
end

local function ToggleAll(list, boolMap)
    local allOn = true
    for _, val in ipairs(list) do
        if not boolMap[val] then
            allOn = false
            break
        end
    end
    for _, val in ipairs(list) do
        boolMap[val] = not allOn
    end
end

local function UpdateFilterDropdownSummary()
    local filterIcon = DJ_Settings.filterType or "All"
    local summaryText
    if filterIcon == "All" then
        summaryText = "Showing All Items"
    elseif filterIcon == "Weapons" then
        local cClass = GetCurrentClass()
        local allowed = (Valanior_DJ.allowedWeaponType and Valanior_DJ.allowedWeaponType[cClass]) or {}
        summaryText = "Showing " .. #allowed .. " Weapons"
    elseif filterIcon == "Armor" then
        local allowedSlots = Valanior_DJ.allowedArmorSlots or {}
        local countOn = 0
        for _, slot in ipairs(_G.armorSlotList or {}) do
            if allowedSlots[slot] then
                countOn = countOn + 1
            end
        end
        summaryText = "Showing " .. countOn .. " Slots"
    end
    UIDropDownMenu_SetText(versionDropdown, summaryText)
end

local function VersionDropdown_Initialize(self, level, menuList)
    if not level then return end
    local cClass = GetCurrentClass()

    if level == 1 then
        local info = UIDropDownMenu_CreateInfo()
        info.text = "Dungeon Versions"
        info.notCheckable = true
        info.hasArrow = 1
        info.menuList = "VERSIONS"
        UIDropDownMenu_AddButton(info, level)

        info = UIDropDownMenu_CreateInfo()
        info.text = "Armor Slots"
        info.notCheckable = true
        info.hasArrow = 1
        info.menuList = "ARMOR_SLOTS"
        UIDropDownMenu_AddButton(info, level)

        info = UIDropDownMenu_CreateInfo()
        info.text = "Armor Types"
        info.notCheckable = true
        info.hasArrow = 1
        info.menuList = "ARMOR_TYPES"
        UIDropDownMenu_AddButton(info, level)

        info = UIDropDownMenu_CreateInfo()
        info.text = "Weapon Types"
        info.notCheckable = true
        info.hasArrow = 1
        info.menuList = "WEAPON_TYPES"
        UIDropDownMenu_AddButton(info, level)

        UpdateFilterDropdownSummary()
    elseif level == 2 then
        if menuList == "VERSIONS" then
            local d = _G.currentDungeon
            if not d or not d.versions or #d.versions == 0 then
                local info = UIDropDownMenu_CreateInfo()
                info.isTitle = true
                info.notCheckable = true
                info.text = "No Versions Available"
                UIDropDownMenu_AddButton(info, level)
            else
                for idx, verData in ipairs(d.versions) do
                    local info = UIDropDownMenu_CreateInfo()
                    info.text = verData.name or ("Version " .. idx)
                    info.value = idx
                    info.notCheckable = false
                    info.checked = (idx == Valanior_DJ.currentVersionIndex)
                    info.func = DungeonVersion_OnSelect
                    UIDropDownMenu_AddButton(info, level)
                end
            end
        elseif menuList == "ARMOR_SLOTS" then
            local info = UIDropDownMenu_CreateInfo()
            info.text = "Toggle All Slots"
            info.notCheckable = true
            info.func = function()
                local as = _G.armorSlotList or {}
                local allowed = Valanior_DJ.allowedArmorSlots or {}
                ToggleAll(as, allowed)
                DJ_Settings.onlyEquipable = true
                if _G.currentDungeon then
                    LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
                end
                UpdateFilterDropdownSummary()
            end
            UIDropDownMenu_AddButton(info, level)

            for _, slot in ipairs(_G.armorSlotList or {}) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = slot
                info.notCheckable = false
                info.keepShownOnClick = true
                info.checked = (Valanior_DJ.allowedArmorSlots and Valanior_DJ.allowedArmorSlots[slot]) or false
                info.func = function()
                    Valanior_DJ.allowedArmorSlots = Valanior_DJ.allowedArmorSlots or {}
                    Valanior_DJ.allowedArmorSlots[slot] = not Valanior_DJ.allowedArmorSlots[slot]
                    DJ_Settings.onlyEquipable = true
                    if _G.currentDungeon then
                        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
                    end
                    UpdateFilterDropdownSummary()
                end
                local ic = _G.slotIcons and _G.slotIcons[slot]
                if ic then info.icon = ic end
                UIDropDownMenu_AddButton(info, level)
            end
        elseif menuList == "ARMOR_TYPES" then
            local info = UIDropDownMenu_CreateInfo()
            info.text = "Toggle All Armor Types"
            info.notCheckable = true
            info.func = function()
                local union = _G.GetAllArmorTypes() or {}
                Valanior_DJ.allowedArmorType = Valanior_DJ.allowedArmorType or {}
                Valanior_DJ.allowedArmorType[cClass] = Valanior_DJ.allowedArmorType[cClass] or {}
                local boolMap = {}
                for _, v in ipairs(Valanior_DJ.allowedArmorType[cClass]) do
                    boolMap[v] = true
                end
                ToggleAll(union, boolMap)
                local newArr = {}
                for _, v in ipairs(union) do
                    if boolMap[v] then
                        table.insert(newArr, v)
                    end
                end
                Valanior_DJ.allowedArmorType[cClass] = newArr
                DJ_Settings.onlyEquipable = true
                if _G.currentDungeon then
                    LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
                end
                UpdateFilterDropdownSummary()
            end
            UIDropDownMenu_AddButton(info, level)

            local allowed = (Valanior_DJ.allowedArmorType and Valanior_DJ.allowedArmorType[cClass]) or {}
            for _, armorType in ipairs(_G.GetAllArmorTypes() or {}) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = armorType
                info.notCheckable = false
                info.keepShownOnClick = true
                info.checked = _G.IsInList(allowed, armorType)
                info.func = function()
                    local found = false
                    for i, vv in ipairs(allowed) do
                        if vv == armorType then
                            found = true
                            table.remove(allowed, i)
                            break
                        end
                    end
                    if not found then
                        table.insert(allowed, armorType)
                    end
                    Valanior_DJ.allowedArmorType[cClass] = allowed
                    DJ_Settings.onlyEquipable = true
                    if _G.currentDungeon then
                        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
                    end
                    UpdateFilterDropdownSummary()
                end
                info.icon = "Interface\\Icons\\INV_Armor_" .. armorType
                UIDropDownMenu_AddButton(info, level)
            end
        elseif menuList == "WEAPON_TYPES" then
            local info = UIDropDownMenu_CreateInfo()
            info.text = "Toggle All Weapon Types"
            info.notCheckable = true
            info.func = function()
                local union = _G.weaponTypeList or {}
                Valanior_DJ.allowedWeaponType = Valanior_DJ.allowedWeaponType or {}
                Valanior_DJ.allowedWeaponType[cClass] = Valanior_DJ.allowedWeaponType[cClass] or {}
                local boolMap = {}
                for _, v in ipairs(Valanior_DJ.allowedWeaponType[cClass]) do
                    boolMap[v] = true
                end
                ToggleAll(union, boolMap)
                local newArr = {}
                for _, v in ipairs(union) do
                    if boolMap[v] then
                        table.insert(newArr, v)
                    end
                end
                Valanior_DJ.allowedWeaponType[cClass] = newArr
                DJ_Settings.onlyEquipable = true
                if _G.currentDungeon then
                    LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
                end
                UpdateFilterDropdownSummary()
            end
            UIDropDownMenu_AddButton(info, level)

            local allowed = (Valanior_DJ.allowedWeaponType and Valanior_DJ.allowedWeaponType[cClass]) or {}
            for _, wType in ipairs(_G.weaponTypeList or {}) do
                local info = UIDropDownMenu_CreateInfo()
                info.text = wType
                info.notCheckable = false
                info.keepShownOnClick = true
                info.checked = _G.IsInList(allowed, wType)
                info.func = function()
                    local found = false
                    for i, vv in ipairs(allowed) do
                        if vv == wType then
                            found = true
                            table.remove(allowed, i)
                            break
                        end
                    end
                    if not found then
                        table.insert(allowed, wType)
                    end
                    Valanior_DJ.allowedWeaponType[cClass] = allowed
                    DJ_Settings.onlyEquipable = true
                    if _G.currentDungeon then
                        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
                    end
                    UpdateFilterDropdownSummary()
                end
                local ic = _G.weaponIcons and _G.weaponIcons[wType]
                if ic then info.icon = ic end
                UIDropDownMenu_AddButton(info, level)
            end
        end
    end
end

UIDropDownMenu_Initialize(versionDropdown, VersionDropdown_Initialize)

local pageNavigationFrame = CreateFrame("Frame", "DJ_ItemPageNavFrame", itemsListFrame)
pageNavigationFrame:SetSize(400, 25)
pageNavigationFrame:SetPoint("BOTTOM", itemsListFrame, "BOTTOM", 0, 0)

local itemSearchBox = CreateFrame("EditBox", "DJ_ItemSearchBox", pageNavigationFrame, "InputBoxTemplate")
itemSearchBox:SetSize(120, 20)
itemSearchBox:SetAutoFocus(false)
itemSearchBox:SetPoint("LEFT", pageNavigationFrame, "LEFT", 0, 0)
itemSearchBox:SetText(Valanior_DJ.itemSearchQuery or "")
itemSearchBox:SetScript("OnTextChanged", function(self, userInput)
    Valanior_DJ.itemSearchQuery = self:GetText() or ""
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
    end
end)

local prevPageButton = CreateFrame("Button", nil, pageNavigationFrame, "UIPanelButtonTemplate")
prevPageButton:SetSize(25, 20)
prevPageButton:SetText("<")
prevPageButton:SetPoint("LEFT", itemSearchBox, "RIGHT", 5, 0)

local pageText = pageNavigationFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
pageText:SetPoint("LEFT", prevPageButton, "RIGHT", 5, 0)
pageText:SetText("Page 1/1")

local nextPageButton = CreateFrame("Button", nil, pageNavigationFrame, "UIPanelButtonTemplate")
nextPageButton:SetSize(25, 20)
nextPageButton:SetText(">")
nextPageButton:SetPoint("LEFT", pageText, "RIGHT", 5, 0)

local function UpdatePage(offset)
    Valanior_DJ.currentItemPage = Valanior_DJ.currentItemPage + offset
    if Valanior_DJ.currentItemPage < 1 then
        Valanior_DJ.currentItemPage = totalPages
    elseif Valanior_DJ.currentItemPage > totalPages then
        Valanior_DJ.currentItemPage = 1
    end
    if _G.currentDungeon then
        LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
    end
end

prevPageButton:SetScript("OnClick", function() UpdatePage(-1) end)
nextPageButton:SetScript("OnClick", function() UpdatePage(1) end)

itemsListFrame:EnableMouseWheel(true)
itemsListFrame:SetScript("OnMouseWheel", function(self, delta)
    if delta > 0 then
        UpdatePage(-1)
    else
        UpdatePage(1)
    end
end)

local backButton = CreateFrame("Button", nil, DungeonJournalFrame)
backButton:SetSize(20, 20)
backButton:SetPoint("TOPRIGHT", DungeonJournalFrame, "TOPRIGHT", -12, -9)

local backFont = backButton:CreateFontString(nil, "OVERLAY", "GameFontNormal")
backFont:SetText("<  ")
backFont:SetPoint("CENTER", backButton, "CENTER", 0, 3)

local backTex = backButton:CreateTexture(nil, "BACKGROUND")
backTex:SetAllPoints(backButton)
backTex:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
backTex:SetBlendMode("ADD")

local backHighlightTexture = backButton:CreateTexture(nil, "HIGHLIGHT")
backHighlightTexture:SetAllPoints(backButton)
backHighlightTexture:SetTexture("Interface\\Buttons\\UI-Panel-Button-Highlight")
backHighlightTexture:SetBlendMode("ADD")

backButton:SetScript("OnClick", function()
    DungeonJournalFrame.BackgroundTexture:SetTexture("Interface/Addons/Valanior_DungeonJournal/Assets/interface_base")
    if dungeonDetailFrame:IsShown() then
        dungeonDetailFrame:Hide()
        previewFrame:Show()
        HideDungeonInteriorUI()
        viewAllButton:Enable()
    elseif previewFrame:IsShown() then
        if RuneCollection then RuneCollection:Show() end
        DungeonJournalFrame:Hide()
    end
end)

local function AcquireItemButton(dIndex, iIndex)
    _G.itemButtonCache[dIndex] = _G.itemButtonCache[dIndex] or {}
    if _G.itemButtonCache[dIndex][iIndex] then
        return _G.itemButtonCache[dIndex][iIndex]
    end

    local btn = CreateFrame("Button", nil, itemsListContainer)
    btn:SetSize(180, 40)

    local iconTex = btn:CreateTexture(nil, "ARTWORK")
    iconTex:SetSize(30, 30)
    iconTex:SetPoint("LEFT", btn, "LEFT", 2, 5)
    btn.iconTex = iconTex

    local itemText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    itemText:SetPoint("TOPLEFT", iconTex, "TOPRIGHT", 4, 0)
    itemText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    itemText:SetJustifyH("LEFT")
    btn.itemText = itemText

    local dropLocationText = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    dropLocationText:SetPoint("TOPLEFT", itemText, "BOTTOMLEFT", 0, -2)
    dropLocationText:SetPoint("RIGHT", btn, "RIGHT", -2, 0)
    dropLocationText:SetJustifyH("LEFT")
    btn.dropLocationText = dropLocationText

    local favIcon = btn:CreateTexture(nil, "OVERLAY")
    favIcon:SetSize(24, 24)
    favIcon:SetPoint("TOPLEFT", iconTex, "TOPLEFT", -8, 8)
    favIcon:SetTexture("Interface\\icons\\ui_jailerstower_defense")
    favIcon:Hide()
    btn.favoriteIcon = favIcon

    btn:RegisterForClicks("LeftButtonUp")
    btn:SetScript("OnEnter", function(self)
        if self.itemLink then
            GameTooltip:SetOwner(dungeonDetailFrame, "ANCHOR_NONE")
            GameTooltip:SetHyperlink(self.itemLink)
            GameTooltip:SetPoint("TOPLEFT", dungeonDetailFrame, "TOPRIGHT", 65, 5)
            GameTooltip:Show()
        end
    end)
    btn:SetScript("OnLeave", function() GameTooltip:Hide() end)

    btn:SetScript("OnClick", function(self, button)
        if button == "LeftButton" and IsShiftKeyDown() and self.itemLink then
            ChatEdit_InsertLink(self.itemLink)
        elseif button == "LeftButton" and IsControlKeyDown() then
            local base = self.baseItemID
            if Valanior_DJ.favorites[base] then
                Valanior_DJ.favorites[base] = nil
            else
                Valanior_DJ.favorites[base] = true
            end
            if _G.currentDungeon then
                LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
            end
        end
    end)

    _G.itemButtonCache[dIndex][iIndex] = btn
    return btn
end

local function HideAllItemButtons()
    for dIdx, itemTbl in pairs(_G.itemButtonCache) do
        for _, btn in pairs(itemTbl) do
            btn:Hide()
        end
    end
end

local function BatchCacheDungeonItems(dungeon, version, startIndex)
    startIndex = startIndex or 1
    local items = dungeon.items
    if not items then
        return
    end

    local batchSize = 101
    local endIndex = math.min(startIndex + batchSize - 1, #items)

    for i = startIndex, endIndex do
        if version then
            CacheItem(items[i] + version.modifier)
        else
            CacheItem(items[i])
        end
    end

    if endIndex < #items then
        C_Timer.After(1.0, function()
            BatchCacheDungeonItems(dungeon, version, endIndex + 1)
        end)
    else
        if _G.currentDungeon and _G.currentDungeon.name == dungeon.name and type(LoadDungeonDetail) == "function" then
            LoadDungeonDetail(_G.currentDungeon, Valanior_DJ.currentVersionIndex)
        else
        end
    end
end



local function HandleUncachedItem(adjItemID, dungeon, versionData)
    if Valanior_DJ.viewAllItems then
        local delay = 1.0
        for _, d in ipairs(_G.dungeonData or {}) do
            if d.name and not tempschedule[d.name] then
                tempschedule[d.name] = true
                C_Timer.After(delay, function()
                    BatchCacheDungeonItems(d, versionData, 1)
                end)
                delay = delay + 1.0
            end
        end
    else
        if dungeon and dungeon.name and not tempschedule[dungeon.name] then
            tempschedule[dungeon.name] = true
            C_Timer.After(1.0, function()
                BatchCacheDungeonItems(dungeon, versionData, 1)
            end)
        end
    end
end




local function GetVersionModifierForDungeon(dungeon, versionIndex)
    if dungeon.versions and dungeon.versions[versionIndex] then
        return dungeon.versions[versionIndex].modifier or 0
    elseif dungeon.versions and #dungeon.versions > 0 then
        return dungeon.versions[#dungeon.versions].modifier or 0
    end
    return 0
end

local function FindDungeonByName(dName)
    for _, d in ipairs(dungeonData or {}) do
        if d.name == dName then
            return d
        end
    end
end

local function PassesFilterIcon(iType, iSubType, eLoc, filterIcon)
    if filterIcon == "All" then
        return true
    end

    if filterIcon == "Weapons" then
        if iType == "Weapon" then return true end
        if iType == "Armor" and (iSubType == "Shields" or eLoc == "INVTYPE_HOLDABLE") then
            return true
        end
    end

    if filterIcon == "Armor" then
        if iType == "Armor" and iSubType ~= "Shields" and eLoc ~= "INVTYPE_HOLDABLE" then
            return true
        end
        return false
    end

    return true
end


function PrepareItemsToShow(dungeon, versionIndex)
    local itemsToShow = {}
    local filterIcon = DJ_Settings.filterType or "All"

    if Valanior_DJ.viewAllItems then
        for _, d in ipairs(_G.dungeonData or {}) do
            local mod = GetVersionModifierForDungeon(d, versionIndex)
            if d.items then
                for i, baseID in ipairs(d.items) do
                    table.insert(itemsToShow, {
                        baseID      = baseID,
                        idx         = i,
                        isSpecial   = false,
                        versionMod  = mod,
                        dungeonName = d.name
                    })
                end
            end
            if d.specialItems and not DJ_Settings.onlyEquipable then
                for i, spID in ipairs(d.specialItems) do
                    table.insert(itemsToShow, {
                        baseID      = spID,
                        idx         = -1,
                        isSpecial   = true,
                        drop        = d.specialDrop and d.specialDrop[i],
                        dungeonName = d.name
                    })
                end
            end
        end
    else
        local mod = 0
        if dungeon.versions and dungeon.versions[versionIndex] then
            mod = dungeon.versions[versionIndex].modifier or 0
        end
        if dungeon.items then
            for i, baseID in ipairs(dungeon.items) do
                table.insert(itemsToShow, {
                    baseID      = baseID,
                    idx         = i,
                    isSpecial   = false,
                    versionMod  = mod,
                    dungeonName = dungeon.name
                })
            end
        end
        if dungeon.specialItems and not DJ_Settings.onlyEquipable then
            for i, spID in ipairs(dungeon.specialItems) do
                table.insert(itemsToShow, {
                    baseID      = spID,
                    idx         = -1,
                    isSpecial   = true,
                    drop        = dungeon.specialDrop and dungeon.specialDrop[i],
                    dungeonName = dungeon.name
                })
            end
        end
    end

    table.sort(itemsToShow, function(a, b)
        if a.isSpecial ~= b.isSpecial then
            return a.isSpecial and not b.isSpecial
        end
        local favA = Valanior_DJ.favorites[a.baseID] and 1 or 0
        local favB = Valanior_DJ.favorites[b.baseID] and 1 or 0
        if favA ~= favB then
            return favA > favB
        end
        return a.idx < b.idx
    end)

    if not DJ_Settings.onlyEquipable then
        return itemsToShow
    end

    local final = {}
    for _, info in ipairs(itemsToShow) do
        local adjID = info.isSpecial and info.baseID or (info.baseID + (info.versionMod or 0))

        if IsItemEquippableByClass(adjID, filterIcon) then
            local iName, _, _, _, _, iType, iSubType, _, eLoc = GetItemInfo(adjID)
            if not iName then
                iType, iSubType, eLoc = "", "", ""
            end
            if PassesFilterIcon(iType, iSubType, eLoc, filterIcon) then
                table.insert(final, info)
            end
        end
    end

    return final
end

local function DisplayItemsList(dungeon, versionIndex, itemsToShow)
    wipe(displayedItems)
    local query = (Valanior_DJ.itemSearchQuery or ""):lower()
    if query ~= "" then
        local filtered = {}
        for _, info in ipairs(itemsToShow) do
            local adjID = info.isSpecial and info.baseID or (info.baseID + (info.versionMod or 0))
            local iName = GetItemInfo(adjID) or ""
            local nameLower = iName:lower()
            searchTooltip:ClearLines()
            searchTooltip:SetHyperlink("item:" .. adjID)
            local tooltipText = ""
            for lineIndex = 1, searchTooltip:NumLines() do
                local leftLine  = _G["DJ_ItemSearchTooltipTextLeft" .. lineIndex]
                local rightLine = _G["DJ_ItemSearchTooltipTextRight" .. lineIndex]
                local lt        = leftLine and leftLine:GetText() or ""
                local rt        = rightLine and rightLine:GetText() or ""
                tooltipText     = tooltipText .. lt:lower() .. "\n" .. rt:lower() .. "\n"
            end
            if nameLower:find(query, 1, true) or tooltipText:find(query, 1, true) then
                table.insert(filtered, info)
            end
        end
        itemsToShow = filtered
    end

    for _, v in ipairs(itemsToShow) do
        table.insert(displayedItems, v)
    end

    totalPages = math.ceil(#displayedItems / MAX_ITEMS_PER_PAGE)
    if totalPages < 1 then
        totalPages = 1
    end
    if Valanior_DJ.currentItemPage > totalPages then
        Valanior_DJ.currentItemPage = totalPages
    end
    pageText:SetText(("Page %d/%d"):format(Valanior_DJ.currentItemPage, totalPages))

    HideAllItemButtons()
    if #displayedItems == 0 then
        local noItemsLabel = AcquireItemButton(dungeon.index or 9999, 99999)
        noItemsLabel:ClearAllPoints()
        noItemsLabel:SetPoint("TOPLEFT", itemsListContainer, "TOPLEFT", 5, -5)
        noItemsLabel.iconTex:SetTexture("")
        noItemsLabel.itemText:SetText(
            DJ_Settings.onlyEquipable and "No equippable items available" or "No items available"
        )
        noItemsLabel.dropLocationText:SetText("")
        noItemsLabel.favoriteIcon:Hide()
        noItemsLabel:Show()
        itemsListContainer:SetHeight(40)
        return
    end

    local startIndex = (Valanior_DJ.currentItemPage - 1) * MAX_ITEMS_PER_PAGE + 1
    local endIndex   = math.min(startIndex + MAX_ITEMS_PER_PAGE - 1, #displayedItems)
    local shownItems = 0

    for idx = startIndex, endIndex do
        local info = displayedItems[idx]
        shownItems = shownItems + 1
        local adjID = info.isSpecial and info.baseID or (info.baseID + (info.versionMod or 0))
        local iName, iLink, iQuality, _, _, iType, iSubType, _, eLoc, iIcon = GetItemInfo(adjID)
        if not iName then
            HandleUncachedItem(adjID, dungeon, dungeon.versions and dungeon.versions[versionIndex])
            iName = tostring(adjID)
            iLink = "item:" .. adjID
        end
        local color = ITEM_QUALITY_COLORS[iQuality or 1] or ITEM_QUALITY_COLORS[1]

        local btn = AcquireItemButton(dungeon.index or 9999, idx)
        btn.iconTex:SetTexture(iIcon or "Interface\\Icons\\INV_Misc_QuestionMark")
        btn.itemText:SetText(color.hex .. iName .. "|r")
        btn.itemID     = adjID
        btn.itemLink   = iLink
        btn.baseItemID = info.baseID

        if Valanior_DJ.favorites[info.baseID] then
            btn.favoriteIcon:Show()
        else
            btn.favoriteIcon:Hide()
        end

        if info.isSpecial and info.drop then
            btn.dropLocationText:SetText(info.drop)
        else
            local actualDungeon = dungeon
            if Valanior_DJ.viewAllItems then
                actualDungeon = FindDungeonByName(info.dungeonName)
            end
            if actualDungeon and info.idx > 0 and actualDungeon.droplocation then
                local loc = actualDungeon.droplocation[info.idx]
                btn.dropLocationText:SetText(loc or "")
            else
                btn.dropLocationText:SetText("")
            end
        end

        local col = (shownItems - 1) % NUM_COLS
        local row = math.floor((shownItems - 1) / NUM_COLS)
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", itemsListContainer, "TOPLEFT", col * 185, -row * 40)
        btn:Show()
    end

    local displayedCount = endIndex - startIndex + 1
    local rowCount       = math.ceil(displayedCount / NUM_COLS)
    itemsListContainer:SetHeight(rowCount * 40 + 10)
end

function LoadDungeonDetail(dungeon, versionIndex)
    if not dungeon then return end
    if not versionIndex then
        versionIndex = Valanior_DJ.currentVersionIndex or 1
    end
    Valanior_DJ.currentVersionIndex = versionIndex

    local currentTime = GetTime()
    if Valanior_DJ.viewAllItems then
        local forceRecache = false
        if not Valanior_DJ.lastRecacheTime or (currentTime - Valanior_DJ.lastRecacheTime) > 5 then
            forceRecache = true
        end
        if Valanior_DJ.lastVersionCached ~= versionIndex then
            forceRecache = true
        end
        if forceRecache then
            for _, d in ipairs(_G.dungeonData or {}) do
                if d.name then
                    Valanior_DJ.recacheScheduled[d.name] = nil
                    local versionData = (d.versions and d.versions[versionIndex]) or nil
                    if PreCacheDungeonVersion then
                        PreCacheDungeonVersion(d, versionData, true)
                    end
                end
            end
            Valanior_DJ.lastRecacheTime = currentTime
            Valanior_DJ.lastVersionCached = versionIndex
        end
    else
        if dungeon.name then
            Valanior_DJ.recacheScheduled[dungeon.name] = nil
        end
        local versionData = (dungeon.versions and dungeon.versions[versionIndex]) or nil
        if PreCacheDungeonVersion then
            PreCacheDungeonVersion(dungeon, versionData, true)
        end
    end

    if ShowBoss then
        ShowBoss(dungeon)
    end
    HideAllItemButtons()
    _G.currentDungeon = dungeon
    DungeonJournalFrame.BackgroundTexture:SetTexture("Interface/AddOns/Valanior_DungeonJournal/Assets/interface_open")
    previewFrame:Hide()
    dungeonDetailFrame:Show()
    ShowDungeonInteriorUI()

    local titleTextStr
    if dungeon.versions and dungeon.versions[versionIndex] then
        titleTextStr = (dungeon.name or "??") .. " - " .. (dungeon.versions[versionIndex].name or "")
    else
        titleTextStr = dungeon.name or "Unknown Dungeon"
    end
    dungeonTitleText:SetText(titleTextStr)

    local items = PrepareItemsToShow(dungeon, versionIndex)
    DisplayItemsList(dungeon, versionIndex, items)

    if _G.lastBossNavDungeon ~= dungeon and CreateBossNavigation then
        CreateBossNavigation(dungeonDetailFrame, dungeon)
        _G.lastBossNavDungeon = dungeon
    end
end

local dungeonSearchBox = CreateFrame("EditBox", "DJ_SearchEditBox", previewFrame, "InputBoxTemplate")
dungeonSearchBox:SetSize(150, 20)
dungeonSearchBox:SetPoint("CENTER", previewFrame, "CENTER", 0, 185)
dungeonSearchBox:SetAutoFocus(false)

local dungeonButtons = {}
dungeonSearchBox:SetScript("OnTextChanged", function(self, userInput)
    local query = self:GetText():lower()
    local filtered = {}
    for _, btn in ipairs(dungeonButtons) do
        local dName = (btn.dungeon.name or ""):lower()
        if query == "" or dName:find(query, 1, true) then
            btn:Show()
            table.insert(filtered, btn)
        else
            btn:Hide()
        end
    end
    for index, btn in ipairs(filtered) do
        local col = (index - 1) % numDungeonCols
        local row = math.floor((index - 1) / numDungeonCols)
        local xOff = col * dungeonButtonWidth
        local yOff = -row * dungeonButtonHeight
        btn:ClearAllPoints()
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOff, yOff)
    end
end)

function UpdateDungeonNames()
    for _, btn in ipairs(dungeonButtons) do
        if btn and btn.btnText and btn.dungeon then
            local newText = (Valanior_DJ.showDungeonName and btn.dungeon.name or "")
            btn.btnText:SetText(newText)
        end
    end
end

do
    local count = #dungeonData
    if count > 0 then
        local rows = math.ceil(count / numDungeonCols)
        gridContainer:SetHeight(rows * dungeonButtonHeight)
    end

    for i, d in ipairs(dungeonData) do
        d.index = i
        local btn = CreateFrame("Button", nil, gridContainer)
        btn:SetSize(dungeonButtonWidth, dungeonButtonHeight)
        btn:SetNormalTexture("")
        btn:SetPushedTexture("")
        btn:SetHighlightTexture("")

        local tex = btn:CreateTexture(nil, "BACKGROUND")
        tex:SetAllPoints(btn)
        tex:SetTexture(d.icon)
        tex:SetTexCoord(0, 0.6, 0, 0.6)
        btn.tex = tex

        local btnText = btn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        btnText:SetPoint("BOTTOM", btn, "BOTTOM", 0, 2)
        btnText:SetText(d.name)
        btn.btnText = btnText

        btn.dungeon = d
        local col = (i - 1) % numDungeonCols
        local row = math.floor((i - 1) / numDungeonCols)
        local xOffset = col * dungeonButtonWidth
        local yOffset = -row * dungeonButtonHeight
        btn:SetPoint("TOPLEFT", gridContainer, "TOPLEFT", xOffset, yOffset)

        btn:SetScript("OnClick", function()
            if PreCacheDungeonVersion then
                PreCacheDungeonVersion(d)
            end
            viewAllButton:SetChecked(false)
            Valanior_DJ.viewAllItems = false
            LoadDungeonDetail(d, Valanior_DJ.currentVersionIndex)
        end)

        btn:SetScript("OnEnter", function(self)
            if PreCacheDungeonVersion then
                local versionIndex = Valanior_DJ.currentVersionIndex or 1
                local versionData = (d.versions and d.versions[versionIndex]) or nil
                PreCacheDungeonVersion(d, versionData)
            end
            self.tex:SetVertexColor(0.7, 0.7, 0.7)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOM", 0, -5)
            GameTooltip:SetText(d.name)
            GameTooltip:Show()
        end)

        btn:SetScript("OnLeave", function(self)
            self.tex:SetVertexColor(1, 1, 1)
            GameTooltip:Hide()
        end)

        table.insert(dungeonButtons, btn)
    end
end

HideDungeonInteriorUI()
previewFrame:Show()

_G.DungeonJournalFrame = DungeonJournalFrame
_G.LoadDungeonDetail   = LoadDungeonDetail
_G.UpdateDungeonNames  = UpdateDungeonNames

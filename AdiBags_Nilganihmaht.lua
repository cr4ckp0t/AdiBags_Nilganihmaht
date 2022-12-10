-------------------------------------------------------------------------------
-- AdiBags - Nilganihmaht By Crackpot (US, Illidan)
-------------------------------------------------------------------------------
local addonName, addon = ...
local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")

local L = addon.L

local tonumber = _G["tonumber"]

local handFilter = AdiBags:RegisterFilter("Nilganihmaht", 98, "ABEvent-1.0")
handFilter.uiName = L["Nilganihmaht"]
handFilter.uiDesc = L["Filter for Nilganihmaht items."]

function handFilter:OnInitialize()
    self.items = {
        -- From: https://ptr.wowhead.com/item=186713/nilganihmaht-control-ring#comments:id=5206377

        [186603] = true, -- Nilganihmaht's Stone Ring
        [186605] = true, -- Nilganihmaht's Runed Band
        [186608] = true, -- Nilganihmaht's Gold Band
        [186607] = true, -- Nilganihmaht's Silver Ring
        [186606] = true, -- Nilganihmaht's Signet Ring
        [182326] = true, -- Dominion Etching: Pain
        [182327] = true, -- Dominion Etching: Loss
        [182328] = true, -- Dominion Etching: Grief
        [182329] = true, -- Dominion's Calling
        [186727] = true, -- Seal Breaker's Key
        [186600] = true,
        [186601] = true,
        [186602] = true,
        [186604] = true,
        [186713] = true -- Nilganihmaht Control Ring
    }
end

function handFilter:Update()
    self:SendMessage("AdiBags_FiltersChanged")
end

function handFilter:OnEnable()
    AdiBags:UpdateFilters()
end

function handFilter:OnDisable()
    AdiBags:UpdateFilters()
end

function handFilter:Filter(slotData)
    if self.items[tonumber(slotData.itemId)] then
        return L["Nilganihmaht"]
    end
end

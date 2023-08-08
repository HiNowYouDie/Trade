local Inventory = {}
Inventory.__index = Inventory

local Trade = require(script.Trade)

Inventory.Inventory = {}

function Inventory.new(plr)
    local self = setmetatable({},Inventory)
    self.Player = plr
    self.Contents = {
        Currency = {
            Money = 5000,
            Gems = 20
        },
        Items = {
            Pets = {
                Bear = 5,
                Cat = 2,
                Dog = 0,
            },
        },  
    }
    self.Trade = Trade.new(self.Contents)

    Inventory.Inventory[plr] = self

    return self
end

function CheckItem(t : table, Items)
    for i,v in pairs(t) do
        if typeof(v) == "table" then
            CheckItem(v,Items)
        end
        if Items[i] and Items[i] >= v then
            continue
        else
            return false
        end
    end
    return true
end

function Inventory:Trade(OtherInventory,Items)
    -- last check if the other players has the Items they want to trade
    local result  = CheckItem(OtherInventory,Items)
    if not result then return false end



end






return Inventory
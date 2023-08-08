local Trade = {}
Trade.__index = Trade

function Trade.new(contents)
    self = setmetatable({},Trade)

    self.TradingItems = {}
    self.CanTrade = true
    self.Contents = contents

    return self
end

function CheckItem(t : table, Item)
    for i,v in pairs(t) do
        if typeof(v) == "table" then
            CheckItem(v,Items)
        end
        if v[Item] and Items[i] >= v then
            continue
        else
            return false
        end
    end
    return true
end

function Trade:AddItem(Item)
    local result CheckItem(self.Contents,Item)
    if result then 
        self.TradingItems[]
    end
end

function Trade:Cancel()
    self.TradingItems = {}
    self.CanTrade = true
end

return Trade
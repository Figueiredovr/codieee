--[[
    João Victor Oliveira Couto
    https://csacademy.com/contest/archive/task/shoe-pairs/
--]]

local N = io.read("*line")
local shoes = {L = {}, R = {}}
local otherFoot = {L = "R", R = "L"}
local amountOfPairs = 0
local shoe  = ""
local number = 0
local foot = ""
for index = 1, tonumber(N) do
    shoe = io.read("*line")
    number = shoe:match("%d+")
    foot = shoe:match("%a")
    if not shoes[foot][number] then shoes[foot][number] = 0 end
    shoes[foot][number] = shoes[foot][number] + 1
    if shoes[otherFoot[foot]][number] and shoes[otherFoot[foot]][number] > 0 then shoes[otherFoot[foot]][number] = shoes[otherFoot[foot]][number] - 1; shoes[foot][number] = shoes[foot][number] -1; amountOfPairs = amountOfPairs + 1 end
end
print(amountOfPairs)

--[[
    João Victor Oliveira Couto
    https://csacademy.com/ieeextreme-practice/task/e610aba28810ebcf2d3998692269b5a0/
    Only pass in 20% test cases
--]]

local minimum = 1
local health = 1
local i = 1; j = 1
local grid = {}
local r = io.read("*number")
local c = io.read("*number")
for line = 1, r do
    grid[line] = {}
    for column = 1, c do
        grid[line][column] = io.read("*number")
    end
end
local temporary = {0, 0}
while i < r or j < c do
    temporary[1] = i < r and grid[i + 1][j] or -2000
    temporary[2] = j < c and grid[i][j + 1] or -2000
    local maximum = math.max(temporary[1], temporary[2])
    if maximum == temporary[1] then i = i + 1 else j = j + 1 end
    local newHealth = health + maximum --error is here, I think
    if newHealth <= 0 then
        local newMinimum = minimum + math.abs(math.abs(health - 1) - math.abs(maximum))
        health = (health - minimum) + maximum + newMinimum
        minimum = newMinimum
    else
        health = newHealth
    end
end
print(minimum)

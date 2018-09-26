--[[
    João Victor Oliveira Couto
    https://csacademy.com/ieeextreme-practice/task/8761fb7efefcf1d890df1d8d91cae241/
--]]

local n = io.read("*number")
local line = io.read()
local s = ""
local h = 0
local heights = {}
local crew = {} --key = height, value = {name => position}
for counter = 1, n do
    line = io.read()
    splited = line:gmatch("%S+")
    s = splited(); h = splited()
    if not crew[h] then
        table.insert(heights, h)
        crew[h] = {}
    end
    table.insert(crew[h], s)
end
table.sort(heights)
local counter = 0
local minimum = 1; local maximum = 0
for _, height in pairs(heights) do
    table.sort(crew[height])
    for _, name in pairs(crew[height]) do
        io.write(name .. " ")
        counter = counter + 1
    end
    maximum = counter
    print(minimum .. " " .. maximum)
    minimum = maximum + 1
end

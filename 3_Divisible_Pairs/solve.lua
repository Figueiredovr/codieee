--[[
	João Victor Oliveira Couto
	https://csacademy.com/contest/interview-archive/task/3-divisible-pairs/
--]]
local N = io.read("*number")
local numbers = {0, 0, 0, 0, 0}
local number = 0
for count = 1, N do
    number = io.read("*number")
    if number then
        numbers[math.floor(number % 3)] = (numbers[math.floor(number % 3)] or 0) + 1
    end
end
local totalPairs = ((numbers[0] or 0) - 1) * (numbers[0] or 0) / 2 + (numbers[1] or 0) * (numbers[2] or 0)
print(totalPairs)

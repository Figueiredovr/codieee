--[[
    João Victor Oliveira Couto
    https://csacademy.com/ieeextreme-practice/task/09f92a575cc006d4a6a7f525f370ec30/
--]]

local t = io.read("*number")
local values = {1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584}
values[-1] = 0
values[0] = 1
for index = 1, t do
    m = io.read("*number")
    m = m % 60
    if m > #values then
        for count = #values + 1, m do
            values[count] = values[count - 1] + values[count - 2]
        end
    end
    print(values[m] % 10)
end

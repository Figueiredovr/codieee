--[[
    João Victor Oliveira Couto --Not complete
    https://csacademy.com/ieeextreme-practice/task/979a09a0cd8c4e98dd0a690f39a55bd2/
--]]

t = io.read("*number")
for counter = 1, t do
    n = io.read("*number")
    m = io.read("*number")
    local reach = {}
    local origin = 0
    local isLoop = false
    for secondCounter = 1, m do
        origin = io.read("*number")
        if not reach[origin] then reach[origin] = {} end
        local nextVertex = io.read("*number")
        if not reach[nextVertex] then reach[nextVertex] = {} end
        reach[origin][nextVertex] = true
        for key, _ in pairs(reach[origin]) do
            reach[nextVertex][key] = true
        end
        if reach[nextVertex][origin] then
            isLoop = true
        end
    end
    print(isLoop and "1" or "0")
end

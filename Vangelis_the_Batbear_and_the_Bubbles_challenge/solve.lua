--[[
    João Victor Oliveira Couto
    https://csacademy.com/ieeextreme-practice/task/979a09a0cd8c4e98dd0a690f39a55bd2/
    For God, somebody help me!
--]]

function visite(vertex, from, isVisited)
    isVisited[from] = true
    if vertex[from] then
        for key, _ in pairs(vertex[from]) do
            if isVisited[key] then
                return true
            elseif visite(vertex, key, isVisited) then
                return true
            end
        end
    end
    return false
end

local t = io.read("*number")
for counter = 1, t do
    n = io.read("*number")
    m = io.read("*number")
    local reach = {}
    local origin = 0
    local nextVertex = 0
    for secondCounter = 1, m do
        origin = io.read("*number")
        nextVertex = io.read("*number")
        if not reach[origin] then reach[origin] = {} end
        reach[origin][nextVertex] = true
    end
    print(visite(reach, 0, {}) and 1 or 0)
end

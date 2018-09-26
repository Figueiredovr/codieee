--[[
    João Victor Oliveira Couto --have a time limit exceeded
    https://csacademy.com/contest/archive/task/pokemon-evolution/
--]]

local N = io.read("*number")
local M = io.read("*number")
local X = io.read("*number")
local Y = io.read("*number")
local evolved = 0
while N > 0 do
    local evolving = math.floor(M / X)
    evolved = evolved + (evolving > N and N or evolving)
    N = N - evolving
    M = M % X
    if M < X then
        N = N - 1
        M = M + Y
    end
end
print(evolved)


local function VimNew()
    local sum = 0
    for i = 1, 2999999, 1 do
        sum = sum + i
    end

    return sum
end

VimNew()

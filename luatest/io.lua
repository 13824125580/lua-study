local function readAll(filePath)
    local f = assert(io.open(filePath, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

local function bytesToHexStr(filePath)
    local content = readAll(filePath)
    local result = ""
    local len = string.len(content)
    for i = 1, len do
        local charcode = tonumber(string.byte(content, i, i));
        local hexstr = string.format("%02X", charcode);
        result = result .. hexstr
    end

    return result
end

print(bytesToHexStr("./hello.lua"))

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    for filename in popen('dir "'..directory..'" /b'):lines() do
    	if string.find(filename, ".lua") ~= nil then
	        t[i] = filename
	        i = i + 1
    	end
    end
    return t
end

local luaFolderDir = debug.GetR1Path() .. "\\..\\scripts\\"
local allFileNames = scandir(luaFolderDir)


for _,fileName in pairs(allFileNames) do 
	ui.SysMsg("Reloading: " .. fileName);
	dofile(luaFolderDir .. fileName);
end

ui.SysMsg("All Lua Files Refreshed")

return { 
    init = function ()
        _G["MyCharacter"] = dofile("..\\core\\MyCharacter.lua")
        _G["MyTarget"] = dofile("..\\core\\MyTarget.lua")
        _G["UserInterface"] = dofile("..\\core\\UserInterface.lua")
        _G["Map"] = dofile("..\\core\\Map.lua")
        _G["Utils"] = dofile("..\\core\\Utils.lua")
        _G["GameEvents"] = dofile("..\\core\\GameEvents.lua")
        --_G["Game = dofile("..\\core\\Game.lua")
    end
}
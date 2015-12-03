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
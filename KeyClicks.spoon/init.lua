local volume=0.8
KeyClicks={}
KeyClicks.name="KeyClicks"
KeyClicks.version=1.0
KeyClicks.author="pitermach"
local tts=hs.speech.new()
local ax = require("hs.axuielement")
package.cpath=package.cpath ..";" .. hs.spoons.resourcePath("").. "?.so"
local luautf8=require("lua-utf8")
local sounds={}
local function isInTextField()
    local systemElement = ax.systemWideElement()
    local element = systemElement:attributeValue("AXFocusedUIElement")
    if element ~= nil then
        local role = element:attributeValue("AXRole")
        if role == "AXTextField" or role == "AXTextArea" then
            return true
        end --is a text field
    end --element isn't nil
    return false
end --function


local function processKey(event)
    local char=event:getCharacters()
    if isInTextField() and event:getFlags():contain({"cmd"})==false then
        
        --tts:speak(event:getCharacters() .. " " .. role)
        --print(event:getCharacters())
        if luautf8.match(char, "%l")~=nil then --lowercase character
            sounds.lower:stop():play()
        elseif luautf8.match(char, "%u")~=nil then --uppercase character
            sounds.upper:stop():play()
        elseif event:getKeyCode() == hs.keycodes.map["return"] then --backspace
            sounds.enter:stop():play()
        elseif luautf8.match(char, "%s")~=nil then --whitespace
            sounds.space:stop():play()
        elseif luautf8.match(char, "%p")~=nil or luautf8.match(char, "%d")~=nil then
            sounds.other:stop():play()
        elseif event:getKeyCode() == hs.keycodes.map.delete or event:getKeyCode() == hs.keycodes.map.forwarddelete then --backspace
            sounds.delete:stop():play()
        end --character check
        
    end --is a text field
    
    
    
end --function

local keyTap=hs.eventtap.new({hs.eventtap.event.types.keyDown}, processKey)




function KeyClicks.init()
    sounds.lower=hs.sound.getByFile(hs.spoons.resourcePath("sounds/" .. "lower.wav"))
    sounds.upper=hs.sound.getByFile(hs.spoons.resourcePath("sounds/" .. "upper.wav"))
    sounds.space=hs.sound.getByFile(hs.spoons.resourcePath("sounds/" .. "space.wav"))
    sounds.enter=hs.sound.getByFile(hs.spoons.resourcePath("sounds/" .. "enter.wav"))
    sounds.delete=hs.sound.getByFile(hs.spoons.resourcePath("sounds/" .. "delete.wav"))
    sounds.other=hs.sound.getByFile(hs.spoons.resourcePath("sounds/" .. "other.wav"))
end
function KeyClicks.start()
    keyTap:start()
    KeyClicks.setVolume(volume)
end
function KeyClicks.stop()
    keyTap:stop()
end
function KeyClicks.setVolume(volume)

    for key, i in pairs(sounds) do
        i:volume(volume)
    end
end

return KeyClicks

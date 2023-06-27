screen = Vector2 (guiGetScreenSize ());
resolution = Vector2 (1920, 1080);

scale = math.min(math.max(screen.y / 1080, 0.70), 2); 

function getScreenStartPositionFromBox (width, height, offsetX, offsetY, startIndicationX, startIndicationY)
    local screenX,screenY = guiGetScreenSize();
    local startX, startY = offsetX, offsetY

    if startIndicationX == "right" then
        startX = screenX - (width + offsetX)
    end

    if startIndicationY == "bottom" then
        startY = screenY - (height + offsetY)
    end
    return startX, startY
end

local events = { };

_addEventHandler = addEventHandler
function addEventHandler(...)
    local args = {...}
    if args[1] == 'onClientRender' and type(args[3]) == 'function' then
        events[args[3]] = true
    end
    return _addEventHandler(...)
end

_removeEventHandler = removeEventHandler
function removeEventHandler(...)
    local args = {...}
    if args[1] == 'onClientRender' and type(args[3]) == 'function' then
        events[args[3]] = nil
    end
    return _removeEventHandler(...)
end

function isEventHandler(func)
    return events[func] or false
end

function string.change (s, t)
    if not s or type (s) ~= 'string' then
        return error ('Bad argument #1 got \''..type (s)..'\'.');
    end
    
    for w in s:gmatch ('${(%w+)}') do
        s = s:gsub ('${'..w..'}', tostring ((t and t[w]) or 'undefined'));
    end
    
    return s;
end
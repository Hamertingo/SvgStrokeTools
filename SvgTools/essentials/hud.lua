-- Definindo as coordenadas iniciais da tela a partir de uma caixa delimitadora
local posX, posY = getScreenStartPositionFromBox(89 * scale, 221 * scale, -50 * scale, 400 * scale, 'right', 'bottom')

-- Criando uma tabela de objetos SVGCache
local strokes = {
    [1] = SVGCache:new(100, 100, 'circle', {255, 0, 0}, false, 0.8, 2), -- Criação de um círculo vermelho
    [2] = SVGCache:new(100, 100, 'polygon', {255, 255, 255}, true, 0.9, 2), -- Criação de um polygon branco
    [3] = SVGCache:new(100, 100, 'rect', {255, 255, 255}, true, 0.6, 2), -- Criação de um retangulo branco
}

-- Adicionando um manipulador de eventos para renderização
addEventHandler('onClientRender', root, function()
    -- Renderizando o SVG Strokes
    strokes[1]:update(posX - (670 * scale), posY + (40 * scale), 255, getElementHealth(localPlayer))
    strokes[2]:update(posX - (750 * scale), posY + (55 * 1 * scale), 255)
    strokes[3]:update(posX - (550 * scale), posY + (40 * 1 * scale), 255)
end)

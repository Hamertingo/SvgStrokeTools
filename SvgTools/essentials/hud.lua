-- Definindo as coordenadas iniciais da tela a partir de uma caixa delimitadora
local posX, posY = getScreenStartPositionFromBox(89 * scale, 221 * scale, -50 * scale, 400 * scale, 'right', 'bottom')

-- Criando uma tabela de objetos SVGCache
local strokes = {
    [1] = SVGCache:new(57, 56, 'circle', {255, 0, 0}, false, 0.2, 2), -- Criação de um círculo vermelho
    [2] = SVGCache:new(57, 56, 'circle', {255, 255, 255}, false, 0.2, 2) -- Criação de um círculo branco
}

-- Adicionando um manipulador de eventos para renderização
addEventHandler('onClientRender', root, function()
    -- Atualizando o primeiro objeto SVGCache para representar a saúde do jogador
    strokes[1]:update(posX - (50 * scale), posY + (40 * scale), 255, (getElementHealth(localPlayer) or 0))
    -- Atualizando o segundo objeto SVGCache para representar a armadura do jogador
    strokes[2]:update(posX - (50 * scale), posY + (40 * 3 * scale), 255, (getPedArmor(localPlayer) or 0))
end)

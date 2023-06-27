## Svg Tools

O Svg Tools é uma biblioteca em Lua que permite a criação e animação de gráficos SVG. Ele fornece uma maneira simples de criar e manipular elementos SVG, especialmente útil para animações de traços de linha (stroke).

### Como usar

1. Baixe o arquivo `svg_cache.lua` deste repositório.
2. Crie instâncias de `Svg Tools` com os parâmetros desejados, como largura, altura, tipo de gráfico, cor, etc.
3. Use o método `update` para desenhar e atualizar o gráfico SVG em um contexto gráfico.

Exemplo de uso:

Cria um novo SVGCache:

```lua
-- Argumentos: w, h, type, color, animate, animationSpeed, stroke
local cache = SVGCache:new(100, 100, 'circle', {255, 255, 255}, true, 0.2, 1)

function draw()
    -- Renderizar o SVG
    cache:update(10, 10, 255)
end
```

Criar Varios SVGS Juntos:

```lua
-- Argumentos: w, h, type, color, animate, animationSpeed, stroke
local cache = {
    [1] = SVGCache:new(100, 100, 'circle', {255, 255, 255}, true, 0.2, 1),
    [2] = SVGCache:new(100, 100, 'rect', {255, 255, 255}, false, 0.2, 1),
    [3] = SVGCache:new(100, 100, 'polygon', {255, 255, 255}, true, 0.2, 1),
}

function draw()
    -- Renderizar o SVG
    for i,v in ipairs(cache) do
        v:update(10, 10, 255)
    end
end
```

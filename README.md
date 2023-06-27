## SVG Cache

O SVG Cache é uma biblioteca em Lua que permite a criação e animação de gráficos SVG. Ele fornece uma maneira simples de criar e manipular elementos SVG, especialmente útil para animações de traços de linha (stroke).

### Como usar

1. Baixe o arquivo `svg_cache.lua` deste repositório.
2. Crie instâncias de `SVGCache` com os parâmetros desejados, como largura, altura, tipo de gráfico, cor, etc.
3. Use o método `update` para desenhar e atualizar o gráfico SVG em um contexto gráfico.

Exemplo de uso:

```lua
-- Cria um novo SVGCache
local cache = SVGCache:new(100, 100, 'circle', {255, 255, 255}, true, 0.2, 1)

function draw()
    -- Atualiza e desenha o gráfico SVG
    cache:update(10, 10, 255)
end```

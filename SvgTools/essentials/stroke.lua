SVGCache = { };

SVGCache.__mode = 'k';
SVGCache.__index = SVGCache;

function SVGCache:new(w, h, type, color, animate, animationSpeed, stroke)
    assert(w and h, "É necessário fornecer a largura e a altura para a criação de SVG.")
    assert(type == 'circle' or type == 'rect' or type == 'polygon', "Tipo inválido fornecido para SVG. Opções válidas são 'circle', 'rect' ou 'polygon'.")

    local data = {}
    setmetatable(data, SVGCache)

    data.stroke = stroke
    data.w = w
    data.h = h

    local svgCircle = string.change([[<svg width='${width}' height='${height}' xmlns="http://www.w3.org/2000/svg"> <circle cx="30" cy="30" r="25" stroke="white" stroke-width="${strokewidth}" fill="none" stroke-dasharray="157" stroke-dashoffset="0"/></svg>]], {['width'] = w, ['height'] = h, ['strokewidth'] = stroke})
    local svgPolygon = string.change([[<svg width='${width}' height='${height}'> <polygon fill='none' stroke='#FFFFFF' stroke-width='${strokewidth}' points='16,1 32,32 1,32 16,1' stroke-dasharray='157' stroke-dashoffset='0' /></svg>   ]], {['width'] = w, ['height'] = h, ['strokewidth'] = stroke})
    local svgRect = string.change([[<svg width="${width}" height="${height}" xmlns="http://www.w3.org/2000/svg"><rect x="10" y="10" width="40" height="40" stroke="white" stroke-width="${strokewidth}" fill="none" stroke-dasharray="160" stroke-dashoffset="0"/></svg>]], {['width'] = w, ['height'] = h, ['strokewidth'] = stroke})

    local svg = nil
    data.dashArray = 157
    if type == 'circle' then
        svg = svgCircle
    elseif type == 'rect' then
        svg = svgRect
    elseif type == 'polygon' then
        svg = svgPolygon
        data.dashArray = 160
    end

    data.svg = svgCreate(w, h, svg)
    assert(data.svg, "Falha ao criar o objeto SVG.")

    data.xml = nil
    data.elementSVG = nil
    data.dashOffset = 0
    data.count = getTickCount()
    data.color = color or {255, 255, 255}
    data.animate = animate or false
    data.animationSpeed = animationSpeed or 0.2

    data.xml = svgGetDocumentXML(data.svg)
    assert(data.xml, "Falha ao obter o XML do documento SVG.")

    data.elementSVG = xmlFindChild(data.xml, type, 0)
    assert(data.elementSVG, "Falha ao encontrar o elemento SVG.")

    return data
end

function SVGCache:update(x, y, alpha, value)
    if value then
        self.dashOffset = value
    end
    
    local newValue = (self.dashArray / 100) * (100 - self.dashOffset)

    dxSetBlendMode('add')
    dxDrawImage(x, y, self.w, self.h, self.svg, 0, 0, 0, tocolor(self.color[1], self.color[2], self.color[3], alpha))
    dxSetBlendMode('blend')

    if self.animate then
        self.dashOffset = self.dashOffset + self.animationSpeed
        self:setSVGStrokeDashOffset(self.dashOffset)
    else
        self:setSVGStrokeDashOffset(newValue)
    end
end


function SVGCache:setSVGStrokeDashOffset(dashOffset)
    assert(self.elementSVG, "Elemento SVG não encontrado.")
    xmlNodeSetAttribute(self.elementSVG, 'stroke-dashoffset', dashOffset)
    svgSetDocumentXML(self.svg, self.xml)
end

function removeSVGCache(animation)
    for i = #animations, 1, -1 do
        if animations[i] == animation then
            table.remove(animations, i)
            break
        end
    end
end

function removeAllSVGCaches()
    animations = {}
end
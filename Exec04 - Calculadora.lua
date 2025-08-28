function filtrar_pares(t)
    local pares = {}
    for i = 1, #t do
        if t[i] % 2 == 0 then
            table.insert(pares, t[i])
        end
    end
    return pares
end

io.write("Quantos números deseja inserir na tabela? ")
local n = tonumber(io.read())

local numeros = {}
for i = 1, n do
    io.write("Digite o " .. i .. "º número: ")
    numeros[i] = tonumber(io.read())
end

local pares = filtrar_pares(numeros)

io.write("\nNúmeros pares na tabela: ")
for i = 1, #pares do
    io.write(pares[i] .. " ")
end
print()
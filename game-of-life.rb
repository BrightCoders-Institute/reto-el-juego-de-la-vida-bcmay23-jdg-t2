require 'matrix'
@matriz = [[1,   2,  3,  4,  5], 
           [6,   7,  8,  9, 10], 
           [11, 12, 13, 14, 15],
           [16, 17, 18, 19, 20],
           [21, 22, 23, 24, 25]]  
@columna = @matriz[0].length
@fila = @matriz.length
@fila2= @fila - 1
def matrix
    for row in @matriz do
    #row
        for col in row  do
        
        end
    end
end

def position1
    
    for value in @matriz do
        for val in value do
            p val
        end    
    end
    
end
matrix
position1
# Supongamos que tienes una matriz llamada 'matriz' que representa el tablero del juego de la vida
def method_name
    matrix = [[1, 2, 3], 
              [4, 5, 6], 
              [7, 8, 9]]

    
filas = matrix.length
columnas = matrix[0].length

for fila in 0...filas
for columna in 0...columnas
# Obtener el valor de la célula en la posición actual
valor = matrix[fila][columna]

# Realizar las operaciones que necesites con la posición actual
# Puedes aumentar la posición, hacer algún cálculo, etc.

# Ejemplo: aumentar la posición en 1 en ambas direcciones
nueva_fila = fila + 1
nueva_columna = columna + 1

# Utilizar la nueva posición para realizar las operaciones deseadas
# ...
p nueva_fila

end
end
end




=begin

def matrix
    m = Matrix.build(4,8) { rand(-..*) }
    print m
end 
=end
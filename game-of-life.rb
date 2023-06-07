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
    col= @matriz[2]
    position1(col)
    
end

def position1(col)
    fila = 1
    columna =2 
    
    actual = @matriz[fila][columna]
    derecha = @matriz[fila][columna+1]
    diagonalabjizq = @matriz[fila+1][columna-1]
    diagonalabjder = @matriz[fila+1][columna+1]
    izquierda = @matriz[fila][columna-1]
    abajo = @matriz[fila+1][columna]
    arriba = @matriz [fila - 1][columna]
    diagonalarbizq = @matriz[fila-1][columna-1]
    diagonalarbder = @matriz [fila-1][columna+1]

    case [fila, columna]
when [0,0] #Esquina superior izquierda
    p  "Derecha: #{derecha}"
    p  "Abajo #{abajo}"
    p  "Diagonal abajo derecha #{diagonalabjder}"
    
when [0,  ] #Fila 0, medio de la columna
    p  "Abajo #{abajo}"
    p  "Derecha: #{derecha}"
    p  "Izquierda #{izquierda}"
    p  "Diagonal abajo izquierda #{diagonalabjizq}"
    p  "Diagonal abajo derecha #{diagonalabjder}"

when [0, @matriz[].length] #Esquina superior derecha  
    p  "Izquierda #{izquierda}"
    p  "Diagonal abajo izquierda #{diagonalabjizq}"
    p  "Abajo #{abajo}"
    
when [matriz.length, matriz[].length] #Esquina inferior derecha


when [matriz.length, 0] #Esquina inferior izquierda

when []
    else
end
       

    @matriz[2].each {|x| 
    if col[1]>x
        break
    else 
     end
}

end
matrix

=begin
    p  "Arriba #{arriba}"
    p  "Abajo #{abajo}"
    p  "Posición actual: #{actual}"
    p  "Derecha: #{derecha}"
    p  "Izquierda #{izquierda}"
    p  "Diagonal abajo izquierda #{diagonalabjizq}"
    p  "Diagonal abajo derecha #{diagonalabjder}"
    p  "Diagonal arroba izquierda #{diagonalarbizq}"
    p  "Diagonal arriba derecha #{diagonalarbder}"
=end 

=begin

def matrix
    m = Matrix.build(4,8) { rand(-..*) }
    print m
end 
=end
@matriz = [[ 0,  1,  0,  0,  0],
           [ 1,  1,  0,  0,  0],
           [ 0,  0,  0,  0,  0],
           [ 0,  0,  0,  0,  0],
           [ 0,  0,  0,  0,  0]]

@columna = @matriz[0].length
@fila = @matriz.length
@fila2 = @fila - 1
@cont = 0

def position1()
  p "Ingrese numero de fila"
  fila = gets.chop.to_i
  p "Ingrese numero de columa"
  columna = gets.chop.to_i
  actual = @matriz[fila][columna]
  case [fila, columna]
  when [0, 0] # Esquina superior izquierda
    puts "Posicion actual: #{actual}"
    derecha(fila,columna)
    abajo(fila,columna)
    daderecha(fila,columna)
    impresion(actual)

  when [0, @columna - 1] # Esquina superior derecha
    puts "Posicion actual: #{actual}"
    puts "Izquierda: #{@matriz[fila][columna - 1]}"
    puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    puts "Abajo: #{@matriz[fila + 1][columna]}"

  when [@fila2, 0] # Esquina inferior izquierda
    puts "Posicion actual: #{actual}"
    puts "Arriba: #{@matriz[fila - 1][columna]}"
    puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    puts "Derecha: #{@matriz[fila][columna + 1]}"

  when [@fila2, @columna - 1] # Esquina inferior derecha
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    puts "Arriba: #{@matriz[fila - 1][columna]}"
    puts "Izquierda: #{@matriz[fila][columna - 1]}"

  when [0, columna] # Fila 0, medio de la columna
    puts "Posicion actual: #{actual}"
    puts "Abajo: #{@matriz[fila + 1][columna]}"
    puts "Derecha: #{@matriz[fila][columna + 1]}"
    puts "Izquierda: #{@matriz[fila][columna - 1]}"
    puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    puts "Diagonal abajo derecha: #{@matriz[fila + 1][columna + 1]}"

  when [@fila2, columna] # Fila máxima, medio de la columna
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    puts "Arriba: #{@matriz[fila - 1][columna]}"
    puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    puts "Izquierda: #{@matriz[fila][columna - 1]}"
    puts "Derecha: #{@matriz[fila][columna + 1]}"

  when [fila, 0] # Cualquier posición dentro de la fila, en la esquina izquierda
    puts "Posicion actual: #{actual}"
    puts "Arriba: #{@matriz[fila - 1][columna]}"
    puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    puts "Derecha: #{@matriz[fila][columna + 1]}"
    puts "Abajo: #{@matriz[fila + 1][columna]}"
    puts "Diagonal abajo derecha: #{@matriz[fila + 1][columna + 1]}"

  when [fila, @columna - 1] # Cualquier posición dentro de la fila, en la esquina derecha
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    puts "Arriba: #{@matriz[fila - 1][columna]}"
    puts "Izquierda: #{@matriz[fila][columna - 1]}"
    puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    puts "Abajo: #{@matriz[fila + 1][columna]}"

  else # Cualquier posición central
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    puts "Arriba: #{@matriz[fila - 1][columna]}"
    puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    puts "Derecha: #{@matriz[fila][columna + 1]}"
    puts "Diagonal abajo derecha: #{@matriz[fila + 1][columna + 1]}"
    puts "Abajo: #{@matriz[fila + 1][columna]}"
    puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    puts "Izquierda: #{@matriz[fila][columna - 1]}"
  end
end

def impresion(actual)
  if actual == 1
    if @cont == 3
      p "Sigues con vida"
    else
      p "Vas a morir"
    end
  else actual == 0
    if @cont == 3
      p "Felicidades revives"
    else
      p "Sigues muerto"
    end
  end
end


def derecha(fila,columna)
  @cont += 1 if @matriz[fila][columna + 1] == 1
end

def abajo(fila,columna)
  @cont += 1 if @matriz[fila + 1][columna] == 1
end

def daderecha(fila,columna)
  @cont += 1 if @matriz[fila + 1][columna + 1] == 1
end



position1()



=begin
    p  "Arriba #{arriba}"
    p  "Abajo #{abajo}"
    p  "Posición actual: #{actual}"
    p  "Derecha: #{derecha}"
    p  "Izquierda #{izquierda}"
    p  "Diagonal abajo izquierda #{diagonalabjizq}"
    p  "Diagonal abajo derecha #{diagonalabjder}"
    p  "Diagonal arriba izquierda #{diagonalarbizq}"
    p  "Diagonal arriba derecha #{diagonalarbder}"
=end 

=begin

def matrix
    m = Matrix.build(4,8) { rand(-..*) }
    print m
end 
=end
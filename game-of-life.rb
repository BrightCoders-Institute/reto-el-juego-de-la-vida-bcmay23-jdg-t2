@matriz = [[1, 2, 3, 4, 5],
           [6, 7, 8, 9, 10],
           [11, 12, 13, 14, 15],
           [16, 17, 18, 19, 20],
           [21, 22, 23, 24, 25]]

@columna = @matriz[0].length
@fila = @matriz.length
@fila2 = @fila - 1

def position1()
  p "Ingrese numero de fila"
  fila = gets.chop.to_i
  p "Ingrese numero de columa"
  columna = gets.chop.to_i
  actual = @matriz[fila][columna]
  derecha = @matriz[fila][columna + 1]
  diagonal_abj_izq = @matriz[fila + 1][columna - 1]
  diagonal_abj_der = @matriz[fila + 1][columna + 1]
  izquierda = @matriz[fila][columna - 1]
  abajo = @matriz[fila + 1][columna]
  arriba = @matriz[fila - 1][columna]
  diagonal_arb_izq = @matriz[fila - 1][columna - 1]
  diagonal_arb_der = @matriz[fila - 1][columna + 1]

  case [fila, columna]
  when [0, 0] # Esquina superior izquierda
    puts "Posicion actual: #{actual}"
    puts "Derecha: #{derecha}"
    puts "Abajo: #{abajo}"
    puts "Diagonal abajo derecha: #{diagonal_abj_der}"

  when [0, @columna - 1] # Esquina superior derecha
    puts "Posicion actual: #{actual}"
    puts "Izquierda: #{izquierda}"
    puts "Diagonal abajo izquierda: #{diagonal_abj_izq}"
    puts "Abajo: #{abajo}"

  when [@fila2, 0] # Esquina inferior izquierda
    puts "Posicion actual: #{actual}"
    puts "Arriba: #{arriba}"
    puts "Diagonal arriba derecha: #{diagonal_arb_der}"
    puts "Derecha: #{derecha}"

  when [@fila2, @columna - 1] # Esquina inferior derecha
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{diagonal_arb_izq}"
    puts "Arriba: #{arriba}"
    puts "Izquierda: #{izquierda}"

  when [0, columna] # Fila 0, medio de la columna
    puts "Posicion actual: #{actual}"
    puts "Abajo: #{abajo}"
    puts "Derecha: #{derecha}"
    puts "Izquierda: #{izquierda}"
    puts "Diagonal abajo izquierda: #{diagonal_abj_izq}"
    puts "Diagonal abajo derecha: #{diagonal_abj_der}"

  when [@fila2, columna] # Fila máxima, medio de la columna
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{diagonal_arb_izq}"
    puts "Arriba: #{arriba}"
    puts "Diagonal arriba derecha: #{diagonal_arb_der}"
    puts "Izquierda: #{izquierda}"
    puts "Derecha: #{derecha}"

  when [fila, 0] # Cualquier posición dentro de la fila, en la esquina izquierda
    puts "Posicion actual: #{actual}"
    puts "Arriba: #{arriba}"
    puts "Diagonal arriba derecha: #{diagonal_arb_der}"
    puts "Derecha: #{derecha}"
    puts "Abajo: #{abajo}"
    puts "Diagonal abajo derecha: #{diagonal_abj_der}"

  when [fila, @columna - 1] # Cualquier posición dentro de la fila, en la esquina derecha
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{diagonal_arb_izq}"
    puts "Arriba: #{arriba}"
    puts "Izquierda: #{izquierda}"
    puts "Diagonal abajo izquierda: #{diagonal_abj_izq}"
    puts "Abajo: #{abajo}"

  else # Cualquier posición central
    puts "Posicion actual: #{actual}"
    puts "Diagonal arriba izquierda: #{diagonal_arb_izq}"
    puts "Arriba: #{arriba}"
    puts "Diagonal arriba derecha: #{diagonal_arb_der}"
    puts "Derecha: #{derecha}"
    puts "Diagonal abajo derecha: #{diagonal_abj_der}"
    puts "Abajo: #{abajo}"
    puts "Diagonal abajo izquierda: #{diagonal_abj_izq}"
    puts "Izquierda: #{izquierda}"
  end
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
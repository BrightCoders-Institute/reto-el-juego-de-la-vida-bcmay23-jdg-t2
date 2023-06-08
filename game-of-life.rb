require 'matrix'
p "Favor de ingresar número de filas: "
row = gets.chop.to_i
p "Ingrese el tamaño de la columna: "
col = gets.chop.to_i
@matriz = Array.new(row) { Array.new(col) { rand(0..1) } }


def recorrido
  imprimir
  for x in 0...@fila 
  for y in 0...@columna do
    vecindario(x,y)
  end
  end
  p ""
  imprimir 
end

def vecindario(x, y)
  fila = x
  columna = y
  actual = @matriz[fila][columna]
  case [fila, columna]
  when [0, 0] # Esquina superior izquierda
    @cont = 0
    derecha(fila,columna)
    abajo(fila,columna)
    diagonal_abajo_derecha(fila,columna)
    estado(fila, columna, actual)

  when [0, @columna - 1] # Esquina superior derecha
    @cont = 0
    izquierda(fila, columna)
    diagonal_abajo_izquierda(fila, columna)
    abajo(fila, columna)
    estado(fila, columna, actual)
    #puts "Izquierda: #{@matriz[fila][columna - 1]}"
    #puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    #puts "Abajo: #{@matriz[fila + 1][columna]}"

  when [@fila2, 0] # Esquina inferior izquierda
    @cont = 0
    arriba(fila, columna)
    diagonal_arriba_derecha(fila, columna)
    derecha(fila, columna)
    estado(fila, columna, actual)
    #puts "Arriba: #{@matriz[fila - 1][columna]}"
    #puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    #puts "Derecha: #{@matriz[fila][columna + 1]}"

  when [@fila2, @columna - 1] # Esquina inferior derecha
    @cont = 0
    diagonal_arriba_izquierda(fila, columna)
    arriba(fila, columna)
    izquierda(fila, columna)
    estado(fila, columna, actual)
    #puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    #puts "Arriba: #{@matriz[fila - 1][columna]}"
    #puts "Izquierda: #{@matriz[fila][columna - 1]}"

  when [0, columna] # Fila 0, medio de la columna
    @cont = 0
    abajo(fila, columna)
    derecha(fila, columna)
    izquierda(fila, columna)
    diagonal_abajo_izquierda(fila, columna)
    diagonal_abajo_derecha(fila, columna)
    estado(fila, columna, actual)
    #puts "Abajo: #{@matriz[fila + 1][columna]}"
    #puts "Derecha: #{@matriz[fila][columna + 1]}"
    #puts "Izquierda: #{@matriz[fila][columna - 1]}"
    #puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    #puts "Diagonal abajo derecha: #{@matriz[fila + 1][columna + 1]}"

  when [@fila2, columna] # Fila máxima, medio de la columna
    @cont = 0
    diagonal_arriba_izquierda(fila, columna)
    arriba(fila, columna)
    diagonal_arriba_derecha(fila, columna)
    izquierda(fila, columna)
    derecha(fila, columna)
    estado(fila, columna, actual)
    #puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    #puts "Arriba: #{@matriz[fila - 1][columna]}"
    #puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    #puts "Izquierda: #{@matriz[fila][columna - 1]}"
    #puts "Derecha: #{@matriz[fila][columna + 1]}"

  when [fila, 0] # Cualquier posición dentro de la fila, en la esquina izquierda
    @cont = 0
    arriba(fila, columna)
    diagonal_arriba_derecha(fila, columna)
    derecha(fila, columna)
    abajo(fila, columna)
    diagonal_abajo_derecha(fila, columna)
    estado(fila, columna, actual)
    #puts "Arriba: #{@matriz[fila - 1][columna]}"
    #puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    #puts "Derecha: #{@matriz[fila][columna + 1]}"
    #puts "Abajo: #{@matriz[fila + 1][columna]}"
    #puts "Diagonal abajo derecha: #{@matriz[fila + 1][columna + 1]}"

  when [fila, @columna - 1] # Cualquier posición dentro de la fila, en la esquina derecha
    @cont = 0
    diagonal_arriba_izquierda(fila, columna)
    arriba(fila, columna)
    izquierda(fila, columna)
    diagonal_abajo_izquierda(fila, columna)
    abajo(fila, columna)
    estado(fila, columna, actual)
    #puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    #puts "Arriba: #{@matriz[fila - 1][columna]}"
    #puts "Izquierda: #{@matriz[fila][columna - 1]}"
    #puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    #puts "Abajo: #{@matriz[fila + 1][columna]}"

  else # Cualquier posición central
    @cont = 0
    diagonal_arriba_izquierda(fila, columna)
    arriba(fila, columna)
    diagonal_arriba_derecha(fila, columna)
    derecha(fila, columna)
    diagonal_abajo_derecha(fila, columna)
    abajo(fila, columna)
    diagonal_abajo_izquierda(fila, columna)
    izquierda(fila, columna)
    estado(fila, columna, actual)
    #puts "Diagonal arriba izquierda: #{@matriz[fila - 1][columna - 1]}"
    #puts "Arriba: #{@matriz[fila - 1][columna]}"
    #puts "Diagonal arriba derecha: #{@matriz[fila - 1][columna + 1]}"
    #puts "Derecha: #{@matriz[fila][columna + 1]}"
    #puts "Diagonal abajo derecha: #{@matriz[fila + 1][columna + 1]}"
    #puts "Abajo: #{@matriz[fila + 1][columna]}"
    #puts "Diagonal abajo izquierda: #{@matriz[fila + 1][columna - 1]}"
    #puts "Izquierda: #{@matriz[fila][columna - 1]}"
  end

end

def estado(fila, columna, actual)
  if actual == 1
    if @cont == 3
    else
      actual = 0 
    end
  elsif actual == 0
    if @cont == 3
      actual = 1
    else
    end
  end
  @matriz[fila][columna] = actual 
end

def imprimir 
  @matriz.each do |fila|
    fila.each do |elemento|
      print "#{elemento}\t" # \t para separar los elementos por una tabulación
    end
    puts "\n" # Salto de línea después de cada fila
  end  
end


def arriba(fila, columna)
  @cont += 1 if @matriz[fila - 1][columna] == 1
end

def abajo(fila,columna)
  @cont += 1 if @matriz[fila + 1][columna] == 1
end

def izquierda(fila, columna)
  @cont += 1 if @matriz[fila - 1][columna] == 1
end

def derecha(fila,columna)
  @cont += 1 if @matriz[fila][columna + 1] == 1
end

def diagonal_arriba_izquierda(fila, columna)
  @cont += 1 if @matriz[fila - 1][columna - 1] == 1
end

def diagonal_arriba_derecha(fila, columna)
  @cont += 1 if @matriz[fila - 1][columna + 1] == 1
end

def diagonal_abajo_izquierda(fila, columna)
  @cont += 1 if @matriz[fila + 1][columna - 1] == 1
end

def diagonal_abajo_derecha(fila,columna)
  @cont += 1 if @matriz[fila + 1][columna + 1] == 1
end


@columna = @matriz[0].length
@fila = @matriz.length
@fila2 = @fila - 1
@cont = 0
recorrido()



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
    m = 
    print m
end 
=end
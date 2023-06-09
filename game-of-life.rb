require 'matrix'
p "Favor de ingresar número de filas: "
row = gets.chop.to_i
p "Ingrese el tamaño de la columna: "
col = gets.chop.to_i
@matriz = Array.new(row) { Array.new(col) { rand(0..1) } }
@matriz2 = Array.new(row) {Array.new(col)}

def recorrido
  imprimir
  for x in 0...@fila 
  for y in 0...@columna do
    vecindario(x,y)
  end
  end
  puts "-------" * @fila
  transicionMatriz()
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

  when [@fila2, 0] # Esquina inferior izquierda
    @cont = 0
    arriba(fila, columna)
    diagonal_arriba_derecha(fila, columna)
    derecha(fila, columna)
    estado(fila, columna, actual)
@columna
  when [@fila2, @columna - 1] # Esquina inferior derecha
    @cont = 0
    diagonal_arriba_izquierda(fila, columna)
    arriba(fila, columna)
    izquierda(fila, columna)
    estado(fila, columna, actual)

  when [0, columna] # Fila 0, medio de la columna
    @cont = 0
    abajo(fila, columna)
    derecha(fila, columna)
    izquierda(fila, columna)
    diagonal_abajo_izquierda(fila, columna)
    diagonal_abajo_derecha(fila, columna)
    estado(fila, columna, actual)

  when [@fila2, columna] # Fila máxima, medio de la columna
    @cont = 0
    diagonal_arriba_izquierda(fila, columna)
    arriba(fila, columna)
    diagonal_arriba_derecha(fila, columna)
    izquierda(fila, columna)
    derecha(fila, columna)
    estado(fila, columna, actual)

  when [fila, 0] # Cualquier posición dentro de la fila, en la esquina izquierda
    @cont = 0
    arriba(fila, columna)
    diagonal_arriba_derecha(fila, columna)
    derecha(fila, columna)
    abajo(fila, columna)
    diagonal_abajo_derecha(fila, columna)
    estado(fila, columna, actual)
   
  when [fila, @columna - 1] # Cualquier posición dentro de la fila, en la esquina derecha
    @cont = 0
    diagonal_arriba_izquierda(fila, columna)
    arriba(fila, columna)
    izquierda(fila, columna)
    diagonal_abajo_izquierda(fila, columna)
    abajo(fila, columna)
    estado(fila, columna, actual)

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
   
  end

end

def estado(fila, columna, actual)
  if actual== 1 
    if @cont != 3
      actual = 0
    end
  elsif actual = 0
    if @cont == 3
      actual = 1
    end
  end  
  @matriz2[fila][columna] = actual 
end

def imprimir 
  @matriz.each do |fila|
    fila.each do |elemento|
      print "#{elemento}\t"# \t para separar los elementos por una tabulación
    end
    puts "\n" # Salto de línea después de cada fila
  end
end
def transicionMatriz
  @matriz = @matriz2.map(&:clone)
end
def arriba(fila, columna)
  @cont += 1 if @matriz[fila - 1][columna] == 1
end

def abajo(fila,columna)
  @cont += 1 if @matriz[fila + 1][columna] == 1
end

def izquierda(fila, columna)
  @cont += 1 if @matriz[fila][columna - 1] == 1
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

def iteraciones
  p "Cuántas veces desea ejecutar el juego? "
  x = 1
  n= gets.chop.to_i
  n.times do
    p "Iteracion: #{x}"
    recorrido()
    x += 1
  end
end

@columna = @matriz[0].length
@fila = @matriz.length
@fila2 = @fila - 1
@cont = 0
iteraciones()




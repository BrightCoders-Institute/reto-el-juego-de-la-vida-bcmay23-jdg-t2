require 'matrix'

class JuegoDeLaVida
  def initialize
    @matriz = nil
    @matriz2 = nil
    @fila = nil
    @columna = nil
    @fila2 = nil
    @cont = nil
  end

  def jugar
    inicializar
    iteraciones
  end

  private

  def inicializar
    puts "Favor de ingresar el número de filas: "
    filas = gets.chomp.to_i

    puts "Ingrese el número de columnas: "
    columnas = gets.chomp.to_i

    @matriz = Matrix.build(filas, columnas) { rand(0..1) }
    @matriz2 = Matrix.zero(filas, columnas)

    @fila = @matriz.row_size
    @columna = @matriz.column_size
    @fila2 = @fila - 1
  end

  def iteraciones
    puts "¿Cuántas veces desea ejecutar el juego?"
    n = gets.chomp.to_i

    n.times do |i|
      puts "Iteración: #{i + 1}"
      recorrido
    end
  end

  def recorrido
    imprimir
    (0...@matriz.row_size).each do |x|
      (0...@matriz.column_size).each do |y|
        vecindario(x, y)
      end
    end
    puts "-------" * @matriz.column_size
    transicionMatriz
    imprimir
  end

  def vecindario(x, y)
    fila = x
    columna = y
    actual = @matriz[x, y]

    case [fila, columna]
    when [0, 0] # Esquina superior izquierda
      @cont = 0
      derecha(fila, columna)
      abajo(fila, columna)
      diagonal_abajo_derecha(fila, columna)
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
    if actual == 1
      actual = 0 if @cont != 3
    elsif actual == 0
      actual = 1 if @cont == 3
    end

    @matriz2[fila, columna] = actual
  end

  def imprimir
    (0...@matriz.row_size).each do |x|
      (0...@matriz.column_size).each do |y|
        print "#{@matriz[x, y]}\t"
      end
      puts "\n"
    end
  end

  def transicionMatriz
    @matriz = @matriz2.clone
  end

  def arriba(fila, columna)
    @cont += 1 if @matriz[fila - 1, columna] == 1
  end

  def abajo(fila, columna)
    @cont += 1 if @matriz[fila + 1, columna] == 1
  end

  def izquierda(fila, columna)
    @cont += 1 if @matriz[fila, columna - 1] == 1
  end

  def derecha(fila, columna)
    @cont += 1 if @matriz[fila, columna + 1] == 1
  end

  def diagonal_arriba_izquierda(fila, columna)
    @cont += 1 if @matriz[fila - 1, columna - 1] == 1
  end

  def diagonal_arriba_derecha(fila, columna)
    @cont += 1 if @matriz[fila - 1, columna + 1] == 1
  end

  def diagonal_abajo_izquierda(fila, columna)
    @cont += 1 if @matriz[fila + 1, columna - 1] == 1
  end

  def diagonal_abajo_derecha(fila, columna)
    @cont += 1 if @matriz[fila + 1, columna + 1] == 1
  end
end

juego = JuegoDeLaVida.new
juego.jugar

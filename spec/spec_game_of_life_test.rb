# spec/game_of_life_test_spec.rb

require 'rspec'
require_relative '//reto-el-juego-de-la-vida-bcmay23-jdg-t2/game-of-life.rb'

RSpec.describe JuegoDeLaVida do
    describe '#jugar' do
      it 'debería realizar las iteraciones correctamente' do
        juego = JuegoDeLaVida.new
        expect { juego.jugar }.to output.to_stdout
      end
    end
  
    describe '#recorrido' do
      it 'debería imprimir la matriz correctamente' do
        juego = JuegoDeLaVida.new
        expect { juego.recorrido }.to output(/Iteración: 1/).to_stdout
      end
    end
  
  end
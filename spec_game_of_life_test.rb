require 'matrix'
require_relative 'game_of_life_test'

RSpec.describe JuegoDeLaVida do
  describe '#jugar' do
    it 'debería realizar las iteraciones correctamente' do
      juego = JuegoDeLaVida.new
      expect { juego.jugar }.to output(/Iteración: 1/).to_stdout
    end
  end
  
  describe '#vecindario' do 
    let(:juego) { JuegoDeLaVida.new }

    before do 
    juego.jugar
    
  end
    it 'debería actualizar el estado de las células correctamente' do
      juego.instance_variable_set(:@matriz, Matrix[
        [0, 1, 0],
        [0, 1, 0],
        [0, 1, 0]
      ])
      
      juego.send(:vecindario, 1, 1)
      expect(juego.instance_variable_get(:@matriz2)[1, 1]).to eq(0)

      juego.send(:vecindario, 0, 1)
      expect(juego.instance_variable_get(:@matriz2)[0, 1]).to eq(0)

      juego.send(:vecindario, 2, 1)
      expect(juego.instance_variable_get(:@matriz2)[2, 1]).to eq(0)
    end
  end
end
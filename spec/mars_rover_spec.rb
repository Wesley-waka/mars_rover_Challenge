
require_relative '../lib/mars_rover.rb'

RSpec.describe Rover do
  describe '#initialize' do
    it 'sets the initial position and orientation of the rover' do
      rover = Rover.new(1, 2, 'N')
      expect(rover.instance_variable_get(:@x)).to eq(1)
      expect(rover.instance_variable_get(:@y)).to eq(2)
      expect(rover.instance_variable_get(:@orientation)).to eq('N')
    end
  end

  describe '#move' do
    let(:rover) { Rover.new(1, 1, 'N') }

    context 'when the instruction is L' do
      it 'rotates the rover 90 degrees to the left' do
        rover.move('L')
        expect(rover.instance_variable_get(:@orientation)).to eq('W')
      end
    end

    context 'when the instruction is R' do
      it 'rotates the rover 90 degrees to the right' do
        rover.move('R')
        expect(rover.instance_variable_get(:@orientation)).to eq('E')
      end
    end

    context 'when the instruction is M' do
      it 'moves the rover one unit forward in the current orientation' do
        rover.move('M')
        expect(rover.instance_variable_get(:@y)).to eq(2)
      end
    end
  end

  describe '#to_s' do
    it 'returns a string representation of the rover\'s current position and orientation' do
      rover = Rover.new(2, 1, 'E')
      expect(rover.to_s).to eq('2 1 E')
    end
  end
end
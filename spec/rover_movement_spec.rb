# spec/rover_unit_spec.rb
require_relative '../lib/rover_movement.rb'

RSpec.describe 'Rover Unit' do
  describe '#process_input' do
    it 'processes the input and returns an array of rovers' do
      input = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"
      rovers = process_input(input)

      expect(rovers).to be_an(Array)
      expect(rovers.length).to eq(2)

      expect(rovers[0]).to be_an_instance_of(Rover)
      expect(rovers[0].to_s).to eq('1 2 N')

      expect(rovers[1]).to be_an_instance_of(Rover)
      expect(rovers[1].to_s).to eq('3 3 E')
    end
  end

  describe '#format_output' do
    it 'formats the array of rovers into a string' do
      rovers = [
        Rover.new(1, 3, 'N'),
        Rover.new(5, 1, 'E')
      ]

      output = format_output(rovers)
      expected_output = "1 3 N\n5 1 E"

      expect(output).to eq(expected_output)
    end
  end
end

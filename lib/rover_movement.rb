# Process the input string and return an array of rovers
def process_input(input)
  lines = input.split("\n")
  upper_right = lines.shift.split(' ').map(&:to_i)
  rovers = []

  until lines.empty?
    position = lines.shift.split(' ')
    instructions = lines.shift.chomp

    x, y, orientation = position[0].to_i, position[1].to_i, position[2]

    # Create a new rover with the extracted position and orientation
    rover = Rover.new(x, y, orientation)

    # Execute each instruction for the rover
    instructions.chars.each do |instruction|
      rover.move(instruction)
    end

    # Add the rover to the collection
    rovers << rover
  end

  rovers
end

# Format the output by converting each rover's position to a string and joining them with newlines
def format_output(rovers)
  rovers.map(&:to_s).join("\n")
end

# Example usage:
input = "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM"

# Process the input to get the rovers
rovers = process_input(input)

# Format the rovers' positions as a string
output = format_output(rovers)

# Print the output
puts output



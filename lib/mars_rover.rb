class Rover
  # Def an orientation in which shows the orientation of rover
  ORIENTATIONS = ['N', 'E', 'S', 'W'].freeze #immutable
  # Test Case 2:
  # Input:
  # "5 5\n1 1 E\nM\n3 3 S\nLMMMRML"
  
  # Expected Output:
  # "2 1 E\n1 0 W"
  # Initialize the rover with the given coordinates and orientation
  def initialize(x, y, orientation)
    @x = x
    @y = y
    @orientation = orientation
  end

  # Move the rover based on the given instruction
  def move(instruction)
    case instruction
    when 'L'
      turn_left
    when 'R'
      turn_right
    when 'M'
      move_forward
    end
  end

  # Return a string representation of the rover's current position and orientation
  def to_s
    "#{@x} #{@y} #{@orientation}"
  end

  private

  # Rotate the rover 90 degrees to the left
  def turn_left
    @orientation = ORIENTATIONS[(ORIENTATIONS.index(@orientation) - 1) % 4]
  end
  # (0 - 1) % 4
  # Rotate the rover 90 degrees to the right
  def turn_right
    @orientation = ORIENTATIONS[(ORIENTATIONS.index(@orientation) + 1) % 4]
  end

  # Move the rover one unit forward in the current orientation
  def move_forward
    case @orientation
    when 'N'
      @y += 1
    when 'E'
      @x += 1
    when 'S'
      @y -= 1
    when 'W'
      @x -= 1
    end
  end
end






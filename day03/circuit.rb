class Circuit
  def initialize(wires_paths)
    @wires_paths = wires_paths
    @first_wire_horizontal_coordinates = []
    @first_wire_vertical_coordinates = []
    @second_wire_horizontal_coordinates = []
    @second_wire_vertical_coordinates = []
    @pointer = { x: 0, y: 0 }
  end
  
  UP = 'U'
  DOWN = 'D'
  LEFT = 'L'
  RIGHT = 'R'
  HORIZONTAL_MOVE = [LEFT, RIGHT]
  VERTICAL_MOVE = [UP, DOWN]

  FIRST_WIRE = 1
  SECOND_WIRE = 2

  attr_reader :wires_paths, :first_wire_horizontal_coordinates, :first_wire_vertical_coordinates, :second_wire_horizontal_coordinates, :second_wire_vertical_coordinates, :pointer

  def process
    wires_paths.first.split(',').each do |full_direction|
      change_direction(FIRST_WIRE, full_direction)
    end

    reset_pointer

    wires_paths.last.split(',').each do |full_direction|
      change_direction(SECOND_WIRE, full_direction)
    end

    puts manhattan_distance
  end

  private

  def change_direction(wire, full_direction)
    letter = full_direction[0]
    number_of_moves = movement(full_direction, letter)
    1.upto(number_of_moves) do
      move_pointer(letter)
      draw_coordinates(wire, letter)
    end
  end
  
  def movement(full_direction, letter)
    full_direction.delete_prefix(letter).to_i
  end

  def move_pointer(letter)
    pointer[:x] += 1 if letter == RIGHT
    pointer[:x] -= 1 if letter == LEFT
    pointer[:y] += 1 if letter == UP
    pointer[:y] -= 1 if letter == DOWN
  end

  def draw_coordinates(wire, letter)
    if wire == FIRST_WIRE
      if HORIZONTAL_MOVE.include?(letter)
        first_wire_horizontal_coordinates << [pointer[:x], pointer[:y]]
      else
        first_wire_vertical_coordinates << [pointer[:x], pointer[:y]]
      end
    else
      if HORIZONTAL_MOVE.include?(letter)
        second_wire_horizontal_coordinates << [pointer[:x], pointer[:y]]
      else
        second_wire_vertical_coordinates << [pointer[:x], pointer[:y]]
      end
    end
  end

  def reset_pointer
    pointer[:x] = 0
    pointer[:y] = 0
  end

  def manhattan_distance
    crossing_points.map do |coordinates|
      coordinates.map(&:abs).inject(&:+)
    end.min
  end

  def crossing_points
    @crossing_points ||= (first_wire_horizontal_coordinates & second_wire_vertical_coordinates) + (first_wire_vertical_coordinates & second_wire_horizontal_coordinates) 
  end
end

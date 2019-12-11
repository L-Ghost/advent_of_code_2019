# process Intcode
class Computer
  ADD = 1
  MULTIPLY = 2
  HALT = 99

  def initialize
    @initial_state = File.open('./day02.txt').read.split(',').map(&:to_i)
    @intcode = initial_state
  end

  attr_reader :initial_state, :intcode, :noun, :verb

  def process(noun, verb)
    reset_memory(noun, verb)
    i = 0
    while i < intcode.size
      break if intcode[i] == HALT

      pos1 = intcode[i + 1]
      pos2 = intcode[i + 2]
      pos3 = intcode[i + 3]
      intcode[pos3] = intcode[pos1] + intcode[pos2] if intcode[i] == ADD
      intcode[pos3] = intcode[pos1] * intcode[pos2] if intcode[i] == MULTIPLY
      i += 4
    end
    intcode.first
  end

  private

  def reset_memory(noun, verb)
    @intcode = initial_state.dup
    @noun = noun
    @verb = verb
    restore_gravity_assist
  end

  def restore_gravity_assist
    intcode[1] = noun
    intcode[2] = verb
  end
end

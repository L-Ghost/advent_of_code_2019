# process Intcode
class Computer
  ADD = 1
  MULTIPLY = 2
  HALT = 99

  def initialize(noun, verb)
    @intcode = File.open('./day02.txt').read.split(',').map(&:to_i)
    @noun = noun
    @verb = verb
    restore_gravity_assist
  end

  attr_reader :intcode, :noun, :verb

  def process
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

  def restore_gravity_assist
    intcode[1] = noun
    intcode[2] = verb
  end
end


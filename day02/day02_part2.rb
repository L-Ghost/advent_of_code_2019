require './computer'

output = 19690720
found = false
computer = Computer.new

noun = 0
while noun < 100
  verb = 0
  while verb < 100
    result = computer.process(noun, verb)
    found = true if result.to_i == output
    break if found

    verb += 1
  end
  break if found

  noun += 1
end

puts 100 * noun + verb

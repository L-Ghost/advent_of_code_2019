intcode = File.open('./day02.txt').read.split(',').map(&:to_i)
intcode[1] = 12 # restoring gravity assist
intcode[2] = 2 # restoring gravity assist

i = 0

while i < intcode.size
  break if intcode[i] == 99
 
  pos1, pos2, pos3 = intcode[i+1], intcode[i+2], intcode[i+3]
  intcode[pos3] = intcode[pos1] + intcode[pos2] if intcode[i] == 1
  intcode[pos3] = intcode[pos1] * intcode[pos2] if intcode[i] == 2
  i += 4
end
puts intcode.to_s

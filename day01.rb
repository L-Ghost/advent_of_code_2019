
f = File.open('./day01.txt')
fuel =  f.map { |num| (num.to_i / 3) - 2 }.inject(:+)
puts fuel

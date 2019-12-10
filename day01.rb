fuel = File.open('./day01.txt').map { |num| (num.to_i / 3) - 2 }.inject(:+)
puts 'SIMPLE FUEL --> ' + fuel.to_s

def calculate_fuel(input)
  required_fuel = (input / 3) - 2
  return required_fuel + calculate_fuel(required_fuel) if required_fuel > 0

  0
end

total_fuel = File.open('./day01.txt').map do |num|
  calculate_fuel(num.to_i)
end.inject(:+)
puts 'TOTAL FUEL --> ' + total_fuel.to_s

modules_masses = File.open('./day01.txt').map(&:to_i)

def fuel(mass)
  mass / 3 - 2
end

def calculate_fuel(mass)
  required_fuel = fuel(mass)
  return required_fuel + calculate_fuel(required_fuel) if required_fuel > 0

  0
end

fuel_sum = modules_masses.map { |mass| fuel(mass) }.inject(:+)
total_fuel = modules_masses.map { |mass| calculate_fuel(mass) }.inject(:+)

puts 'SIMPLE FUEL --> ' + fuel_sum.to_s
puts 'TOTAL FUEL --> ' + total_fuel.to_s

require './circuit'

wires_paths = File.read('./input.txt').split("\n")

Circuit.new(wires_paths).process

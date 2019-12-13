require './timing_circuit'

wires_paths = File.read('./input.txt').split("\n")

TimingCircuit.new(wires_paths).process

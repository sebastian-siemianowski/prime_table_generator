require_relative "generators/prime_table_generator"
options = { number_of_prime_numbers: ARGV[0]}
PrimeTableGenerator.new(options).print_on_screen

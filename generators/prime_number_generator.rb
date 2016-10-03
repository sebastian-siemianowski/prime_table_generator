require 'prime'

class PrimeNumberGenerator
  def initialize(options)
    @number_of_prime_numbers = options[:number_of_prime_numbers]
  end

  def generate
    prime_number = Integer(@number_of_prime_numbers)
    Prime.first(prime_number)
  end
end
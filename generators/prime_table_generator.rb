require_relative "./prime_header_generator"
require_relative "./prime_number_generator"
require_relative "./prime_row_generator"

class PrimeTableGenerator
  def initialize(options)
    @number_of_prime_numbers = options[:number_of_prime_numbers]
    @prime_number_generator =  PrimeNumberGenerator.new(options)

    header_options =  {preamble_spaces: preamble_spaces,
                       prime_number_spaces: available_multiplication_spaces,
                       y_axis_prime_numbers: prime_numbers}

    @prime_header_generator = PrimeHeaderGenerator.new(header_options)
  end

  def generate
    return @generated_table if @generated_table

    table_rows = []
    prime_numbers.each do | prime_number |

      row_options = {y_axis_number: prime_number,
                     multiplicators: prime_numbers,
                     available_multiplication_spaces: available_multiplication_spaces,
                     available_y_axis_spaces: preamble_spaces}

      table_rows << PrimeRowGenerator.new(row_options).generate
    end

    @generated_table = {header: @prime_header_generator.generate, table_rows: table_rows}
  end

  def print_on_screen
    unless @generated_table
      generate
    end

    @generated_table[:header].each do | header_row |
      puts header_row
    end

    @generated_table[:table_rows].each do | row |
     puts row
    end
  end

  def prime_numbers
    if @prime_numbers
      @prime_numbers
    else
      @prime_numbers = @prime_number_generator.generate
    end
  end

  def last_prime_number
    prime_numbers.last
  end

  def available_multiplication_spaces
    (last_prime_number * last_prime_number).to_s.size  + 1
  end

  def preamble_spaces
    last_prime_number.to_s.size + 1
  end
end
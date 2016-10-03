class PrimeHeaderGenerator
  def initialize(options)
    @preamble_spaces = options[:preamble_spaces]
    @prime_number_spaces = options[:prime_number_spaces]
    @y_axis_prime_numbers = options[:y_axis_prime_numbers]
  end

  def generate
    first_row_header = (' ' * @preamble_spaces) << '|'
    first_row_remainder = ''
    @y_axis_prime_numbers.each do |y_axis_number |
      first_row_remainder << "#{' ' * (@prime_number_spaces - y_axis_number.to_s.size)}#{y_axis_number}"
    end

    second_row = "#{'_' *(first_row_header.size-1)}+#{'_' * first_row_remainder.size}"
    first_row = first_row_header << first_row_remainder
    [first_row,second_row]
  end
end
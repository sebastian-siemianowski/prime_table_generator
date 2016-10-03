class PrimeRowGenerator
  def initialize(options)
    @y_axis_number = options[:y_axis_number]
    @multiplicators = options[:multiplicators]
    @available_multiplication_spaces = options[:available_multiplication_spaces]
    @available_y_axis_spaces = options[:available_y_axis_spaces]
  end

  def generate
    number_of_y_characters = (@y_axis_number.to_s.size + 1)
    needed_y_axis_spaces = generate_space(@available_y_axis_spaces - number_of_y_characters )
    preamble = "#{needed_y_axis_spaces}#{@y_axis_number} |"
    multiplication_result = ''

    @multiplicators.each do |x_axis_number|
      calculation_result = @y_axis_number * x_axis_number
      number_of_characters = calculation_result.to_s.size
      needed_space = generate_space(@available_multiplication_spaces - number_of_characters)
      multiplication_result << "#{needed_space}#{calculation_result}"
    end

    "#{preamble}#{multiplication_result}"
  end

  private

  def generate_space(number_of_needed_characters)
    ' ' * number_of_needed_characters
  end
end
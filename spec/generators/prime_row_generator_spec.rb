require_relative "../../generators/prime_row_generator"

describe PrimeRowGenerator do
  it 'generates first row of the sample table' do
    options = {y_axis_number: 2, multiplicators: [2,3,5,7,11,13,17,19,23,29], available_multiplication_spaces: 4, available_y_axis_spaces: 3}
    expected_result = " 2 |   4   6  10  14  22  26  34  38  46  58"

    expect(PrimeRowGenerator.new(options).generate).to eq(expected_result)
  end

  it 'genertes last row of the sample table' do
    options = {y_axis_number: 29, multiplicators: [2,3,5,7,11,13,17,19,23,29], available_multiplication_spaces: 4,  available_y_axis_spaces: 3}
    expected_result = "29 |  58  87 145 203 319 377 493 551 667 841"

    expect(PrimeRowGenerator.new(options).generate).to eq(expected_result)
  end
end
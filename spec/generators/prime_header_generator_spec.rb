require_relative "../../generators/prime_header_generator"

describe PrimeHeaderGenerator do
  it 'generates first row of the sample table' do
    options = {preamble_spaces: 3, prime_number_spaces: 4, y_axis_prime_numbers: [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]}

    postamble_header = '___+'
    postamble_remainer =  '_' * '   2   3   5   7  11  13  17  19  23  29'.size
    postamble = postamble_header << postamble_remainer
    expected_result = ['   |   2   3   5   7  11  13  17  19  23  29', postamble]

    expect(PrimeHeaderGenerator.new(options).generate).to eq(expected_result)
  end
end
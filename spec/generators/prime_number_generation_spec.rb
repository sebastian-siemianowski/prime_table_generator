require_relative "../../generators/prime_number_generator"

describe PrimeNumberGenerator do
  it 'generates 5 prime numbers' do
    expect(PrimeNumberGenerator.new({number_of_prime_numbers: 5}).generate).to eq([2,3,5,7,11])
  end

  it 'generates 10 prime numbers' do
    expect(PrimeNumberGenerator.new({number_of_prime_numbers: 10}).generate).to eq([2, 3, 5, 7, 11, 13, 17, 19, 23, 29])
  end

  it 'converts string number to its number equivalent' do
    expect(PrimeNumberGenerator.new({number_of_prime_numbers: '7'}).generate).to eq([2,3,5,7,11,13,17])
  end

  it 'throws an exception if it cannot convert the string into number' do
    expect{PrimeNumberGenerator.new({number_of_prime_numbers: 'foo'}).generate}.to raise_error(ArgumentError, 'invalid value for Integer(): "foo"')
  end
end


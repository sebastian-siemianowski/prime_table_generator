require_relative '../../generators/prime_table_generator'

describe PrimeTableGenerator do
  let(:sample_table){ [" 2 |   4   6  10  14  22  26  34  38  46  58",
                       " 3 |   6   9  15  21  33  39  51  57  69  87",
                       " 5 |  10  15  25  35  55  65  85  95 115 145",
                       " 7 |  14  21  35  49  77  91 119 133 161 203",
                       "11 |  22  33  55  77 121 143 187 209 253 319",
                       "13 |  26  39  65  91 143 169 221 247 299 377",
                       "17 |  34  51  85 119 187 221 289 323 391 493",
                       "19 |  38  57  95 133 209 247 323 361 437 551",
                       "23 |  46  69 115 161 253 299 391 437 529 667",
                       "29 |  58  87 145 203 319 377 493 551 667 841"]}

  it 'generates hash containing the table' do
    options = { number_of_prime_numbers: 10}

    expect(PrimeTableGenerator.new(options).generate).to be_a Hash
  end

  it 'contains the correct header' do
    options = { number_of_prime_numbers: 10}
    expected_result = ['   |   2   3   5   7  11  13  17  19  23  29', '___+________________________________________']

    expect(PrimeTableGenerator.new(options).generate[:header]).to eq(expected_result)
  end

  it 'contains the correct rows' do
    options = { number_of_prime_numbers: 10}
    table_rows = PrimeTableGenerator.new(options).generate[:table_rows]

    (0..10).each do | number |
      expect(table_rows[number]).to eq(sample_table[number])
    end
  end

  it 'prints the output' do
    options = { number_of_prime_numbers: 10}

    PrimeTableGenerator.new(options).print_on_screen
  end
end
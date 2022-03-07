require 'pry'
require 'rspec'
require 'simplecov'
require './lib/latin_dictionary'

SimpleCov.start

RSpec.describe LatinDictionary do
  it 'exists' do
    latin = LatinDictionary.new
    expect(latin).to be_a(LatinDictionary)
  end

  it 'has attributes' do
    latin = LatinDictionary.new
    expect(latin.character_hash).to be_a(Hash)
    expect(latin.character_hash).to eq({
                                         '0.....' => 'a',
                                         '0.0...' => 'b',
                                         '00....' => 'c',
                                         '00.0..' => 'd',
                                         '0..0..' => 'e',
                                         '000...' => 'f',
                                         '0000..' => 'g',
                                         '0.00..' => 'h',
                                         '.00...' => 'i',
                                         '.000..' => 'j',
                                         '0...0.' => 'k',
                                         '0.0.0.' => 'l',
                                         '00..0.' => 'm',
                                         '00.00.' => 'n',
                                         '0..00.' => 'o',
                                         '000.0.' => 'p',
                                         '00000.' => 'q',
                                         '0.000.' => 'r',
                                         '.00.0.' => 's',
                                         '.0000.' => 't',
                                         '0...00' => 'u',
                                         '0.0.00' => 'v',
                                         '.000.0' => 'w',
                                         '00..00' => 'x',
                                         '00.000' => 'y',
                                         '0..000' => 'z',
                                         '...000' => '"',
                                         '......' => ' ',
                                         '..000.' => '!',
                                         '....0.' => "'",
                                         '..0...' => ',',
                                         '....00' => '-',
                                         '00.0.0' => '.',
                                         '..0.00' => '?'
                                       })
  end
end

require 'pry'
require 'rspec'
require 'simplecov'
require './lib/braille_dictionary'

SimpleCov.start

RSpec.describe BrailleDictionary do
  before :each do
    @dictionary = BrailleDictionary.new
  end
  it 'exists' do
    expect(@dictionary).to be_a(BrailleDictionary)
  end

  it 'has attributes' do
    expect(@dictionary.character_hash).to be_a(Hash)
    expect(@dictionary.character_hash).to eq({
                                               register1: ['g', 'f', 'd', 'c', 'h', 'b', 'e', 'a', 'j', 'i', nil, nil,
                                                           ':', ',', nil, ' '],
                                               register2: ['q', 'p', 'n', 'm', 'r', 'l', 'o', 'k', 't', 's', nil, nil,
                                                           '!', ';', nil, "'"],
                                               register3: [nil, nil, 'y', 'x', nil, 'v', 'z', 'u', nil, nil, nil, nil,
                                                           '(', '?', '"', '-'],
                                               register4: [nil, nil, '.', nil, nil, nil, nil, nil, 'w', nil, nil, nil,
                                                           nil, nil, nil, nil]
                                             })
  end
end

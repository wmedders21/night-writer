require 'pry'
require 'rspec'
require 'simplecov'
require './lib/dictionary'

SimpleCov.start

RSpec.describe Dictionary do
  before :each do
    @dictionary = Dictionary.new
  end
  it 'exists' do
    expect(@dictionary).to be_a(Dictionary)
  end

  it 'has attributes' do
    expect(@dictionary.character_hash).to be_a(Hash)
    expect(@dictionary.character_hash).to eq({
                                               register1: %w[g f d c h b e a j i],
                                               register2: %w[q p n m r l o k t s],
                                               register3: [nil, nil, 'y', 'x', nil, 'v', 'z', 'u', nil, nil],
                                               register4: [nil, nil, nil, nil, nil, nil, nil, nil, 'w', nil]
                                             })
  end
end

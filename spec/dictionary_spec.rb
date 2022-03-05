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
    expect(@dictionary.register1).to eq(["g", "f", "d", "c", "h", "b", "e", "a", "j", "i"])
    expect(@dictionary.register1).to eq(["q", "p", "n", "m", "r", "l", "o", "k", "t", "s"])
    expect(@dictionary.register1).to eq([nil, nil, "y", "x", nil, "v", "z", "u", nil, nil])
    expect(@dictionary.register1).to eq([nil, nil, nil, nil, nil, nil, nil, nil, "w", nil])
end

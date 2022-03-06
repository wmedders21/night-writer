require 'pry'
require 'rspec'
require 'simplecov'
require './lib/to_latin'
require './lib/latin'

SimpleCov.start

RSpec.describe ToLatin do
  before :each do
    file = File.open('texttxt.txt', 'r')
    test_text = file.read
    file.close
    @latin = Latin.new
    @to_latin = ToLatin.new(test_text, @latin)
    binding.pry
  end

  it 'exists' do
    expect(@to_latin).to be_a(ToLatin)
  end
end

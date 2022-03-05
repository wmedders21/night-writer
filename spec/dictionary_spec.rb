require 'pry'
require 'rspec'
require 'simplecov'
require './lib/dictionary'

SimpleCov.start

RSpec.describe Dictionary do
  it 'exists' do
    dictionary = Dictionary.new
    expect(dictionary).to be_a(Dictionary)
  end
end

require 'pry'
require 'rspec'
require 'simplecov'
require './lib/latin'

SimpleCov.start

RSpec.describe Latin do
  it 'exists' do
    latin = Latin.new
    expect(latin).to be_a(Latin)
  end
end

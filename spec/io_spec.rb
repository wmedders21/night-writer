require 'simplecov'
require 'pry'
require './lib/io'

SimpleCov.start

RSpec.describe IO do
  before :each do
    @io = IO.new(ARGV)
    ARGV.replace(['sample1.txt', 'braille.txt'])
  end

  it 'exists' do
    expect(@io).to be_a(IO)
  end

  it 'get_text' do
    expect(@io.get_text).to be_a(String)
    expect(@io.get_text.length).to be(308)
  end

  it 'print_statement' do
    expect(@io.print_statement).to eq("Created 'braille.txt' containing 308 characters")
  end
end

require 'simplecov'
require 'pry'
require './lib/io'

SimpleCov.start

RSpec.describe IO do
  before :each do
    ARGV.replace(['sample1.txt', 'braille.txt'])
    io = IO.new(ARGV)
  end

  it 'exists' do
    expect(io).to be_a(IO)
  end

  xit 'read' do
    expect(io.read).to be_a(String)
    expect(io.read.length).to be(308)
  end
end

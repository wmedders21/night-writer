require 'simplecov'
require 'pry'
require './lib/io'

SimpleCov.start

RSpec.describe IO do

  it 'read' do
    ARGV.replace(['sample1.txt', 'braille.txt'])
    io = IO.new(ARGV)
    expect(io.read).to be_a(String)
    expect(io.read.length).to be(308)
  end
end

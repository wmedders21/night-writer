require 'simplecov'
require 'pry'
require './lib/readable'

SimpleCov.start
include Readable
RSpec.describe Readable do
  it 'read' do
    ARGV.replace(['sample1.txt', 'braille.txt'])
    expect(read).to be_a(String)
    expect(read.length).to be(308)
  end
end

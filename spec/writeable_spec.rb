require 'simplecov'
require 'pry'
require './lib/writeable'

SimpleCov.start
include Writeable
RSpec.describe Writeable do
  it 'write' do
    ARGV.replace(['??????', 'spec.txt'])
    write('apple')
    file = File.open('spec.txt', 'r')
    test_text = file.read
    file.close
    expect(test_text).to eq('apple')
  end
end

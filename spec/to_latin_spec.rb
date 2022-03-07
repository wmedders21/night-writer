require 'pry'
require 'rspec'
require 'simplecov'
require './lib/to_latin'
require './lib/latin'

SimpleCov.start

RSpec.describe ToLatin do
  before :each do
    file = File.open('testtxt.txt', 'r')
    @test_text = file.read
    file.close
    @latin = Latin.new
    @to_latin = ToLatin.new(@test_text, @latin)
  end

  it 'exists' do
    expect(@to_latin).to be_a(ToLatin)
  end

  it 'has attributes' do
    expect(@to_latin.text).to be_a(String)
    expect(@to_latin.text).to eq("0.0.0.0.0....00.0.0.00\n00.00.0..0..00.0000..0\n....0.0.0....00.0.0...\n")
    expect(@to_latin.dictionary).to eq(@latin)
  end

  it 'collect_rows' do
    expect(@to_latin.collect_rows).to be_a(Array)
    expect(@to_latin.collect_rows.count).to be(3)
    expect(@to_latin.collect_rows.include?("\n")).to eq(false)
  end

  it 'parse rows' do
    expect(@to_latin.parse_rows).to eq(["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."])
  end

  it 'convert_letters' do
    expect(@to_latin.convert_letters).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"])
  end
end

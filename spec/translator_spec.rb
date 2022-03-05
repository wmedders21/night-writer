require 'pry'
require 'rspec'
require 'simplecov'
require './lib/translator'
require './lib/dictionary'

SimpleCov.start

RSpec.describe Translator do
  before :each do
    @braille = Dictionary.new
    @translator = Translator.new("apple", @braille)
  end

  it 'exists' do
    expect(@translator).to be_a(Translator)
  end

  it 'has attributes' do
    expect(@translator.text).to eq("apple")
    expect(@translator.dictionary). to be_a(Dictionary)
  end

  it 'find character register' do
    expect(@translator.find_register("a")).to eq(:register1)
    expect(@translator.find_register("m")).to eq(:register2)
    expect(@translator.find_register("v")).to eq(:register3)
    expect(@translator.find_register("w")).to eq(:register4)
  end

  it 'find character index' do
    expect(@translator.find_character_index("a")).to eq(7)
    expect(@translator.find_character_index("k")).to eq(7)
    expect(@translator.find_character_index("u")).to eq(7)
    expect(@translator.find_character_index("g")).to eq(0)
  end

  it 'convert to 4 digit binary' do
    expect(@translator.make_binary("a")).to eq("0111")
    expect(@translator.make_binary("q")).to eq("0000")
    expect(@translator.make_binary("z")).to eq("0110")
    expect(@translator.make_binary("w")).to eq("1000")
  end

  it 'add_register' do
    expect(@translator.add_register("a")).to eq("011111")
    expect(@translator.add_register("g")).to eq("000011")
    expect(@translator.add_register("r")).to eq("010001")
    expect(@translator.add_register("z")).to eq("011000")
    expect(@translator.add_register("w")).to eq("100010")
  end

  it 'char_string' do
    expect(@translator.char_string("a")).to eq("0.....")
    expect(@translator.char_string("g")).to eq("0000..")
    expect(@translator.char_string("r")).to eq("0.000.")
    expect(@translator.char_string("z")).to eq("0..000")
    expect(@translator.char_string("w")).to eq(".000.0")
  end

  # it 'formatted' do
  #   expect(@translator.formatted("a")).to eq("0.\n..\n..")
  #   expect(@translator.formatted("g")).to eq("00\n00\n..")
  #   expect(@translator.formatted("r")).to eq("0.\n00\n0.")
  #   expect(@translator.formatted("z")).to eq("0.\n.0\n00")
  #   expect(@translator.formatted("w")).to eq(".0\n00\n.0")
  # end

  it 'makes an arry of individual characters from incoming text' do
    expect(@translator.chars).to eq(["a", "p", "p", "l", "e"])
  end

  it 'row_1' do
    expect(@translator.row_1).to eq("0.00000.0.")
  end

  it 'row_2' do
    expect(@translator.row_2).to eq("..0.0.0..0")
  end

  it 'row_3' do
    expect(@translator.row_3).to eq("..0.0.0...")
  end


end

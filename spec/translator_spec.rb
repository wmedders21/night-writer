require 'pry'
require 'rspec'
require 'simplecov'
require './lib/translator'
require './lib/dictionary'

SimpleCov.start

RSpec.describe Translator do
  before :each do
    @braille = Dictionary.new
    @translator = Translator.new("a", @braille)
  end

  it 'exists' do
    expect(@translator).to be_a(Translator)
  end

  it 'has attributes' do
    expect(@translator.text).to eq("a")
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

  it 'braille_strings' do
    expect(@translator.braille_strings("a")).to eq("0.....")
    expect(@translator.braille_strings("g")).to eq("0000..")
    expect(@translator.braille_strings("r")).to eq("0.000.")
    expect(@translator.braille_strings("z")).to eq("0..000")
    expect(@translator.braille_strings("w")).to eq(".000.0")
  end
end

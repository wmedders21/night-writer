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
end

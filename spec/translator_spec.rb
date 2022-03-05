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
    expect(@translator.find_register("a")).to eq(@braille.character_hash[:register1])
  end
end

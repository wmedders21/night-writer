require 'pry'
require 'rspec'
require 'simplecov'
require './lib/to_braille'
require './lib/braille_dictionary'

SimpleCov.start

RSpec.describe ToBraille do
  before :each do
    @braille = BrailleDictionary.new
    @translator = ToBraille.new('apple', @braille)
  end

  it 'exists' do
    expect(@translator).to be_a(ToBraille)
  end

  it 'has attributes' do
    expect(@translator.text).to eq('apple')
    expect(@translator.dictionary).to be_a(BrailleDictionary)
  end

  it 'find character register' do
    expect(@translator.find_register('a')).to eq(:register1)
    expect(@translator.find_register('m')).to eq(:register2)
    expect(@translator.find_register('v')).to eq(:register3)
    expect(@translator.find_register('w')).to eq(:register4)
  end

  it 'find character index' do
    expect(@translator.find_character_index('a')).to eq(7)
    expect(@translator.find_character_index('k')).to eq(7)
    expect(@translator.find_character_index('u')).to eq(7)
    expect(@translator.find_character_index('g')).to eq(0)
  end

  it 'convert to 4 digit binary' do
    expect(@translator.make_binary('a')).to eq('0111')
    expect(@translator.make_binary('q')).to eq('0000')
    expect(@translator.make_binary('z')).to eq('0110')
    expect(@translator.make_binary('w')).to eq('1000')
    expect(@translator.make_binary(' ')).to eq('1111')
  end

  it 'add_register' do
    expect(@translator.add_register('a')).to eq('011111')
    expect(@translator.add_register('g')).to eq('000011')
    expect(@translator.add_register('r')).to eq('010001')
    expect(@translator.add_register('z')).to eq('011000')
    expect(@translator.add_register('w')).to eq('100010')
    expect(@translator.add_register(' ')).to eq('111111')
  end

  it 'char_string' do
    expect(@translator.char_string('a')).to eq('0.....')
    expect(@translator.char_string('g')).to eq('0000..')
    expect(@translator.char_string('r')).to eq('0.000.')
    expect(@translator.char_string('z')).to eq('0..000')
    expect(@translator.char_string('w')).to eq('.000.0')
  end

  it 'makes an arry of individual characters from incoming text' do
    expect(@translator.chars).to eq(%w[a p p l e])
  end

  it 'row_1' do
    expect(@translator.row_1).to eq('0.00000.0.')
  end

  it 'row_2' do
    expect(@translator.row_2).to eq('..0.0.0..0')
  end

  it 'row_3' do
    expect(@translator.row_3).to eq('..0.0.0...')
  end

  it 'formatted' do
    expect(@translator.formatted).to eq(['0.00000.0.', "\n", '..0.0.0..0', "\n", '..0.0.0...', "\n"])
  end

  it 'translate' do
    expect(ToBraille.translate('orange',
                               @braille)).to eq("0.0.0.00000.\n.000...000.0\n0.0...0.....\n")
    expect(ToBraille.translate('qwertyuiopasdfghjklzxcvbnmqwertyuiopasklzxcvbnmewoinfnrjoefonweofnweonfewo',
                               @braille).class).to eq(String)
  end

  it 'can only print 80 characters in a row' do
    long_text = ToBraille.new(
      'qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghj
                                klzxcvbnmewoinfnrjoefonweofnweonfewo', @braille
    )
    expect(long_text.chars.count).to be < 81
  end
end

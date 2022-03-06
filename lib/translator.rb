require 'pry'
class Translator
  attr_reader :dictionary
  attr_accessor :text

  def initialize(text, dictionary)
    @text = text
    @dictionary = dictionary
  end

  def find_register(character)
    @dictionary.character_hash.map do |k, v|
      k if v.any?(character)
    end.compact.first
  end

  def find_character_index(character)
    @dictionary.character_hash.map do |k, v|
      v if v.any?(character)
    end.compact.first.index(character)
  end

  def make_binary(character)
    '%04b' % find_character_index(character)
  end

  def add_register(character)
    register = find_register(character)
    if register == :register1
      register = '11'
    elsif register == :register2
      register = '01'
    elsif register == :register3
      register = '00'
    elsif register == :register4
      register = '10'
    end
    make_binary(character).insert(4, register)
  end

  def char_string(character)
    add_register(character).gsub('1', '.')
  end

  def chars
    @text.delete("\n").split(//).take(40)
  end

  def row_1
    chars.map { |char| char_string(char)[0..1] }.join
  end

  def row_2
    chars.map { |char| char_string(char)[2..3] }.join
  end

  def row_3
    chars.map { |char| char_string(char)[4..5] }.join
  end

  def formatted
    [row_1, "\n", row_2, "\n", row_3, "\n"]
  end

  def self.translate(text, dictionary)
    translator = Translator.new(text, dictionary)
    rows = []
    until text.length < 40
      rows << translator.formatted
      text.slice!(0..39).split(//)
    end
    rows << translator.formatted
    rows.join
  end
end

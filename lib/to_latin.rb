require 'pry'
class ToLatin
  attr_reader :dictionary
  attr_accessor :text

  def initialize(text, dictionary)
    @text = text
    @dictionary = dictionary
  end
end

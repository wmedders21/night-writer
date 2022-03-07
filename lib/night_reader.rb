require 'pry'
require './lib/to_latin'
require './lib/latin_dictionary'
require './lib/io'

latin = LatinDictionary.new
io = IO.new(ARGV)
translated = ToLatin.new(io.get_text, latin)
rendered_text = translated.formatted
puts io.make_statement
io.make_new_file(rendered_text)

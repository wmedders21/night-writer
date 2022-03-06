require 'pry'
require './lib/translator'
require './lib/dictionary'

opener = File.open(ARGV[0], 'r')
incoming_text = opener.read.downcase
puts "Created '#{ARGV[1]}' containing #{incoming_text.length} characters"
opener.close
braille = Dictionary.new
rendered_text = Translator.translate(incoming_text, braille)
writer = File.open(ARGV[1], 'w')
writer.write(rendered_text)
writer.close

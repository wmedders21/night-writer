require 'pry'
require './lib/translator'
require './lib/dictionary'
require './lib/readable'
require './lib/writeable'

include Readable
include Writeable

latin = Latin.new
translated = ToLatin.new(read, latin)
rendered_text = translated.formatted
write(rendered_text)

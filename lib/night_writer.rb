opener = File.open(ARGV[0], "r")
incoming_text = opener.read
opener.close
puts incoming_text

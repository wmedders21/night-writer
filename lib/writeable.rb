module Writeable
  
  def write(input)
    writer = File.open(ARGV[1], 'w')
    writer.write(input)
    writer.close
  end
end

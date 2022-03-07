class IO
  attr_reader :text

  def initialize(arg_array)
    @arg_array = arg_array
    @text = ''
  end

  def get_text
    opener = File.open(@arg_array[0], 'r')
    incoming_text = opener.read.downcase
    opener.close
    @text = incoming_text
  end

  def make_statement
    "Created '#{@arg_array[1]}' containing #{@text.length} characters"
  end

  def make_new_file(input)
    writer = File.open(@arg_array[1], 'w')
    writer.write(input)
    writer.close
  end
end

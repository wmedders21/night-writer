class Dictionary
  attr_reader :character_hash
  def initialize
    @character_hash = {
      :register1 => ["g", "f", "d", "c", "h", "b", "e", "a", "j", "i"],
      :register2 => ["q", "p", "n", "m", "r", "l", "o", "k", "t", "s"],
      :register3 => [nil, nil, "y", "x", nil, "v", "z", "u", nil, nil],
      :register4 => [nil, nil, nil, nil, nil, nil, nil, nil, "w", nil]
    }
  end
end

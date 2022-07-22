class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
  }

  def self.valid_pegs?(chars)
    chars.each do |ele|
      if POSSIBLE_PEGS.has_key?(ele.upcase)
        next
      else
        return false
      end
    end
    true
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map { |ele| ele.upcase }
    else
      raise "pegs are invalid"
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    random_pegs = []
    (1..length).each do |ele|
      random_pegs << POSSIBLE_PEGS.keys.sample
    end
    Code.new(random_pegs)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0

    (0...guess.length).each do |i|
      if guess[i] == @pegs[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess_new = []
    pegs_new = []

    (0...guess.length).each do |i|
      if guess[i] != @pegs[i]
        guess_new << guess[i]
        pegs_new << pegs[i]
      end
    end
    (0...guess_new.length).each do |i|
      if pegs_new.include?(guess_new[i])
        index = pegs_new.index(guess_new[i])
        pegs_new[index] = nil
        count += 1
      end
    end
    count
  end

  def ==(other_code)
    self.length == other_code.length && num_exact_matches(other_code) == self.length
  end
end

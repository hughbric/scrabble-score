class Scrabble
  def initialize(word)
    @letters = sanitize(word)
  end

  def score
    letters.chars.map { |letter| letter_values[letter] }.sum
  end

  def self.score(word)
    new(word).score
  end

  def letter_values
    Hash[*LETTER_VALUES.map do |letters, value|
      letters.map { |letter| [letter, value] }
    end.flatten]
  end

  LETTER_VALUES = {
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }

  private

  attr_reader :letters

  def sanitize(str)
    String(str).strip.upcase    
  end
end
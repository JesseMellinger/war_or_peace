require './card'

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def cards
    cards = []
    File.open(filename).readlines.each do |line|
      line = line.chomp!.split(',')
      cards << Card.new(line[1].to_sym, line[0], line[2].to_i)
    end
    cards.shuffle!
  end

end


class Board < ActiveRecord::Base
  has_many :links

  def self.select_boards
    all.map { |category| [board.category, board.id] }
  end
end

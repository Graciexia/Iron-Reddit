class Comment < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  belongs_to :link

  def self.select_comments
    all.map { |comment| [comment.body, comment.id] }
  end
end

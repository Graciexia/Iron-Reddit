class Link < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  belongs_to :board

  def self.select_links
    all.map { |link| [link.title, link.post, link.id] }
  end

end

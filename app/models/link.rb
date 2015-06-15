class Link < ActiveRecord::Base
  has_many :comments
  has_many :votes
  belongs_to :user
  belongs_to :board
end

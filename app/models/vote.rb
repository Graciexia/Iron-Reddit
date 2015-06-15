class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  belongs_to :comment
end

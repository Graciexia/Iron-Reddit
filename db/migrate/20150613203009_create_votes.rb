class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :number
      t.string :voter_user_id
      t.string :vote_direction
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :link, index: true, foreign_key: true
      t.belongs_to :comment, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

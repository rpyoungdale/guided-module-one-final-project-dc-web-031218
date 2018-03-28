class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :sport_id
      t.integer :user_score
      t.integer :opponent_score
      t.string :result
      t.datetime :date
    end    
  end
end

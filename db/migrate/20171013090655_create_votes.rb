class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.string :category
      t.integer :work_id
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end

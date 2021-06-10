class CreateBuddyships < ActiveRecord::Migration[6.0]
  def change
    create_table :buddyships do |t|
      t.string :buddy_a
      t.string :buddy_b

      t.timestamps
    end
  end
end

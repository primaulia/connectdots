class CreateBuddyRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :buddy_requests do |t|
      t.string :requestor
      t.string :receiver

      t.timestamps
    end
  end
end

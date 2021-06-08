class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :provider
      t.string :title
      t.integer :duration
      t.string :provider_url
      t.integer :hours_per_week
      t.float :cost

      t.timestamps
    end
  end
end

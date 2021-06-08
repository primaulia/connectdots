class CreateTopicTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_tracks do |t|
      t.references :topic, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true

      t.timestamps
    end
  end
end

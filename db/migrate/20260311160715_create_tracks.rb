class CreateTracks < ActiveRecord::Migration[8.0]
  def change
    create_table :tracks do |t|
      t.references :project, null: false, foreign_key: true
      t.string :title
      t.integer :track_number
      t.string :main_artist
      t.text :featured_artists
      t.text :producers
      t.text :hook_chorus_bridge
      t.text :verses
      t.text :video_concept
      t.string :videographer
      t.string :director
      t.text :marketing_plan
      t.text :main_concept

      t.timestamps
    end
  end
end

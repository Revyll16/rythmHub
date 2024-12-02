class CreateCompositions < ActiveRecord::Migration[7.1]
  def change
    create_table :compositions do |t|
      t.string :title
      t.string :video_url
      t.text :description
      t.references :musician, null: false, foreign_key: true

      t.timestamps
    end
  end
end

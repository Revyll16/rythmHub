class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :forum, null: false, foreign_key: true
      t.references :musician, null: false, foreign_key: true

      t.timestamps
    end
  end
end

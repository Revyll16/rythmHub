class CreateFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.references :musician, null: false, foreign_key: true
      t.references :composition, null: false, foreign_key: true

      t.timestamps
    end
  end
end

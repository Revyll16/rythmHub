class CreateMusicians < ActiveRecord::Migration[7.1]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :instrument
      t.text :bio

      t.timestamps
    end
  end
end

class CreateCompositionInstruments < ActiveRecord::Migration[7.1]
  def change
    create_table :composition_instruments do |t|
      t.references :composition, null: false, foreign_key: true
      t.references :instrument, null: false, foreign_key: true

      t.timestamps
    end
  end
end

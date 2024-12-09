class CreateJoinTableMusiciansInstruments < ActiveRecord::Migration[7.1]
  def change
    create_join_table :musicians, :instruments do |t|
      # t.index [:musician_id, :instrument_id]
      # t.index [:instrument_id, :musician_id]
    end
  end
end

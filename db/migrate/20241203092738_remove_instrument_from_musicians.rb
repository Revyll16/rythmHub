class RemoveInstrumentFromMusicians < ActiveRecord::Migration[7.1]
  def change
    remove_column :musicians, :instrument, :string
  end
end

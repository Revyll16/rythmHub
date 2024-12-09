class AddInstrumentsToMusicians < ActiveRecord::Migration[7.1]
  def change
    add_column :musicians, :instruments, :string
  end
end

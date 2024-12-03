class UpdateForeignKeyOnCompositions < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :compositions, :musicians
    add_foreign_key :compositions, :musicians, on_delete: :cascade
  end
end

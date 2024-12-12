class AddTutorialToCompositions < ActiveRecord::Migration[7.1]
  def change
    add_column :compositions, :tutorial, :boolean
  end
end

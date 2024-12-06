class AddDetailsToMusicians < ActiveRecord::Migration[7.1]
  def change
    add_column :musicians, :image_url, :string
    add_column :musicians, :address, :string
  end
end

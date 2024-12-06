class AddImageUrlToForums < ActiveRecord::Migration[7.1]
  def change
    add_column :forums, :image_url, :string
  end
end

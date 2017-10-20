class AddImageUrlToClickbaits < ActiveRecord::Migration[5.1]
  def change
    add_column :clickbaits, :image_url, :string
  end
end

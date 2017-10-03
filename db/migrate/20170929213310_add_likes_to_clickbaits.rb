class AddLikesToClickbaits < ActiveRecord::Migration
  def change
    add_column :clickbaits, :likes, :integer, default: 0
  end
end

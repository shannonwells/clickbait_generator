class RemoveIsSingular < ActiveRecord::Migration
  def change
    remove_column :nouns, :is_singular
  end
end

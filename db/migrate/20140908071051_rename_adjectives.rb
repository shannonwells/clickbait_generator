class RenameAdjectives < ActiveRecord::Migration
  def change
    rename_table :adjectives, :superlatives
    create_table :adjectives do |t|
      t.string :value
    end
  end
end

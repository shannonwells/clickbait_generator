class PersistClickbaits < ActiveRecord::Migration
  def change
    create_table :clickbaits do |t|
      t.string :headline
      t.string :headline_type
      t.text :tags, array: true
      t.timestamps null: false
    end
  end
end

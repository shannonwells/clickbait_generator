class CreatePermalinks < ActiveRecord::Migration
  def change
    create_table :permalinks do |t|
      t.string :headline

      t.timestamps null: false
    end
  end
end

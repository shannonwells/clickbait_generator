class CreateHeadlines < ActiveRecord::Migration[5.1]
  def up
    create_table :headlines do |t|
      t.text :headline, unique: true, null: false
    end
  end

  def down
    drop_table :headlines
  end
end

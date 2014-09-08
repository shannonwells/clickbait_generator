class CreateVerbTable < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string :value
    end
  end
end

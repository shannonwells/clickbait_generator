class AddAgency < ActiveRecord::Migration
  def change
    add_column :nouns, :is_agent, :boolean, :default => false
    add_column :verbs, :needs_agent, :boolean, :default => true
  end
end

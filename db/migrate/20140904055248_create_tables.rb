class CreateTables < ActiveRecord::Migration
  def change
    create_table 'nouns' do |t|
      t.string 'value'
      t.boolean 'is_singular', default: true
      t.boolean 'is_proper', default: false
    end
    create_table 'predicates' do |t|
      t.string 'value'
    end
    create_table 'firsts' do |t|
      t.string 'value'
    end
    create_table 'nexts' do |t|
      t.string 'value'
    end
    create_table 'particles' do |t|
      t.string 'value'
      t.boolean 'is_singular', default: true
    end
    create_table 'adjectives' do |t|
      t.string 'value'
    end
  end
end

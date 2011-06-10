class CreateModels < ActiveRecord::Migration
  def self.up 
    create_table :users, :force => true do |t|
      t.string :name
      t.string :slug
    end

    create_table :stores, :force => true do |t|
      t.string :title
      t.string :slug
      t.integer :deleted, :default => 0
    end

  end

end

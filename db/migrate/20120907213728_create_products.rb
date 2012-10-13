class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :description
      t.string :source
      t.boolean :featured, :default => false
      t.boolean :display, :default => false
      t.string :creator
      t.string :referer
      t.string :contact
      t.string :image
      
      t.timestamps
    end
  end
end

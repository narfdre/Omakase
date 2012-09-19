class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :source
      t.string :merchant
      t.boolean :featured
      t.boolean :display
      t.string :artist
      t.string :referer
      t.string :contact
      
      t.timestamps
    end
  end
end

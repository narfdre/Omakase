class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.binary :image
      t.string :source
      t.string :merchant
      t.boolean :featured
      t.boolean :display
      t.string :artist
      t.references :user

      t.timestamps
    end
  end
end

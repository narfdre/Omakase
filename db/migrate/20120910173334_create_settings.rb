class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :app_name
      t.string :product_type
      t.string :description
      t.boolean :simple, :default => false

      t.timestamps
    end
  end
end

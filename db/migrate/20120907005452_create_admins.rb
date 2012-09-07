class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :credentials
      t.string :provider
      t.belongs_to :users

      t.timestamps
    end
  end
end

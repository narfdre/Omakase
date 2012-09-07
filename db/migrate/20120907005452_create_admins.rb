class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :credentials
      t.string :provider
      t.User :belongs_to

      t.timestamps
    end
  end
end

class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :login_id, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end

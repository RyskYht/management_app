class CreateFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :families do |t|
      t.references :school, null: false, foreign_key: true
      t.string :login_id, null: false
      t.string :password_digest, null: false
      t.string :name
      t.string :email
      t.string :address
      t.string :tel
      t.text :memo

      t.timestamps
    end
  end
end

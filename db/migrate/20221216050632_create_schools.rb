class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.references :manager, null: false, foreign_key: true
      t.string :login_id, null: false
      t.string :password_digest, null: false
      t.string :name
      t.string :email
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.references :school, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.string :login_id, null: false
      t.string :password_digest, null: false
      t.string :name
      t.string :email
      t.string :tel
      t.date :birthday
      t.string :school_name
      t.string :grade
      t.date :admission_date
      t.date :expulsion_date
      t.text :memo

      t.timestamps
    end
  end
end

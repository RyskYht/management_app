class CreateTuitions < ActiveRecord::Migration[7.0]
  def change
    create_table :tuitions do |t|
      t.references :school, null: false, foreign_key: true
      t.references :family, null: false, foreign_key: true
      t.string :title
      t.date :month
      t.integer :amount
      t.date :deadline_date
      t.date :payment_date

      t.timestamps
    end
  end
end

class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.references :school, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.string :name
      t.datetime :start
      t.datetime :end
      t.text :content
      t.integer :hourly_pay
      t.integer :monthly_pay
      t.date :month

      t.timestamps
    end
  end
end

class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.references :school, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :content
      t.boolean :read

      t.timestamps
    end
  end
end

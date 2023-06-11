class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.string :name, presence: true, null: false
      t.string :role, presence: true, null: false
      t.string :email, unique: true, null: false
      t.text :description
      t.date :date, presence: true, null: false
      t.time :start_at, presence: true, null: false
      t.time :end_at, presence: true, null: false
      t.string :roomtype, presence: true, null: false

      t.timestamps
    end
  end
end

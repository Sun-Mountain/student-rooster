class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.string :name,       null: false, default: ""
      t.date :start_date,   null: false, default: Date.today
      t.date :end_date
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end

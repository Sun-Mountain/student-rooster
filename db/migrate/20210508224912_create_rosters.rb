class CreateRosters < ActiveRecord::Migration[6.1]
  def change
    create_table :rosters do |t|
      t.date :begin_date
      t.date :end_date
      t.belongs_to :student, foreign_key: true
      t.belongs_to :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end

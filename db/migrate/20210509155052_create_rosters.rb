class CreateRosters < ActiveRecord::Migration[6.1]
  def change
    create_table :rosters do |t|
      t.date :begin_date
      t.date :end_date
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end

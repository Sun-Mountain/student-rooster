class CreateUniqueRosters < ActiveRecord::Migration[6.1]
  def change
    create_table :unique_rosters do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :roster, null: false, foreign_key: true
      t.belongs_to :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUniqueRosterLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :unique_roster_links do |t|
      t.references :student, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true
      t.references :roster, null: false, foreign_key: true
      t.references :unique_roster, null: false, foreign_key: true

      t.timestamps
    end
  end
end

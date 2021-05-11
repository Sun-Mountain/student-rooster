class CreateUniqueRosters < ActiveRecord::Migration[6.1]
  def change
    create_table :unique_rosters do |t|
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUniqueRosters < ActiveRecord::Migration[6.1]
  def change
    create_table :unique_rosters do |t|
      t.int

      t.timestamps
    end
  end
end

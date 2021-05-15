class CreateRosters < ActiveRecord::Migration[6.1]
  def change
    create_table :rosters do |t|
      t.string :name
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end

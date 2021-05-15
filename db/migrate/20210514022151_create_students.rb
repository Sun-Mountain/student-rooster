class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

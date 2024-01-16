class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name,  null: false, default: ''
      t.string :contact,    null: false, default: ''
      t.references :team,   null: false, foreign_key: true

      t.timestamps
    end
  end
end

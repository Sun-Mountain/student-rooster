class CreateRosterStudentLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :roster_student_links do |t|
      t.references :roster, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end

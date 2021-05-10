class CreateLessonStudentLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_student_links do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateLessonRosterItems < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_roster_items do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :roster, null: false, foreign_key: true

      t.timestamps
    end
  end
end

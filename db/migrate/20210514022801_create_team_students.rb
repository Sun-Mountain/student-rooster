class CreateTeamStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :team_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTeamLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :team_lessons do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

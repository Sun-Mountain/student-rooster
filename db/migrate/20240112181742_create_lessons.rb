class CreateLessons < ActiveRecord::Migration[7.1]
  def change
    create_table :lessons do |t|
      t.string :title,    null: false, default: ""
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

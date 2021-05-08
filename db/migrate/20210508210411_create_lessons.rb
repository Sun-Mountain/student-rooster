class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
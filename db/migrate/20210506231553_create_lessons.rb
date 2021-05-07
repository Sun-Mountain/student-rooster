class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
  end
end

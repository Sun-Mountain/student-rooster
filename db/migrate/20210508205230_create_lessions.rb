class CreateLessions < ActiveRecord::Migration[6.1]
  def change
    create_table :lessions do |t|
      t.string :name
      t.text :description
      t.references :teams, null: false, foreign_key: true

      t.timestamps
    end
  end
end

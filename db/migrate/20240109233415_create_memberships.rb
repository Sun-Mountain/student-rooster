class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships do |t|
      t.references :team,     null: false,  foreign_key: true
      t.references :user,     null: true,   foreign_key: true
      t.string :email,        null: false,  default: ''
      t.boolean :accepted,    null: true
      t.boolean :no_account,  null: false,  default: true
      t.integer :invited_by,  null: false

      t.timestamps
    end
  end
end

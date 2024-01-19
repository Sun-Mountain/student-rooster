class CreateMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :memberships do |t|
      t.references :team,     null: false,  foreign_key: true
      t.references :user,     null: true,   foreign_key: true
      t.string :email,        null: false,  default: ''
      t.boolean :accepted,    null: false,  default: false
      t.boolean :no_account,  null: false,  default: true

      t.timestamps
    end
  end
end

class AddColumnsToMemberships < ActiveRecord::Migration[7.1]
  def change
    add_column :memberships, :email, :string, null: false, default: ''
    add_column :memberships, :accepted, :boolean, null: false, default: false
  end
end

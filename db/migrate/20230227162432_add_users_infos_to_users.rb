class AddUsersInfosToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :team, :string
    add_column :users, :avatar, :string
    add_column :users, :phone_number, :string
  end
end

class AddSellerAddressToUserModel < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :seller_address, :string
  end
end

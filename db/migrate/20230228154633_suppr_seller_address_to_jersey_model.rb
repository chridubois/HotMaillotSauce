class SupprSellerAddressToJerseyModel < ActiveRecord::Migration[7.0]
  def change
    remove_column :jerseys, :seller_address
  end
end

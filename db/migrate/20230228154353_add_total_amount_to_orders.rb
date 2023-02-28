class AddTotalAmountToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :total_amount, :float
  end
end

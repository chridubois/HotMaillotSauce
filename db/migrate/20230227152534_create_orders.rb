class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :begin_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.references :jersey, null: false, foreign_key: true

      t.timestamps
    end
  end
end

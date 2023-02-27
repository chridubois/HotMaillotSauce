class CreateJerseys < ActiveRecord::Migration[7.0]
  def change
    create_table :jerseys do |t|
      t.string :team
      t.string :player
      t.integer :year
      t.string :state
      t.string :description
      t.string :photo
      t.integer :number
      t.float :price_per_day
      t.string :seller_address

      t.timestamps
    end
  end
end

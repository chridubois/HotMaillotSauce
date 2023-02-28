class AddSizeToJerseys < ActiveRecord::Migration[7.0]
  def change
    add_column :jerseys, :size, :string
  end
end

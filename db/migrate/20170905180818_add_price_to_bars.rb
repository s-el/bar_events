class AddPriceToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :price_level, :integer
  end
end

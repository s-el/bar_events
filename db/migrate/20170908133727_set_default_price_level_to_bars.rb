class SetDefaultPriceLevelToBars < ActiveRecord::Migration[5.0]
  def change
    change_column_default :bars, :price_level, 1
  end
end

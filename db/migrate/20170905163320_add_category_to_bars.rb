class AddCategoryToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :category, :string
  end
end

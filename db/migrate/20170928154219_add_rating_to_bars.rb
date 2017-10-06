class AddRatingToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :bar_rating, :integer, default: 0, null: false
  end
end

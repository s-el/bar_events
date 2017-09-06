class AddRatingToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :rating, :integer
  end
end

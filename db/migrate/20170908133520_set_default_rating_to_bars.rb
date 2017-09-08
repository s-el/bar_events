class SetDefaultRatingToBars < ActiveRecord::Migration[5.0]
  def change
    change_column_default :bars, :rating, 0
  end
end

class RemoveAttendanceFromReviews < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :attendance, foreign_key: true
  end
end

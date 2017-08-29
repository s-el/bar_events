class AddUserColumnToAttendances < ActiveRecord::Migration[5.0]
  def change
    add_reference :attendances, :user, foreign_key: true
    remove_reference(:attendances, :review, index: true)
  end
end

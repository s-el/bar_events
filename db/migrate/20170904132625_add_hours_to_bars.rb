class AddHoursToBars < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :mon_start, :time
    add_column :bars, :mon_end, :time
    add_column :bars, :tues_start, :time
    add_column :bars, :tues_end, :time
    add_column :bars, :wed_start, :time
    add_column :bars, :wed_end, :time
    add_column :bars, :thurs_start, :time
    add_column :bars, :thurs_end, :time
    add_column :bars, :fri_start, :time
    add_column :bars, :fri_end, :time
    add_column :bars, :sat_start, :time
    add_column :bars, :sat_end, :time
    add_column :bars, :sun_start, :time
    add_column :bars, :sun_end, :time
  end
end

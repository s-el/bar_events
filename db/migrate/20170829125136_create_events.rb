class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :category
      t.string :title
      t.string :description
      t.date :date
      t.time :start_time
      t.time :end_time
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end

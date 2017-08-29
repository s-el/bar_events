class CreateBars < ActiveRecord::Migration[5.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :website
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

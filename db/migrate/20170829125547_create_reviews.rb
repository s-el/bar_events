class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.references :attendance, foreign_key: true

      t.timestamps
    end
  end
end

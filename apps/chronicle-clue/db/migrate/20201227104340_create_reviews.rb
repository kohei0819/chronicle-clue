class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :content, null: false, foreign_key: true
      t.integer :score
      t.string :comment
      t.date :watch_date
      t.references :watch_method, null: false, foreign_key: true
      t.references :watch_with, null: false, foreign_key: true

      t.timestamps
    end
  end
end

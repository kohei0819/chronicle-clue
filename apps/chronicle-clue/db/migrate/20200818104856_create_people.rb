class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.references :content, null: false, foreign_key: true
      t.integer :gender
      t.integer :blood
      t.date :birthday
      t.string :come_from

      t.timestamps
    end
  end
end

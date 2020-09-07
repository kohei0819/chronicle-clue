class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :name_jpn
      t.string :mark
      t.integer :parent
      t.integer :sort

      t.timestamps
    end
  end
end

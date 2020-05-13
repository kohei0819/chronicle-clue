class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :name
      t.string :name_jpn
      t.string :mark
      t.integer :sort

      t.timestamps
    end
  end
end

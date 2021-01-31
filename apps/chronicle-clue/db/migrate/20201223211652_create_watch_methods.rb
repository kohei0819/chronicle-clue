class CreateWatchMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :watch_methods do |t|
      t.string :name
      t.string :name_jpn
      t.integer :sort

      t.timestamps
    end
  end
end

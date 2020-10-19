class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.references :medium, null: false, foreign_key: true
      t.string :name
      t.string :name_jpn
      t.string :name_kana
      t.text :introduction
      t.integer :status

      t.timestamps
    end
  end
end

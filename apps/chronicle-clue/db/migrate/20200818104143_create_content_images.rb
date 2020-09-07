class CreateContentImages < ActiveRecord::Migration[6.0]
  def change
    create_table :content_images do |t|
      t.references :content, null: false, foreign_key: true
      t.string :path

      t.timestamps
    end
  end
end

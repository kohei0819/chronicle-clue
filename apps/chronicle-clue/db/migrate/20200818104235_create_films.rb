class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.references :content, null: false, foreign_key: true
      t.text :outline
      t.text :story
      t.string :original
      t.string :website
      t.date :opendate
      t.integer :running_time
      t.string :productino
      t.string :distributed
      t.string :budget
      t.string :box_office

      t.timestamps
    end
  end
end

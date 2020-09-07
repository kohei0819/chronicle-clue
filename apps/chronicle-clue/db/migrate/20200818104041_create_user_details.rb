class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname
      t.integer :sex
      t.string :blood
      t.date :birthday

      t.timestamps
    end
  end
end

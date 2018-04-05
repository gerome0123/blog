class CreateAuthor < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :fname, null: false, default: ''
      t.string :lname, null: false, default: ''
      t.integer :age, null: false, default: ''
    end
  end
end

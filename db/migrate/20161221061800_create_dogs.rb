class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.references :breed, index: true
      t.references :color, index: true
      t.text :description
      t.string :gender
      t.string :size
      t.string :age
      t.string :picture
      t.date :date
      t.time :time
      t.string :status
      t.references :user, index: true
      t.integer :reward
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :dogs, :breeds
    add_foreign_key :dogs, :colors
    add_foreign_key :dogs, :users
  end
end

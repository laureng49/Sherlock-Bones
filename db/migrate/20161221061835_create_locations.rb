class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.references :dog, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :locations, :dogs
    add_foreign_key :locations, :users
  end
end

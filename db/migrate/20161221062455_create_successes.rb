class CreateSuccesses < ActiveRecord::Migration
  def change
    create_table :successes do |t|
      t.float :latitude
      t.float :longitude
      t.float :time_lost
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :successes, :users
  end
end

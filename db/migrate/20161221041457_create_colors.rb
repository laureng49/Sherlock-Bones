class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :color
      t.string :hex

      t.timestamps null: false
    end
  end
end

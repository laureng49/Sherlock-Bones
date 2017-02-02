class AddAddressToSuccesses < ActiveRecord::Migration
  def change
    add_column :successes, :address, :string
  end
end

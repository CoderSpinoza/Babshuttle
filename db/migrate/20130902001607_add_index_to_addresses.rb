class AddIndexToAddresses < ActiveRecord::Migration
  def change
  	add_index :addresses, [:street, :apt, :zipcode]
  end
end

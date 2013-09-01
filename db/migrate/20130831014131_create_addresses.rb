class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.references :user
      t.string :street
      t.string :apt
      t.string :zipcode

      t.timestamps
    end
  end
end

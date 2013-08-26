class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :unit
      t.float :amount
      t.references :brand
      t.timestamps	
    end
  end
end

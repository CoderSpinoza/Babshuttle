class CreateDeliverySessions < ActiveRecord::Migration
  def change
    create_table :delivery_sessions do |t|
      t.string :day
      t.string :location
      t.integer :start
      t.integer :end
      t.references :driver, class_name: "User"
      t.timestamps
    end
  end
end

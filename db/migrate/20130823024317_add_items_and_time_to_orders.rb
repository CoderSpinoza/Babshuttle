class AddItemsAndTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :items, :text, default: ""
    add_column :orders, :time, :timestamp
  end
end

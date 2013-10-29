class AddMarketToUsers < ActiveRecord::Migration
  def change
    add_column :users, :market, :string
  end
end

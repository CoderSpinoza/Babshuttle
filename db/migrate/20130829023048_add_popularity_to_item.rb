class AddPopularityToItem < ActiveRecord::Migration
  def change
    add_column :items, :popularity, :integer
  end
end

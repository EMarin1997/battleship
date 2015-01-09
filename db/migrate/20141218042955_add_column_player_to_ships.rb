class AddColumnPlayerToShips < ActiveRecord::Migration
  def change
    add_column :ships, :player, :integer
  end
end

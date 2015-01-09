class AddGameIdToShips < ActiveRecord::Migration
  def change
    add_column :ships, :game_id, :integer
  end
end

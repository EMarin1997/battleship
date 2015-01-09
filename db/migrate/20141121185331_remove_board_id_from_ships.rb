class RemoveBoardIdFromShips < ActiveRecord::Migration
  def change
  	remove_column :ships, :board_id
  end
end

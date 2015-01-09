class RemoveColumnGameIdFromBoards < ActiveRecord::Migration
  def change
  	remove_column :boards, :game_id
  end
end

class RemoveBoardIdFromAttacks < ActiveRecord::Migration
  def change
  	remove_column :attacks, :board_id
  end
end

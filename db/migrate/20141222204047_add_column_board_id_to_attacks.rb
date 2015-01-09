class AddColumnBoardIdToAttacks < ActiveRecord::Migration
  def change
    add_column :attacks, :board_id, :integer
  end
end

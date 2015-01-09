class AddGameIdToAttacks < ActiveRecord::Migration
  def change
    add_column :attacks, :game_id, :integer
  end
end

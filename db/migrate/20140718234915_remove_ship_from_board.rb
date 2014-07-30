class RemoveShipFromBoard < ActiveRecord::Migration
  def change
  	remove_column :boards, :ship
  end
end

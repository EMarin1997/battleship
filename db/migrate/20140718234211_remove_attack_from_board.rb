class RemoveAttackFromBoard < ActiveRecord::Migration
  def change
  	remove_column :boards, :attack 
  end
end

class AddEnemyToBoard < ActiveRecord::Migration
  def change
    add_column :boards, :enemy, :string
  end
end

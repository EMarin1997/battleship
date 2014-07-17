class CreateAttacks < ActiveRecord::Migration
  def change
    create_table :attacks do |t|
      t.string :point, null:false
      t.integer :board_id, null:false
    
      t.timestamps
    end
  end
end

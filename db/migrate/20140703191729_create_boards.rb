class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :ship
      t.string :attack

      t.timestamps
    end
  end
end

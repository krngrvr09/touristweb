class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :accessPoint
      t.string :name

      t.timestamps
    end
  end
end

class AddCreatedByIdToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :createdById, :integer
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :checkedIn

      t.timestamps
    end
  end
end
